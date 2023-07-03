import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/guest_main_page.dart';
import 'package:contentpub_admin/models/ModelProvider.dart';
import 'package:contentpub_admin/state_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'amplifyconfiguration.dart';
import 'package:http/http.dart' as http;

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  void userChecks() async {
    bool isSignedIn = await isUserSignedIn();

    if (isSignedIn) {
      processAuthUser();
    }
    // Do not forget to import the following for StreamSubscription

    Amplify.Hub.listen(HubChannel.Auth, (dynamic event) {
      processAuthEvents(event);
    });
  }

  void processAuthUser() async {
    StateContainer.of(context).authUser = await getCurrentUser();

    List<AuthUserAttribute> authUserAttributes =
        await Amplify.Auth.fetchUserAttributes();

    String email = "";
    for (var a in authUserAttributes) {
      print(a.userAttributeKey);
      print(a.value);
      if (a.userAttributeKey.key == 'email') {
        email = a.value;
      }
    }

    List<Customer?> customerList = await getCustomerObject(email);
    Customer customer;
    print('Customer list: $customerList}');
    if (customerList.isEmpty) {
      print('Customer list is empty');

      // stripe customer generation and putting into session

      http.Response initResponse = await http.post(
          Uri.parse(StateContainer.of(context).customerUrl ?? ''),
          body: jsonEncode(<String, String>{
            'email': email,
            'name': StateContainer.of(context).authUser.username
          }));

      print('Customer stripe sonuce geldi ${initResponse.body}');

      final String stripeId = jsonDecode(initResponse.body)['stripeId'];

      print('Stripe customer id: ${stripeId}');

      customer = Customer(
          userName: StateContainer.of(context).authUser.username,
          stripeId: stripeId,
          email: email,
          purchases: List.empty());

      print('Customer kaydedilecek');
      // bunu API ile yap ki webde de calissin:

      saveCustomerObject(customer);
      print('Customer kaydedildi');
    } else {
      customer = customerList.elementAt(0)!;
    }
  }

  void processAuthEvents(HubEvent hubEvent) async {
    print(hubEvent.eventName);

    switch (hubEvent.eventName) {
      case 'SIGNED_IN':
        print('HubEvent payload ${hubEvent.payload}');

        processAuthUser();
        break;
      case 'SIGNED_OUT':
        print('USER IS SIGNED OUT');
        break;
      case 'SESSION_EXPIRED':
        print('SESSION HAS EXPIRED');
        break;
      case 'USER_DELETED':
        print('USER HAS BEEN DELETED');
        break;
    }
  }

  Future<List<Customer?>> getCustomerObject(String email) async {
    String graphQLDocument = '''query MyQuery {
  listCustomers(filter: {email: {eq: "$email"}}) {
    items {
      id
      email
      stripeId
      userName
      updatedAt
      createDate
      purchases {
        items {
          id
          purchaseBundleId
          purchaseTenantId
          purchaseTime
          purchaseType
          source
          stripePaymentIntentId
          stripePriceId
          stripeProductId
          validTill
        }
      }
    }
  }
}
''';

    GraphQLRequest request = GraphQLRequest(document: graphQLDocument);

    var operation = await Amplify.API.query(request: request);

    var response = await operation.response;

    var data = response.data;

    var json = jsonDecode(data!)['listCustomers']['items'] as List;

    List<Customer> list = json.map((e) => Customer.fromJson(e)).toList();

    return list;
  }

  saveCustomerObject(Customer customer) async {
    final bundleSaveRequest = ModelMutations.create(customer);
    await Amplify.API.mutate(request: bundleSaveRequest);

    print(customer.id);
    print(customer.stripeId);
  }

  Future<bool> isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: false));
    return result.isSignedIn;
  }

  Future<AuthUser> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();

    return user;
  }

  void _configureAmplify() async {
    try {
      final authPlugin = AmplifyAuthCognito();
      // add Amplify plugins
      await Amplify.addPlugins([authPlugin]);
      final apiPlugin = AmplifyAPI(modelProvider: ModelProvider.instance);
      await Amplify.addPlugins([apiPlugin]);

      if (!kIsWeb) {
        final dataStorePlugin =
            AmplifyDataStore(modelProvider: ModelProvider.instance);

        await Amplify.addPlugins([dataStorePlugin]);
      }

      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);

      safePrint('Successfully configured');

      userChecks();
    } on Exception catch (e) {
      safePrint('Error configuring Amplify: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      // `authenticatorBuilder` is used to customize the UI for one or more steps
      authenticatorBuilder: (BuildContext context, AuthenticatorState state) {
        switch (state.currentStep) {
          case AuthenticatorStep.signIn:
            return CustomScaffold(
              state: state,
              // A prebuilt Sign In form from amplify_authenticator
              body: SignInForm(),
              // A custom footer with a button to take the user to sign up
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    onPressed: () => state.changeStep(
                      AuthenticatorStep.signUp,
                    ),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.signUp:
            return CustomScaffold(
              state: state,
              // A prebuilt Sign Up form from amplify_authenticator
              body: SignUpForm(),
              // A custom footer with a button to take the user to sign in
              footer: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account?'),
                  TextButton(
                    onPressed: () => state.changeStep(
                      AuthenticatorStep.signIn,
                    ),
                    child: const Text('Sign In'),
                  ),
                ],
              ),
            );
          case AuthenticatorStep.confirmSignUp:
            return CustomScaffold(
              state: state,
              // A prebuilt Confirm Sign Up form from amplify_authenticator
              body: ConfirmSignUpForm(),
            );
          case AuthenticatorStep.resetPassword:
            return CustomScaffold(
              state: state,
              // A prebuilt Reset Password form from amplify_authenticator
              body: ResetPasswordForm(),
            );
          case AuthenticatorStep.confirmResetPassword:
            return CustomScaffold(
              state: state,
              // A prebuilt Confirm Reset Password form from amplify_authenticator
              body: const ConfirmResetPasswordForm(),
            );
          default:
            // Returning null defaults to the prebuilt authenticator for all other steps
            return null;
        }
      },
      child: MaterialApp(
        builder: Authenticator.builder(),
        home: const Scaffold(
          body: Center(
            child: Text('You are logged in!'),
          ),
        ),
      ),
    );
  }
}

/// A widget that displays a logo, a body, and an optional footer.
class CustomScaffold extends StatelessWidget {
  const CustomScaffold({
    super.key,
    required this.state,
    required this.body,
    this.footer,
  });

  final AuthenticatorState state;
  final Widget body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://picsum.photos/600?image=1',
      'https://picsum.photos/600?image=2',
      'https://picsum.photos/600?image=3',
      'https://picsum.photos/600?image=4',
      'https://picsum.photos/600?image=5',
      'https://picsum.photos/600?image=6',
    ];

    return Scaffold(body: LayoutBuilder(builder: (context, constraints) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // App logo
              const Padding(
                padding: EdgeInsets.only(top: 32),
                child: Center(child: FlutterLogo(size: 100)),
              ),
              GuestMainPage(),
              Container(
                constraints: const BoxConstraints(maxWidth: 800),
                child: Column(
                  children: [body],
                ),
              ),
            ],
          ),
        ),
      );
      persistentFooterButtons:
      footer != null ? [footer!] : null;
    }));
  }
}

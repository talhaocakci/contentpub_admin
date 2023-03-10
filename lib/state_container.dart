import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;

import '../amplifyconfiguration.dart';
import '../models/ModelProvider.dart';

class StateContainer extends StatefulWidget {
  final Widget child;

  StateContainer({
    required this.child,
  });

  // This is the secret sauce. Write your own 'of' method that will behave
  // Exactly like MediaQuery.of and Theme.of
  // It basically says 'get the data from the widget of this type.
  static StateContainerState of(BuildContext context) {
    return (context
            .dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()!)
        .data;
  }

  @override
  StateContainerState createState() => StateContainerState();
}

class StateContainerState extends State<StateContainer> {
  Course originalCourse = Course();
  Course courseInModification = Course();
  Content? documentInModification;

  String? projectName;
  String? environment;
  String? appsyncId;
  String? apiRootUrl;
  String? apigatewayId;
  String? region;

  bool _isLoading = true;
  late AuthUser authUser;

  @override
  void initState() {
    _initializeApp();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }

  void changeLesson(int sectionIndex, int lessonIndex) {
    setState(() {});
  }

  void addLesson(int sectionIndex, int lessonIndex) {
    setState(() {});
  }

  Future<void> _initializeApp() async {
    // configure Amplify
    await _configureAmplify();

    setState(() {
      _isLoading = false; // important to set the state!
    });
  }

  Future<void> _configureAmplify() async {
    try {
      // amplify plugins

      final authPlugin = AmplifyAuthCognito();
      // add Amplify plugins
      await Amplify.addPlugins([authPlugin]);
      final apiPlugin = AmplifyAPI(modelProvider: ModelProvider.instance);
      await Amplify.addPlugins([apiPlugin]);

      var input =
          await rootBundle.loadString('assets/projectconfiguration.json');

      var map = jsonDecode(input);

      projectName = map['project'];
      environment = map['environment'];
      appsyncId = map['appsyncId'];
      apigatewayId = map['apigatewayId'];
      region = map['region'];

      apiRootUrl =
          'https://$apigatewayId.execute-api.$region.amazonaws.com/$environment';

      //  var themeStr = await rootBundle.loadString('themes/appainter_theme.json');
      //var themeJson = json.decode(themeStr);

      //theme = ThemeDecoder.decodeThemeData(themeJson) ?? ThemeData();

      if (!kIsWeb) {
        final dataStorePlugin =
            AmplifyDataStore(modelProvider: ModelProvider.instance);

        await Amplify.addPlugins([dataStorePlugin]);
      }

      // configure Amplify
      //
      // note that Amplify cannot be configured more than once!
      await Amplify.configure(amplifyconfig);

      bool isSignedIn = await isUserSignedIn();

      if (isSignedIn) {
        processAuthUser();
      }
      // Do not forget to import the following for StreamSubscription

      Amplify.Hub.listen(HubChannel.Auth, (dynamic event) {
        processAuthEvents(event);
      });
    } catch (e) {
      // error handling can be improved for sure!
      // but this will be sufficient for the purposes of this tutorial
      safePrint('An error occurred while configuring Amplify: $e');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<bool> isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    return result.isSignedIn;
  }

  Future<AuthUser> getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();

    return user;
  }

  String apigatewayBaseUrl() {
    return "https://$apigatewayId.execute-api.$region.amazonaws.com/$environment";
  }

  String getBucketName(bool public) {
    String visibility = (public) ? 'public' : 'restricted';

    String bucket = "$projectName-$environment-$visibility";

    return bucket;
  }

  void processAuthUser() async {
    authUser = await getCurrentUser();

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

      String customerUrl =
          "https://$apigatewayId.execute-api.$region.amazonaws.com/$environment/customer";

      http.Response initResponse = await http.post(Uri.parse(customerUrl),
          body: jsonEncode(
              <String, String>{'email': email, 'name': authUser.username}));

      print('Customer stripe sonuce geldi ${initResponse.body}');

      final String stripeId = jsonDecode(initResponse.body)['stripeId'];

      print('Stripe customer id: ${stripeId}');

      customer = Customer(
          userName: authUser.username,
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
}

class _InheritedStateContainer extends InheritedWidget {
  final StateContainerState data;

  // You must pass through a child and your state.
  _InheritedStateContainer({
    Key? key,
    required this.data,
    required Widget child,
  }) : super(key: key, child: child);

  // This is a built in method which you can use to check if
  // any state has changed. If not, no reason to rebuild all the widgets
  // that rely on your state.
  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}

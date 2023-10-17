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
    super.key,
    required this.child,
  });

  // This is the secret sauce. Write your own 'of' method that will behave
  // Exactly like MediaQuery.of and Theme.of
  // It basically says 'get the data from the widget of this type.
  static StateContainerState of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<_InheritedStateContainer>()!).data;
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

  late String coworkerId;
  late String tenantId;

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

      var input = await rootBundle.loadString('assets/projectconfiguration.json');

      var map = jsonDecode(input);

      projectName = map['project'];
      environment = map['environment'];
      appsyncId = map['appsyncId'];
      apigatewayId = map['apigatewayId'];
      region = map['region'];

      apiRootUrl = 'https://$apigatewayId.execute-api.$region.amazonaws.com/$environment';

      //  var themeStr = await rootBundle.loadString('themes/appainter_theme.json');
      //var themeJson = json.decode(themeStr);

      //theme = ThemeDecoder.decodeThemeData(themeJson) ?? ThemeData();

      if (!kIsWeb) {
        final dataStorePlugin = AmplifyDataStore(modelProvider: ModelProvider.instance);

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

    List<AuthUserAttribute> authUserAttributes = await Amplify.Auth.fetchUserAttributes();

    String email = "";
    for (var a in authUserAttributes) {
      print(a.userAttributeKey);
      print(a.value);
      if (a.userAttributeKey.key == 'email') {
        email = a.value;
      }
    }

    List<Coworker?> coworkerList = await getCoworkerObject(email);
    Coworker coworker;
    print('Coworker list: $coworkerList}');
    if (coworkerList.isEmpty) {
      print('Coworker list is empty');

      Coworker coworker = new Coworker(email: email, tenantID: this.tenantId ?? '');

      saveCoworkerObject(coworker);
      print('Coworker kaydedildi');
    } else {
      coworker = coworkerList.elementAt(0)!;

      this.coworkerId = coworker.id;
      this.tenantId = coworker.tenantID;
      print('tenant bulundu: ${this.tenantId}');
      setState(() {});
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

  Future<List<Coworker?>> getCoworkerObject(String email) async {
    String graphQLDocument = '''query MyQuery {
      listCoworkers(filter: {email: {eq: "$email"}}) {
        items {
          createdAt
          description
          displayName
          email
          id
          photoUrl
          updatedAt
          tenantID 
          role
        }
      }
    }

    ''';

    GraphQLRequest request = GraphQLRequest(document: graphQLDocument);

    var operation = await Amplify.API.query(request: request);

    var response = await operation.response;

    var data = response.data;

    var json = jsonDecode(data!)['listCoworkers']['items'] as List;

    List<Coworker> list = json.map((e) => Coworker.fromJson(e)).toList();

    return list;
  }

  saveCoworkerObject(Coworker coworker) async {
    final coworkerSaveRequest = ModelMutations.create(coworker);
    await Amplify.API.mutate(request: coworkerSaveRequest);

    print(coworkerSaveRequest.id);
  }

  Future<String> renderAllPages() async {
    AuthSession session = await Amplify.Auth.fetchAuthSession();

    var tokens = (session as CognitoAuthSession).userPoolTokens;
    var idToken = tokens?.idToken;

    String rawIdToken = idToken!.raw;

    //remote directory is implicitly contentId at the moment. Need to change it later on
    final initUri = Uri.parse("${apiRootUrl ?? ''}/content/render-pages");

    final headers = <String, String>{'Content-Type': 'application/json', 'Authorization': rawIdToken};

    http.Response response = await http.post(initUri, headers: headers);

    if (response.statusCode == 200) {
      return "";
    } else {}

    return '';
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

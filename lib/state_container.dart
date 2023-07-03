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
  String? customerUrl;

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

      var input =
          await rootBundle.loadString('assets/projectconfiguration.json');

      var map = jsonDecode(input);

      projectName = map['project'];
      environment = map['environment'];
      appsyncId = map['appsyncId'];
      apigatewayId = map['apigatewayId'];
      region = map['region'];

      customerUrl =
          "https://$apigatewayId.execute-api.$region.amazonaws.com/$environment/customer";

      apiRootUrl =
          'https://$apigatewayId.execute-api.$region.amazonaws.com/$environment';

      //  var themeStr = await rootBundle.loadString('themes/appainter_theme.json');
      //var themeJson = json.decode(themeStr);

      //theme = ThemeDecoder.decodeThemeData(themeJson) ?? ThemeData();
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

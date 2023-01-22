import 'package:amplify_api/amplify_api.dart';
import 'package:contentpub_admin/create_product.dart';
import 'package:flutter/material.dart';

import 'dart:io';
import 'dart:typed_data';

import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/amplifyconfiguration.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'dart:html' as html;

import 'package:file_picker/file_picker.dart';

import 'package:amplify_storage_s3/amplify_storage_s3.dart';

import 'models/ModelProvider.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Authenticator(
            child: MaterialApp(
      builder: Authenticator.builder(),
      home: Scaffold(
          body: Center(
        child: CreateProductWidget(),
      )),
    )));
  }
}

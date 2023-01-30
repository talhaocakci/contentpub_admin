import 'dart:html' as html;

import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:flutter/material.dart';

class ShowFileWidget extends StatefulWidget {
  String url;

  ShowFileWidget({required this.url, super.key});

  @override
  State<ShowFileWidget> createState() => _ShowFileWidgetState();
}

class _ShowFileWidgetState extends State<ShowFileWidget> {
  @override
  void initState() {
    print(widget.url);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Authenticator(
            child: MaterialApp(
      builder: Authenticator.builder(),
      home: Scaffold(
          body: Center(
        child: ElevatedButton(
          child: Text('Download'),
          onPressed: downloadButton(widget.url),
        ),
      )),
    )));
  }
}

downloadButton(String url) {
  html.AnchorElement anchorElement = html.AnchorElement(href: url);
  anchorElement.download = url;
  anchorElement.click();
}

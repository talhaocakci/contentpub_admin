import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/models/PublishProductModel.dart';
import 'package:contentpub_admin/models/PurchaseType.dart';
import 'package:flutter/material.dart';

import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'create_bundle.dart';

class EditableContent {
  final ContentType contentType;

  String? id;
  String? name;
  String? description;
  String? localFile;
  String? localVideoName;
  int? localFileSize;
  String? uploadedFileUrl;
  String? uploadedVideoAccessUrl;
  String? uploadMessage;
  bool? dirty;
  bool uploadInProgress = false;

  EditableContent({
    required this.contentType,
    this.id,
    this.name,
    this.description,
    this.localFile,
    this.localVideoName,
    this.localFileSize,
    this.uploadedFileUrl,
    this.uploadedVideoAccessUrl,
    this.uploadMessage,
    this.dirty,
    this.uploadInProgress = false,
  });
}

class CreateProductWidget extends StatefulWidget {
  @override
  _CreateProductWidgetState createState() => _CreateProductWidgetState();
}

class _CreateProductWidgetState extends State<CreateProductWidget> {
  int _currentStep = 1;
  StepperType stepperType = StepperType.horizontal;

  final contentTypes = ContentType.values.toList();

  EditableContent? editableContent;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Create Bundle to Sell Your Products'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: ScrollPhysics(),
                currentStep: _currentStep,
                onStepTapped: (step) => tapped(step),
                onStepContinue: continued,
                onStepCancel: cancel,
                steps: <Step>[
                  Step(
                    title: new Text('Bundle description'),
                    content: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // Validate returns true if the form is valid, or false otherwise.
                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Processing Data')),
                                  );
                                }
                              },
                              child: const Text('Save product definition'),
                            )
                            // Add TextFormFields and ElevatedButton here.
                          ],
                        )),
                    isActive: _currentStep >= 0 && editableContent != null,
                    state: _currentStep >= 1 &&
                            editableContent?.uploadedFileUrl != null
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Prices'),
                    content: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            publishProduct();
                          },
                          child: Text('Publish'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0 && editableContent != null,
                    state: _currentStep >= 2 &&
                            editableContent?.uploadedFileUrl != null
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Contents'),
                    content: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            publishProduct();
                          },
                          child: Text('Publish'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0 && editableContent != null,
                    state: _currentStep >= 2 &&
                            editableContent?.uploadedFileUrl != null
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Publish'),
                    content: Column(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            publishProduct();
                          },
                          child: Text('Publish'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0 && editableContent != null,
                    state: _currentStep >= 2 &&
                            editableContent?.uploadedFileUrl != null
                        ? StepState.complete
                        : StepState.disabled,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.list),
        onPressed: switchStepsType,
      ),
    );
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() {
    _currentStep < 2 ? setState(() => _currentStep += 1) : null;
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  void publishProduct() async {
    print('Product publishing started');

    final initUri = Uri.parse(
        "https://zaacxi1w85.execute-api.us-east-1.amazonaws.com/testing/product/publish");

    Product product = Product();

    ProductPrice productPriceOnetime =
        ProductPrice(price: 30, currency: 'USD', paymentType: 'ONE_TIME');

    ProductPrice productPriceSubscription = ProductPrice(
        price: 2.57,
        currency: 'USD',
        interval: 'month',
        intervalCount: 1,
        paymentType: 'RECURRING');

    var priceList = [productPriceOnetime, productPriceSubscription];

    product.priceList = priceList;

    product.name = 'Test';
    product.description = 'Test';

    PublishProductModel publishProductModel =
        PublishProductModel(product: product);

    String body = '{"product":${jsonEncode(product)}}';
    //encode Map to JSON

    print(body);

    final headers = <String, String>{
      'Content-Type': 'application/json',
    };

    http.Response initResponse =
        await http.post(initUri, body: body, headers: headers);

    print('response: ${initResponse.body}');

    var p = Product.fromJson(jsonDecode(initResponse.body));

    print(p.stripeProductId);
  }
}

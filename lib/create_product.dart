import 'dart:math';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/create_price.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/flutter_flow/flutter_flow_theme.dart';
import 'package:contentpub_admin/models/Bundle.dart';
import 'package:contentpub_admin/models/Content.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/models/Price.dart';
import 'package:contentpub_admin/models/PublishProductModel.dart';
import 'package:contentpub_admin/models/PurchaseType.dart';
import 'package:contentpub_admin/models/editable/editables.dart';
import 'package:flutter/material.dart';

import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

class CreateProductWidget extends StatefulWidget {
  final String bundleId;

  const CreateProductWidget({
    required this.bundleId,
    Key? key,
  }) : super(key: key);

  @override
  _CreateProductWidgetState createState() => _CreateProductWidgetState();
}

class _CreateProductWidgetState extends State<CreateProductWidget> {
  int _currentStep = 0;
  StepperType stepperType = StepperType.horizontal;

  late EditablePrice priceOneTime;
  late EditablePrice priceOneMonth;
  late EditablePrice priceThreeMonths;
  late EditablePrice priceOneYear;

  final contentTypes = ContentType.values.toList();

  EditableBundle? editableBundle;

  @override
  void initState() {
    editableBundle = EditableBundle(id: widget.bundleId);

    if (widget.bundleId == '') {
      priceOneTime = EditablePrice(id: '');
      priceOneMonth = EditablePrice(id: '');
      priceThreeMonths = EditablePrice(id: '');
      priceOneYear = EditablePrice(id: '');
    }

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Create Bundle to Sell Your Products'),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Stepper(
                type: stepperType,
                physics: const ScrollPhysics(),
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
                              onSaved: (newValue) {
                                editableBundle!.name = newValue;
                              },

                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the name';
                                }
                                return null;
                              },
                            ),
                            TextFormField(
                              onSaved: (newValue) {
                                editableBundle!.description = newValue;
                              },

                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter the description';
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

                                  Bundle bundle = EditableBundle.fromEditable(
                                      editableBundle!);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Saving the product')),
                                  );

                                  saveBundle(bundle);

                                  _currentStep++;

                                  setState(() {
                                    _currentStep = _currentStep;
                                  });

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Saved')),
                                  );
                                }
                              },
                              child: const Text('Save product definition'),
                            )
                            // Add TextFormFields and ElevatedButton here.
                          ],
                        )),
                    isActive: _currentStep >= 0 && editableBundle != null,
                    state: _currentStep >= 1 && editableBundle?.name != null
                        ? StepState.complete
                        : StepState.disabled,
                  ),
                  Step(
                    title: new Text('Prices'),
                    content: SizedBox(
                      height: 300,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: DefaultTabController(
                              length: 4,
                              initialIndex: 0,
                              child: Column(
                                children: [
                                  TabBar(
                                    labelColor: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    indicatorColor: FlutterFlowTheme.of(context)
                                        .secondaryColor,
                                    tabs: const [
                                      Tab(
                                        text: 'One time',
                                      ),
                                      Tab(
                                        text: '1 month',
                                      ),
                                      Tab(
                                        text: '3 months',
                                      ),
                                      Tab(
                                        text: '1 year',
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        SizedBox(
                                            width: 100,
                                            child: CreatePriceWidget(
                                                bundleId: widget.bundleId,
                                                price: priceOneTime)),
                                        SizedBox(
                                            width: 100,
                                            child: CreatePriceWidget(
                                                bundleId: widget.bundleId,
                                                price: priceOneMonth)),
                                        SizedBox(
                                            width: 100,
                                            child: CreatePriceWidget(
                                                bundleId: widget.bundleId,
                                                price: priceThreeMonths)),
                                        SizedBox(
                                            width: 100,
                                            child: CreatePriceWidget(
                                                bundleId: widget.bundleId,
                                                price: priceOneYear)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                savePrices();
                              },
                              child: const Text('Save prices'))
                        ],
                      ),
                    ),
                    isActive: _currentStep >= 0 && editableBundle != null,
                    state: _currentStep >= 2 && editableBundle?.prices != null
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
                          child: const Text('Contents'),
                        ),
                      ],
                    ),
                    isActive:
                        _currentStep >= 0 && editableBundle!.contents != null,
                    state: _currentStep >= 2 && editableBundle?.contents != null
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
                          child: const Text('Publish'),
                        ),
                      ],
                    ),
                    isActive: _currentStep >= 0 && editableBundle != null,
                    state: _currentStep >= 2 && editableBundle?.prices != null
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
        child: const Icon(Icons.list),
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

  savePrice(EditablePrice editablePrice) async {
    Price price;
    if (editablePrice.amount != null) {
      if (editablePrice.id == '') {
        editablePrice.id = uuid.v4();
        price = EditablePrice.fromEditable(editablePrice);
        final priceSaveRequest = ModelMutations.create(price);
        var response =
            await Amplify.API.mutate(request: priceSaveRequest).response;
        print(response.data);
        print(response.errors);
      } else {
        price = EditablePrice.fromEditable(editablePrice);
        final priceSaveRequest = ModelMutations.update(price);
        var response =
            await Amplify.API.mutate(request: priceSaveRequest).response;
        print(response.data);
        print(response.errors);
      }

      print(price.id);
      editablePrice.id = price.id;
    }
  }

  savePrices() async {
    savePrice(priceOneTime);
    savePrice(priceOneMonth);
    savePrice(priceThreeMonths);
    savePrice(priceOneYear);

    _currentStep++;
    setState(() {});
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

saveBundle(Bundle bundle) async {
  final bundleSaveRequest = ModelMutations.create(bundle);
  await Amplify.API.mutate(request: bundleSaveRequest);

  print(bundle.id);
}


Future<List<Content>?> getContents() async {
    const listContents = 'listContents';

    String graphQLQuery = '''query GetContents {
              listContents {
                items {
                  id
                  name
                  objectId
                  owner
                  s3Url
                  description
                  type
                  createdAt
                  updatedAt
                  coworkers {
                    items {
                      id
                      coworkerId
                    }
                  }
                }
              }
            }
    ''';

    final request = GraphQLRequest(
        document: graphQLQuery,
        modelType: const PaginatedModelType(Content.classType),
        variables: <String, String>{},
        decodePath: listContents);

    try {
      var response = await Amplify.API.query(request: request).response;
      PaginatedResult<Content> result = response.data;
      var retrievedContents = result.items;
      for (var content in contents) {
        print(content);
      }

      retrievedContents.sort((a, b) =>
          (b!.updatedAt ?? TemporalDateTime(DateTime.now()))
              .compareTo(a!.updatedAt ?? TemporalDateTime(DateTime.now())));

      retrievedContents.forEach((element) {
        print(element!.updatedAt);
      });

      setState(() {
        contents = retrievedContents;
      });
    } catch (e) {
      print(e);
    }
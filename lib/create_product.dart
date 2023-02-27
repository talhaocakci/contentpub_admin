import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/create_price.dart';
import 'package:contentpub_admin/flutter_flow/flutter_flow_theme.dart';
import 'package:contentpub_admin/models/ModelProvider.dart';
import 'package:contentpub_admin/models/PublishProductModel.dart';
import 'package:contentpub_admin/models/editable/editables.dart';
import 'package:contentpub_admin/state_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_multi_select_items/flutter_multi_select_items.dart';
import 'package:http/http.dart' as http;
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

  List<Content?>? availableContents;

  late EditablePrice priceOneTime;
  late EditablePrice priceOneMonth;
  late EditablePrice priceThreeMonths;
  late EditablePrice priceOneYear;

  Bundle? bundleToPublish;

  final contentTypes = ContentType.values.toList();

  EditableBundle? editableBundle;

  final MultiSelectController<Content?> _controller = MultiSelectController();

  @override
  void initState() {
    editableBundle = EditableBundle(id: widget.bundleId);

    if (widget.bundleId == '') {
      priceOneTime = EditablePrice(
        id: '',
        purchaseType: PurchaseType.ONE_TIME,
        recurrenceInterval: 0,
      );
      priceOneMonth = EditablePrice(
          id: '',
          recurrenceType: RecurrenceType.MONTHLY,
          recurrenceInterval: 1,
          purchaseType: PurchaseType.SUBSCRIPTION);
      priceThreeMonths = EditablePrice(
          id: '',
          recurrenceType: RecurrenceType.MONTHLY,
          recurrenceInterval: 3,
          purchaseType: PurchaseType.SUBSCRIPTION);
      priceOneYear = EditablePrice(
          id: '',
          recurrenceType: RecurrenceType.ANNUAL,
          recurrenceInterval: 1,
          purchaseType: PurchaseType.SUBSCRIPTION);
    }

    getAvailableContents();

    super.initState();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Create Bundle to Sell Your Contents'),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
            width: 600,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                                  decoration: InputDecoration(
                                    hintText:
                                        'eg: All courses bundle, All X courses, My Single X course',
                                    label: Text(
                                        'What defines your product the best?'),
                                  ),
                                  onChanged: (newValue) {
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
                                  onChanged: (newValue) {
                                    editableBundle!.description = newValue;
                                  },
                                  decoration: InputDecoration(
                                    hintText:
                                        'eg: Contains all video courses and 1 hour session per month',
                                    label: Text(
                                        'Describe your product. Shown to the customer before purchasing'),
                                  ),

                                  // The validator receives the text that the user has entered.
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter the description';
                                    }
                                    return null;
                                  },
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
                                        labelStyle: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                        indicatorColor:
                                            FlutterFlowTheme.of(context)
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
                              )
                            ],
                          ),
                        ),
                        isActive: _currentStep >= 0 && editableBundle != null,
                        state:
                            _currentStep >= 2 && editableBundle?.prices != null
                                ? StepState.complete
                                : StepState.disabled,
                      ),
                      Step(
                        title: new Text('Contents'),
                        content: SizedBox(
                            height: 500,
                            width: 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                /*Expanded(
                                    child: CheckboxListTile(
                                  title: Text("All courses"), //    <-- label
                                  value: false,
                                  onChanged: (newValue) {},
                                )),
                                Expanded(
                                    child: CheckboxListTile(
                                  title: Text("All documents"), //    <-- label
                                  value: false,
                                  onChanged: (newValue) {},
                                )),*/
                                Expanded(
                                    child: MultiSelectCheckList(
                                  //maxSelectableCount: 5,
                                  textStyles: const MultiSelectTextStyles(
                                      selectedTextStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                  itemsDecoration: MultiSelectDecorations(
                                      selectedDecoration: BoxDecoration(
                                          color:
                                              Colors.indigo.withOpacity(0.8))),
                                  listViewSettings: ListViewSettings(
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                            height: 0,
                                          )),
                                  controller: _controller,
                                  items: List.generate(
                                      availableContents!.length,
                                      (index) => CheckListCard(
                                          value: availableContents![index],
                                          title: Text(
                                              availableContents![index]?.name ??
                                                  'Name unknown'),
                                          subtitle: Text(
                                              availableContents![index]
                                                      ?.type
                                                      .toString() ??
                                                  'Unknown type'),
                                          selectedColor: Colors.white,
                                          checkColor: Colors.indigo,
                                          //selected: index == 3,
                                          // enabled: !(index == 5),
                                          checkBoxBorderSide: const BorderSide(
                                              color: Colors.blue),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5)))),
                                  onChange: (allSelectedItems, selectedItem) {
                                    editableBundle?.contents = List.empty();
                                    Bundle tempBundle =
                                        EditableBundle.fromEditable(
                                            editableBundle!);

                                    editableBundle!.contents = allSelectedItems
                                        .map((c) => BundleContent(
                                            content: c as Content,
                                            bundle: tempBundle))
                                        .toList();

                                    setState(() {});
                                  },
                                  onMaximumSelected:
                                      (allSelectedItems, selectedItem) {},
                                )),
                              ],
                            )),
                        isActive: _currentStep >= 0 &&
                            editableBundle!.contents != null,
                        state: _currentStep >= 2 &&
                                editableBundle?.contents != null
                            ? StepState.complete
                            : StepState.disabled,
                      ),
                      Step(
                        title: new Text('Publish'),
                        content: bundleToPublish != null
                            ? SizedBox(
                                height: 300,
                                child: Column(
                                  children: <Widget>[
                                    const Text('Basic Information'),
                                    Text(bundleToPublish!.name ??
                                        'Unknown name'),
                                    Text(bundleToPublish!.description ??
                                        'Unknown description'),
                                    Text('Prices'),
                                    for (var p in bundleToPublish!.prices ??
                                        List.empty())
                                      Text(p.amount.toString()),
                                    Text('Contents'),
                                    for (var c in bundleToPublish!.contents ??
                                        List.empty())
                                      Text((c as BundleContent).content.name ??
                                          'Unknown name')
                                  ],
                                ))
                            : Text('Bundle is not ready'),
                        isActive: _currentStep >= 0 && editableBundle != null,
                        state:
                            _currentStep >= 2 && editableBundle?.prices != null
                                ? StepState.complete
                                : StepState.disabled,
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.list),
        onPressed: switchStepsType,
      ),
    );
  }

  Future<Bundle> getBundle(String bundleId) async {
    const getBundle = 'getBundle';

    String graphQLQuery = '''query GetBundle {
            getBundle(id: "${bundleId}") {
              
              id
              isAllAccess
              isFree
              name
              stripeProductId
              description
              contents {
                  items {
                    contentId
                    id
                    content {
                      id
                      name
                    }
                  }
                }
              prices {
                items {
                  amount
                  bundleID
                  currency
                  id
                  purchaseType
                  recurrenceType
                  stripePriceId
                  recurrenceInterval
                }
              }
            }
          }
    ''';

    final request = GraphQLRequest(
        document: graphQLQuery,
        modelType: Bundle.classType,
        variables: <String, String>{},
        decodePath: getBundle);

    try {
      var response = await Amplify.API.query(request: request).response;
      print(response.errors);
      print(response.data);
      Bundle result = response.data;
      bundleToPublish = result;
      return bundleToPublish!;
    } catch (e) {
      print(e);
    }

    return Bundle();
  }

  switchStepsType() {
    setState(() => stepperType == StepperType.vertical
        ? stepperType = StepperType.horizontal
        : stepperType = StepperType.vertical);
  }

  tapped(int step) {
    setState(() => _currentStep = step);
  }

  continued() async {
    if (_currentStep == 0) {
      if (_formKey.currentState!.validate()) {
        // If the form is valid, display a snackbar. In the real world,
        // you'd often call a server or save the information in a database.

        Bundle bundle = EditableBundle.fromEditable(editableBundle!);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Saving the bundle')),
        );

        saveBundle(editableBundle!);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Saved')),
        );
      }
    }

    if (_currentStep == 1) {
      savePrices();
    }

    if (_currentStep == 2) {
      await saveBundle(editableBundle!);

      // to check if we saved everything correctly, we are not using the
      // editableBundle but the actual one persisted into DB
      bundleToPublish = await getBundle(editableBundle!.id);
    }

    if (_currentStep == 3) {
      publishProduct();
    }

    _currentStep < 3 ? setState(() => _currentStep += 1) : null;

    setState(() {
      _currentStep = _currentStep;
      availableContents = availableContents;
    });
  }

  cancel() {
    _currentStep > 0 ? setState(() => _currentStep -= 1) : null;
  }

  Future<void> getAvailableContents() async {
    const listContents = 'listContents';

    String graphQLQuery = '''query GetContents {
              listContents(filter: {isPublished: {eq: true}}) {             
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
      var retrievedContents = result.items.toList();
      for (var content in retrievedContents) {
        print(content);
      }
      availableContents = retrievedContents;

      setState(() {
        availableContents = retrievedContents;
      });
    } catch (e) {
      print(e);
    }
  }

  savePrice(EditablePrice editablePrice) async {
    Price price;
    if (editablePrice.amount != null) {
      editablePrice.bundleID = editableBundle!.id;
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

  Future<void> saveBundle(EditableBundle editable) async {
    if (editable.id == '') {
      editable.id = uuid.v4();
    }

    final Bundle b = EditableBundle.fromEditable(editable);

    final bundleSaveRequest = ModelMutations.create(b);
    await Amplify.API.mutate(request: bundleSaveRequest);

    if (b.contents != null) {
      for (BundleContent contentBundle in b.contents ?? List.empty()) {
        if (contentBundle.createdAt == null) {
          String graphQLQuery = ''' mutation MyMutation {
              createBundleContent(input: 
                            {
                              bundleId: "${contentBundle.bundle.id}", 
                              contentId: "${contentBundle.content.id}",
                              id: "${contentBundle.id}"}) { id  }}
                  ''';

          final request = GraphQLRequest(
              document: graphQLQuery,
              //modelType: const PaginatedModelType(Content.classType),
              variables: <String, String>{},
              decodePath: 'createBundleContent');

          final response = await Amplify.API.query(request: request).response;

          print(response.errors);
          print(response.data);
        } else {
          final saveRequest = ModelMutations.update(contentBundle);
          var response =
              await Amplify.API.mutate(request: saveRequest).response;
          print(response.errors);
          print(response.data);
        }
        print(contentBundle.id);
      }
    }

    print(b.id);
  }

  savePrices() async {
    savePrice(priceOneTime);
    savePrice(priceOneMonth);
    savePrice(priceThreeMonths);
    savePrice(priceOneYear);

    setState(() {});
  }

  void publishProduct() async {
    print('Product publishing started');

    final initUri = Uri.parse(
        "${StateContainer.of(context).apigatewayBaseUrl()}/product/publish");

    Product product = Product();
    product.id = bundleToPublish!.id;
    product.name = bundleToPublish!.name;
    product.description = bundleToPublish!.description;

    product.priceList = bundleToPublish!.prices!.map((price) {
      ProductPrice productPrice = ProductPrice(id: price.id);
      productPrice.currency = price.currency;
      productPrice.amount = price.amount;
      productPrice.intervalCount = price.recurrenceInterval;
      productPrice.interval = price.recurrenceType?.name ?? '';
      productPrice.purchaseType = price.purchaseType?.name ?? '';

      return productPrice;
    }).toList();

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

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          content:
              Text('Product is published, we wish you a successful product!')),
    );
  }
}

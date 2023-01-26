import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/flutter_flow/flutter_flow_theme.dart';
import 'package:contentpub_admin/models/Bundle.dart';
import 'package:contentpub_admin/models/ModelProvider.dart';
import 'package:flutter/material.dart';

import 'package:markdown_editable_textinput/markdown_text_input.dart';

import 'dart:convert';

final currencies =
    <String>['USD', 'EUR'].map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(
    value: value,
    child: Text(value),
  );
}).toList();

class BundleManagementWidget extends StatefulWidget {
  const BundleManagementWidget({super.key});

  @override
  State<BundleManagementWidget> createState() => _BundleManagementWidgetState();
}

class _BundleManagementWidgetState extends State<BundleManagementWidget> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  String? description;
  late double priceAmount;
  late String? currency = currencies.first.value;

  List<Bundle?>? existingBundles;

  Bundle bundle = Bundle();

  String? currencyValue = currencies.first.value;

  TextEditingController controller = TextEditingController();

  late List<DropdownMenuItem<Bundle>> dropDownBundles;

  Bundle? selectedBundle;

  String bundleMode = 'create';

  @override
  void initState() {
    controller.addListener(() {
      print(controller.text);
    });

    super.initState();
  }

  Future<List<Bundle?>> callAsyncFetch() async {
    if (existingBundles == null) {
      existingBundles = await getBundles();

      dropDownBundles =
          existingBundles!.map<DropdownMenuItem<Bundle>>((Bundle? value) {
        return DropdownMenuItem<Bundle>(
          value: value,
          child: Text(value!.name ?? 'Nameless bundle'),
        );
      }).toList();

      if (existingBundles?.isEmpty == false && selectedBundle == null) {
        selectedBundle = existingBundles?.first;
      }
    }

    return existingBundles ?? List.empty();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Bundle?>>(
        future: callAsyncFetch(),
        builder: (context, AsyncSnapshot<List<Bundle?>> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                appBar: AppBar(
                  backgroundColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                  automaticallyImplyLeading: false,
                  title: Text(
                    'Classes',
                    style: FlutterFlowTheme.of(context).title1,
                  ),
                  actions: [],
                  centerTitle: false,
                  elevation: 0,
                ),
                body: SizedBox(
                    height: 550,
                    width: 400,
                    child: Column(children: [
                      SizedBox(
                          height: 50,
                          width: 400,
                          child: GridView.count(
                            crossAxisSpacing: 30,
                            mainAxisSpacing: 30,
                            crossAxisCount: 3,
                            children: [
                              ElevatedButton(
                                  style: const ButtonStyle(
                                      alignment: Alignment.topCenter),
                                  onPressed: () {
                                    changeMode('select');
                                  },
                                  child: const Text(
                                      'Select from existing bundles')),
                              ElevatedButton(
                                  style: const ButtonStyle(
                                      alignment: Alignment.topCenter),
                                  onPressed: () {
                                    changeMode('create');
                                  },
                                  child: const Text(
                                      'Create new bundle and add content'))
                            ],
                          )),
                      const Padding(padding: EdgeInsets.all(20)),
                      if (bundleMode == 'select')
                        DropdownButton(
                          value: selectedBundle ?? null,
                          onChanged: (Bundle? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              selectedBundle = value!;
                            });
                          },
                          items: dropDownBundles,
                        ),
                      const Padding(padding: EdgeInsets.all(20)),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              initialValue: selectedBundle?.name ?? '',
                              enabled: bundleMode == 'create',
                              decoration: const InputDecoration(
                                  labelText:
                                      'Name of the bundle - This will be visible to the customer while buying'),
                              onSaved: (newValue) => name = newValue!,
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter some text';
                                }
                                return null;
                              },
                            ),
                            /*TextFormField(
                          enabled: bundleMode == 'create',
                          initialValue:
                              selectedBundle?.priceAmount.toString() ?? '',
                          decoration: const InputDecoration(
                              labelText:
                                  'Enter the price such as 3.50 or 3 or 3.00'),
                          onSaved: (newValue) =>
                              priceAmount = double.parse(newValue!),
                          // The validator receives the text that the user has entered.
                          validator: (value) {
                            if (isNumeric(value!) == false) {
                              return 'Please enter a numeric value';
                            }
                            return null;
                          },
                        ),
                        DropdownButton(
                          value: selectedBundle?.priceCurrency.toString() ?? '',
                          onChanged: (String? value) {
                            // This is called when the user selects an item.
                            setState(() {
                              currency = value!;
                            });
                          },
                          items: currencies,
                        ),*/
                            TextFormField(
                              enabled: bundleMode == 'create',
                              initialValue:
                                  selectedBundle?.description.toString() ?? '',
                              maxLines: 5,
                              decoration: const InputDecoration(
                                  labelText: 'Enter the description'),
                              onSaved: (newValue) => description = newValue,
                              // The validator receives the text that the user has entered.
                            ),
                            if (bundleMode == 'create')
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  style: ButtonStyle(),
                                  onPressed: () {
                                    // Validate returns true if the form is valid, or false otherwise.
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState?.save();

                                      String description = controller.text;

                                      Bundle bundle = Bundle(
                                        name: name,
                                        description: description,
                                      );

                                      print(bundle.toString());

                                      saveBundle(bundle);

                                      print(
                                          'bundle save edildi. id: ${bundle.id}');

                                      // If the form is valid, display a snackbar. In the real world,
                                      // you'd often call a server or save the information in a database.
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                            content: Text('Processing Data')),
                                      );
                                    }
                                  },
                                  child: const Text('Save bundle'),
                                ),
                              ),
                          ],
                        ),
                      )
                    ])));
          } else {
            return const CircularProgressIndicator();
          }
        });

    // Build a Form widget using the _formKey created above.
  }

  changeMode(String s) {
    setState(() {
      bundleMode = s;
      if (s == 'create') {}
    });
  }
}

saveBundle(Bundle bundle) async {
  final bundleSaveRequest = ModelMutations.create(bundle);
  await Amplify.API.mutate(request: bundleSaveRequest);

  print(bundle.id);
}

Future<List<Bundle?>> getBundles() async {
  try {
    String graphQLQuery = '''query GetBundles {
  listBundles(filter: {}) {
    items {
      contents {
        items {
          id
          name
          objectId
          owner
          s3Url
          type
        }
      }
      id
      isAllAccess
      isFree
      name
      prices {
        items {
          amount
          bundleID
          purchaseType
          id
          recurrenceType
          stripePriceId
        }
      }
      stripeProductId
      description
    }
  }
}''';

    final request = GraphQLRequest(
        document: graphQLQuery,
        modelType: const PaginatedModelType(Bundle.classType),
        variables: <String, String>{},
        decodePath: 'listBundles');

    var response = await Amplify.API.query(request: request).response;
    PaginatedResult<Bundle> result = response.data;
    List<Bundle?> retrievedBundles = result.items;

    for (Bundle? b in retrievedBundles) {
      print(b!.name);
    }

    return retrievedBundles;
  } on ApiException catch (e) {
    print('Query failed: $e');
    return List<Bundle>.empty();
  }
}

bool isNumeric(String s) {
  final number = num.tryParse(s);

  if (number == null) {
    return false;
  }

  return true;
}

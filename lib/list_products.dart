import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/models/ModelProvider.dart';
import 'package:contentpub_admin/product_summary.dart';
import 'package:flutter/material.dart';

class ListProductsWidget extends StatefulWidget {
  const ListProductsWidget({super.key});

  @override
  State<ListProductsWidget> createState() => _ListProductsWidgetState();
}

class _ListProductsWidgetState extends State<ListProductsWidget> {
  late List<Bundle?> bundles = List.empty();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Bundle? selectedBundle;

  @override
  void initState() {
    getProducts();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        //backgroundColor: FlutterFlowTheme.of(context).primaryBackground,

        body: Center(
            child: ListView(
          children: [
            ProductSummary(bundle: selectedBundle ?? Bundle(tenantID: '')),
            for (var b in bundles)
              InkWell(
                  onTap: () {
                    setSelected(b ?? Bundle(tenantID: ''));
                  },
                  child: Expanded(
                      child: Container(
                          height: 150,
                          child: Column(
                            children: [Text(b?.name ?? 'no name'), Text(b?.stripeProductId ?? 'no stripe product id')],
                          ))))
          ],
        )));
  }

  void setSelected(Bundle b) {
    print('bundle selected ${b?.stripeProductId ?? 'unknown'}');
    selectedBundle = b;
    setState(() {});
  }

  Future<List<Bundle>?> getProducts() async {
    const listBundles = 'listBundles';

    String graphQLQuery = '''query MyQuery {
      listBundles {
        items {
          id
          createdAt
          description
          isFree
          isArchived
          isAllDocuments
          isAllCourses
          isAllAccess
          isPublished
          name
          stripeProductId
          tenantID
          updatedAt
          contents {
            items {
              contentId
              id
              content {
                id
                name
                description
                type
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
              trialPeriod
            }
          }
        }
      }
    }

    ''';

    final request = GraphQLRequest(document: graphQLQuery, modelType: const PaginatedModelType(Bundle.classType), variables: <String, String>{}, decodePath: listBundles);

    try {
      var response = await Amplify.API.query(request: request).response;
      PaginatedResult<Bundle> result = response.data;

      print(response.errors);
      print(response.data);
      var retrievedBundles = result.items;
      for (var bundle in retrievedBundles) {
        print(bundle);
      }

      retrievedBundles.sort((a, b) => (b!.updatedAt ?? TemporalDateTime(DateTime.now())).compareTo(a!.updatedAt ?? TemporalDateTime(DateTime.now())));

      retrievedBundles.forEach((element) {
        print(element!.contents);
      });

      setState(() {
        bundles = retrievedBundles;
      });
    } catch (e) {
      print(e);
    }

    return List.empty();
  }
}

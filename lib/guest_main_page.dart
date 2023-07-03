import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/models/Content.dart';
import 'package:contentpub_admin/state_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GuestMainPage extends StatefulWidget {
  @override
  GuestMainPageView createState() {
    return GuestMainPageView();
  }
}

class GuestMainPageView extends GuestMainPageState {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getContents();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
                child: Center(
                    child: Container(
              constraints: const BoxConstraints(maxWidth: 800, maxHeight: 800),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  crossAxisCount: 2,
                ),
                itemCount: contents.length, // Number of items in the grid
                itemBuilder: (context, index) {
                  return Column(children: [
                    Image.network(imageUrls[index]),
                    Text(contents[index]?.name ?? 'no name')
                  ]);
                },
              ),
            )))
          ],
        ),
      ),
    );
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
                  isPublished
                  isArchived
                 
                }
              }
            }
    ''';

    final request = GraphQLRequest(
        document: graphQLQuery,
        authorizationMode: APIAuthorizationType.iam,
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

    return List.empty();
  }
}

abstract class GuestMainPageState extends State<GuestMainPage> {
  late List<Content?> contents = List.empty();

  List<String> imageUrls = [
    'https://picsum.photos/400?image=1',
    'https://picsum.photos/400?image=2',
    'https://picsum.photos/400?image=3',
    'https://picsum.photos/400?image=4',
    'https://picsum.photos/400?image=5',
    'https://picsum.photos/400?image=6',
  ];
}

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/banner.dart';
import 'package:contentpub_admin/components/boxed_button.dart';
import 'package:contentpub_admin/course/create_course.dart';
import 'package:contentpub_admin/create_document.dart';
import 'package:contentpub_admin/models/Content.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/state_container.dart';
import 'package:http/http.dart' as http;

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ListContentsWidget extends StatefulWidget {
  const ListContentsWidget({Key? key}) : super(key: key);

  @override
  _ListContentsWidgetState createState() => _ListContentsWidgetState();
}

class _ListContentsWidgetState extends State<ListContentsWidget> {
  TextEditingController? searchFieldController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  late List<Content?> contents = List.empty();

  @override
  void initState() {
    super.initState();
    searchFieldController = TextEditingController();

    getContents();
  }

  @override
  void dispose() {
    searchFieldController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        //backgroundColor: FlutterFlowTheme.of(context).primaryBackground,

        body: Row(children: [
          const Spacer(),
          SizedBox(
            width: 600,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  BannerWidget(maxWidth: 600),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Create and Sell New',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 4, 1, 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          BoxedButtonWidget(goToWidget: CreateCourseWidget(courseId: ''), icon: Icons.video_file, text: 'Video Course'),
                          BoxedButtonWidget(
                              goToWidget: CreateDocumentWidget(
                                contentId: '',
                                type: ContentType.DOCUMENT,
                              ),
                              icon: Icons.edit_document,
                              text: 'Document'),
                          BoxedButtonWidget(
                              goToWidget: CreateDocumentWidget(
                                contentId: '',
                                type: ContentType.ARTICLE,
                              ),
                              icon: Icons.edit_document,
                              text: 'Article')
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(20, 8, 20, 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'All contents',
                          style: FlutterFlowTheme.of(context).title1,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 50),
                    child: contents.isEmpty
                        ? Padding(
                            padding: const EdgeInsets.all(50),
                            child: Text('It is time to create something fantastic and to share with the world',
                                style: FlutterFlowTheme.of(context).title1.copyWith(fontWeight: FontWeight.w400)))
                        : ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              for (var content in contents)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                                  child: SizedBox(
                                    width: double.infinity,
                                    height: 250,
                                    child: Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                                      child: Container(
                                        width: 100,
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize: MainAxisSize.max,
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      content?.name ?? 'Unknown name',
                                                      style: FlutterFlowTheme.of(context).title1,
                                                    ),
                                                    Text(
                                                      content?.type?.name ?? 'Unknown type',
                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                            fontFamily: 'Lexend Deca',
                                                            color: const Color(0xFF39D2C0),
                                                            fontSize: 14,
                                                            fontWeight: FontWeight.normal,
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  FFButtonWidget(
                                                    options: FFButtonOptions(width: 100),
                                                    onPressed: () {
                                                      if (content?.type == ContentType.COURSE) {
                                                        print('Content icindeki object: ${content!.objectId}');
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => CreateCourseWidget(
                                                                      courseId: content.objectId ?? '',
                                                                    )));
                                                      } else {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder: (context) => CreateDocumentWidget(
                                                                      contentId: content!.id,
                                                                      type: content.type ?? ContentType.ARTICLE,
                                                                    )));
                                                      }
                                                    },
                                                    text: 'Edit',
                                                    icon: const Icon(
                                                      Icons.add_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    options: FFButtonOptions(width: 100),
                                                    onPressed: () {
                                                      print('before action isPublished: ${content!.isPublished}');
                                                      // publish the content
                                                      if ((content.isPublished ?? false) == false) {
                                                        publishTheContent(content, true, false);
                                                      } else {
                                                        publishTheContent(content, false, true);
                                                      }
                                                      getContents();
                                                      setState(() {
                                                        contents = contents;
                                                      });
                                                    },
                                                    text: content!.isPublished ?? false ? 'Archive' : 'Publish',
                                                    icon: const Icon(
                                                      Icons.add_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                  ),
                                                  if (content.isPublished ?? false)
                                                    FFButtonWidget(
                                                      options: FFButtonOptions(width: 100),
                                                      onPressed: () {
                                                        //Will be deleted
                                                      },
                                                      text: 'Delete',
                                                      icon: const Icon(
                                                        Icons.add_rounded,
                                                        color: Colors.white,
                                                        size: 15,
                                                      ),
                                                    )
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer()
        ]));
  }

  Future<void> publishTheContent(Content content, bool isPublished, bool isArchived) async {
    String updateQuery = '''
     mutation MyMutation {
      updateContent(input: {id: "${content.id}", isPublished: $isPublished, isArchived: $isArchived}) {
        id
        isArchived
        isPublished
      }
    }
      ''';

    final request = GraphQLRequest(
      document: updateQuery,
      modelType: Content.classType,
      decodePath: 'updateContent',
      variables: <String, String>{},
    );

    String message = (isPublished == true)
        ? 'Publishing the content, it will be visible to world. You can add it to a product to sell'
        : 'Archiving the content. Owners will still be able to access it but audience will not be able to buy it anymore';

    var response = await Amplify.API.mutate(request: request).response;
    print(response.data);
    print(response.errors);
    Content result = response.data;
    print('${result.id} is published: ${result.isPublished}');
    print('${result.id} is archived: ${result.isArchived}');

    if (isPublished) {
      final session = await Amplify.Auth.fetchAuthSession(options: CognitoSessionOptions(getAWSCredentials: false));

      var tokens = (session as CognitoAuthSession).userPoolTokens;
      var idToken = tokens?.idToken;

      String rawIdToken = idToken!.raw;

      String apiRoot = StateContainer.of(context).apiRootUrl ?? '';

      final initUri = Uri.parse("$apiRoot/content/${content.id}/publish");

      final headers = <String, String>{'Content-Type': 'application/json', 'Authorization': rawIdToken};

      http.Response publishResponse = await http.post(initUri, headers: headers);

      if (publishResponse.statusCode == 200) {
        print(publishResponse.body);
      }
    }

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

    setState(() {});
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
                  coworker {
                    displayName
                    id
                    email
                    photoUrl
                    role
                  }
                  tenant {
                    id
                    name
                  }   
                }
              }
            }
    ''';

    final request = GraphQLRequest(document: graphQLQuery, modelType: const PaginatedModelType(Content.classType), variables: <String, String>{}, decodePath: listContents);

    try {
      var response = await Amplify.API.query(request: request).response;
      PaginatedResult<Content> result = response.data;
      var retrievedContents = result.items;
      for (var content in contents) {
        print(content);
      }

      retrievedContents.sort((a, b) => (b!.updatedAt ?? TemporalDateTime(DateTime.now())).compareTo(a!.updatedAt ?? TemporalDateTime(DateTime.now())));

      retrievedContents.forEach((element) {
        // print(element!.updatedAt);
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

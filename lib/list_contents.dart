import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/components/boxed_button.dart';
import 'package:contentpub_admin/course/create_course.dart';
import 'package:contentpub_admin/create_document.dart';
import 'package:contentpub_admin/models/Content.dart';
import 'package:contentpub_admin/models/ContentType.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
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
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            'Your contents',
            style: FlutterFlowTheme.of(context).title1,
          ),
          actions: [],
          centerTitle: false,
          elevation: 0,
        ),
        body: Row(children: [
          Spacer(),
          SizedBox(
            width: 600,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
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
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 1, 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          BoxedButtonWidget(
                              goToWidget: CreateCourseWidget(courseId: ''),
                              icon: Icons.video_file,
                              text: 'Video Course'),
                          BoxedButtonWidget(
                              goToWidget: CreateDocumentWidget(
                                contentId: '',
                              ),
                              icon: Icons.edit_document,
                              text: 'Document')
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
                            padding: EdgeInsets.all(50),
                            child: Text(
                                'It is time to create something fantastic and to share with the world',
                                style: FlutterFlowTheme.of(context)
                                    .title1
                                    .copyWith(fontWeight: FontWeight.w400)))
                        : ListView(
                            padding: EdgeInsets.zero,
                            primary: false,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            children: [
                              for (var content in contents)
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      16, 8, 16, 0),
                                  child: Container(
                                    width: double.infinity,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      image: DecorationImage(
                                        fit: BoxFit.fitWidth,
                                        image: Image.network(
                                          'https://images.unsplash.com/photo-1635863786408-69e343062dbc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTI2fHx3b3Jrb3V0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                                        ).image,
                                      ),
                                      boxShadow: [
                                        const BoxShadow(
                                          blurRadius: 3,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0, 120, 0, 0),
                                      child: Container(
                                        width: 100,
                                        height: 100,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                            topLeft: Radius.circular(0),
                                            topRight: Radius.circular(0),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(16, 0, 16, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      content?.name ??
                                                          'Unknown name',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title2,
                                                    ),
                                                    Text(
                                                      content?.type?.name ??
                                                          'Unknown type',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Lexend Deca',
                                                                color: const Color(
                                                                    0xFF39D2C0),
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      if (content?.type ==
                                                          ContentType.COURSE) {
                                                        print(
                                                            'Content icindeki object: ${content!.objectId}');
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        CreateCourseWidget(
                                                                          courseId:
                                                                              content!.objectId ?? '',
                                                                        )));
                                                      } else {
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        CreateDocumentWidget(
                                                                          contentId:
                                                                              content!.id,
                                                                        )));
                                                      }
                                                    },
                                                    text: 'Edit',
                                                    icon: const Icon(
                                                      Icons.add_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 120,
                                                      height: 40,
                                                      color: const Color(
                                                          0xFF39D2C0),
                                                      textStyle:
                                                          GoogleFonts.getFont(
                                                        'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                      elevation: 3,
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
                                                    ),
                                                  ),
                                                  FFButtonWidget(
                                                    onPressed: () {
                                                      print(
                                                          'before action isPublished: ${content!.isPublished}');
                                                      // publish the content
                                                      if ((content!
                                                                  .isPublished ??
                                                              false) ==
                                                          false) {
                                                        publishTheContent(
                                                            content.id,
                                                            true,
                                                            false);
                                                      } else {
                                                        publishTheContent(
                                                            content.id,
                                                            false,
                                                            true);
                                                      }

                                                      setState(() {});
                                                    },
                                                    text:
                                                        content!.isPublished ??
                                                                false
                                                            ? 'Archive'
                                                            : 'Publish',
                                                    icon: const Icon(
                                                      Icons.add_rounded,
                                                      color: Colors.white,
                                                      size: 15,
                                                    ),
                                                    options: FFButtonOptions(
                                                      width: 120,
                                                      height: 40,
                                                      color: const Color(
                                                          0xFF39D2C0),
                                                      textStyle:
                                                          GoogleFonts.getFont(
                                                        'Lexend Deca',
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                      ),
                                                      elevation: 3,
                                                      borderSide:
                                                          const BorderSide(
                                                        color:
                                                            Colors.transparent,
                                                        width: 1,
                                                      ),
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
          Spacer()
        ]));
  }

  Future<void> publishTheContent(
      String id, bool isPublished, isArchived) async {
    String updateQuery = '''
     mutation MyMutation {
      updateContent(input: {id: "$id", isPublished: $isPublished, isArchived: $isArchived}) {
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

    var response = await Amplify.API.mutate(request: request).response;
    print(response.data);
    print(response.errors);
    Content result = response.data;
    print('${result.id} is published: ${result.isPublished}');
    print('${result.id} is archived: ${result.isArchived}');
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

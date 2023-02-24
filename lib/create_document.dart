import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/course/create_curriculum.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/Content.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/models/Course.dart';
import 'package:contentpub_admin/models/Lesson.dart';
import 'package:contentpub_admin/models/ModelProvider.dart';
import 'package:contentpub_admin/models/Section.dart';
import 'package:contentpub_admin/models/editable/editables.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class CreateDocumentWidget extends StatefulWidget {
  final String contentId;

  const CreateDocumentWidget({Key? key, required this.contentId})
      : super(key: key);

  @override
  _CreateDocumentWidgetState createState() => _CreateDocumentWidgetState();
}

class _CreateDocumentWidgetState extends State<CreateDocumentWidget> {
  String? coverPhotoUrl;
  String? promoVideoUrl;

  bool? switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Content? content;
  EditableContent? editableContent;

  List<Coworker?>? coworkers;

  String? coworkerId;

  @override
  void initState() {
    getCoworkers();
    initContent();
    super.initState();
  }

  Future<EditableContent> initContent() async {
    if (widget.contentId == '') {
      content = Content(id: Uuid().v4());
      editableContent = EditableContent.toEditable(content!);
      editableContent!.newItem = true;

      return editableContent!;
    }

    content = await getContent(widget.contentId);
    editableContent = EditableContent.toEditable(content!);
    print('in init content: ${content}');

    setState(() {});

    return initPage();
  }

  Future<EditableContent> initPage() async {
    print('editable content : ${editableContent!.name}');

    return editableContent!;
  }

  @override
  void dispose() {
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
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () {
            print('IconButton pressed ...');
          },
        ),
        title: Text(
          'Basic Content Information',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Brazila',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 22,
                useGoogleFonts: false,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: initPage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                    child: Container(
                      //width: MediaQuery.of(context).size.width / 2,
                      margin: EdgeInsets.all(50),
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5,
                            color: Color(0x430F1113),
                            offset: Offset(0, 2),
                          )
                        ],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        editableContent!.name = value;
                                        editableContent!.dirty = true;
                                      },
                                      initialValue: editableContent?.name,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Title',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                      maxLines: null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      onChanged: (value) {
                                        editableContent!.description = value;
                                        editableContent!.dirty = true;
                                      },
                                      obscureText: false,
                                      initialValue:
                                          editableContent?.description ?? '',
                                      decoration: InputDecoration(
                                        labelText: 'Description',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                      maxLines: null,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text("Your file"),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FileUploadWithDrop(
                                      remoteDirectory: '${editableContent!.id}',
                                      remoteFileName: 'file1',
                                      isPublic: false,
                                      remoteUrl: editableContent?.s3Url,
                                      fileType: FileType.OTHER,
                                      onComplete: (uploadedFile) {
                                        editableContent?.s3Url =
                                            uploadedFile.remoteUrl;
                                      },
                                      onClear: () {
                                        print('Clear the object here as well');
                                      }),
                                ),
                              ],
                            ),
                            Text('Cover photo:'),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FileUploadWithDrop(
                                      remoteDirectory: '${editableContent!.id}',
                                      remoteFileName: 'cover-photo',
                                      isPublic: true,
                                      remoteUrl: editableContent?.photoUrl,
                                      fileType: FileType.PICTURE,
                                      onComplete: (uploadedFile) {
                                        editableContent?.photoUrl =
                                            uploadedFile.remoteUrl;
                                      },
                                      onClear: () {
                                        print('Clear the object here as well');
                                      }),
                                ),
                              ],
                            ),
                            Text('Promo video :'),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FileUploadWithDrop(
                                      remoteDirectory: '${editableContent!.id}',
                                      remoteFileName: 'promo-video',
                                      isPublic: true,
                                      fileType: FileType.VIDEO,
                                      remoteUrl: editableContent?.promoVideoUrl,
                                      onComplete: (uploadedFile) {
                                        editableContent?.promoVideoUrl =
                                            uploadedFile.remoteUrl;
                                      },
                                      onClear: () {
                                        print('Clear the object here as well');
                                      }),
                                ),
                              ],
                            ),
                            Text('Authors'),
                            Row(
                              children: [
                                for (var contentCoworker
                                    in content!.Coworkers ?? List.empty())
                                  Expanded(
                                      child: DropdownButtonFormField<Coworker>(
                                    value: contentCoworker!.coworker,
                                    items: [
                                      for (var coworker in coworkers!)
                                        DropdownMenuItem(
                                            value: coworker,
                                            child: Text(coworker!.displayName ??
                                                'Unknown author')),
                                    ],
                                    onChanged: (value) {
                                      print(
                                          'author selection changed ${value}');

                                      ContentCoworker cc = ContentCoworker(
                                          id: '${content!.id}--${value!.id}}',
                                          coworker: value,
                                          content: content!);

                                      editableContent!.coworkerRelations =
                                          List.from([cc]);
                                      print(value);
                                    },
                                  ))
                              ],
                            ),
                            Row(children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 12),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    saveContent();
                                    // save course here

                                    print('Button_Secondary pressed ...');
                                  },
                                  text: 'Save Changes',
                                  options: FFButtonOptions(
                                    width: 300,
                                    height: 50,
                                    color: Color(0xFF4B39EF),
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText2
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ]),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
          }
          return Text('Loading');
        },
      ),
    );
  }

  Future<Content?> getContent(String id) async {
    const getContent = 'getContent';

    String graphQLQuery = '''query MyQuery2 {
              getContent(id: "${id}") {
                id
                isArchived
                isPublished
                name
                objectId
                owner
                photoUrl
                promoVideoUrl
                s3Url
                type
                description
                 Coworkers {
                  items {
                    contentId
                    coworkerId
                    id
                    coworker {
                      id
                      displayName
                      description
                    }
                  }
                }
              }
            }
    ''';

    final request = GraphQLRequest<Content>(
        document: graphQLQuery,
        modelType: Content.classType,
        decodePath: getContent);

    try {
      var response = await Amplify.API.query(request: request).response;
      var retrievedContent = response.data ?? Content();

      //print('Retrieved course: ${mycourse}');
      return retrievedContent;
    } catch (e) {
      print(e);
    }

    return Content();
  }

  Future<void> getCoworkers() async {
    String graphQLQuery = '''query MyQuery2 {
        listCoworkers {
          items {
            createdAt
            description
            displayName
            id
            photoUrl
            updatedAt
            email
          }
        }
      }
    ''';

    final request = GraphQLRequest(
        document: graphQLQuery,
        modelType: const PaginatedModelType(Coworker.classType),
        decodePath: 'listCoworkers');

    try {
      var response = await Amplify.API.query(request: request).response;
      PaginatedResult<Coworker> result = response.data;

      coworkers = result.items.toList();

      setState(() {});

      //print('Retrieved course: ${mycourse}');
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteExistingCoworkerRelations(Content content) async {
    for (var coworker in content.Coworkers ?? List.empty()) {
      deleteCoworkerRelation('${content.id}--${coworker.id}');
    }
  }

  Future<void> deleteCoworkerRelation(String id) async {
    String query = ''' mutation MyMutation {
        deleteContentCoworker(input: {id: "$id"})
      }
      ''';

    final request = GraphQLRequest(
        document: query,
        //modelType: const PaginatedModelType(Content.classType),
        variables: <String, String>{},
        decodePath: 'createContentCoworker');

    final response = await Amplify.API.query(request: request).response;

    if (!response.hasErrors) {
      print('content author relation deleted $id');
    }
  }

  Future<void> saveContent() async {
    String contentId = editableContent!.id;

    print('saving content with id ${editableContent!.id}');

    String id = editableContent!.id;

    print('editableContent new ${editableContent!.newItem}');

    if (editableContent!.newItem == true) {
      content = EditableContent.fromEditable(editableContent!);
      final contentSaveRequest = ModelMutations.create(content!);

      var response =
          await Amplify.API.mutate(request: contentSaveRequest).response;
      print(response.data);
      print(response.errors);

      editableContent = EditableContent.toEditable(content!);
      editableContent!.newItem = false;
    } else {
      content = EditableContent.fromEditable(editableContent!);

      final contentSaveRequest = ModelMutations.update(content!);

      var response =
          await Amplify.API.mutate(request: contentSaveRequest).response;

      print(response.data);
      print(response.errors);

      deleteExistingCoworkerRelations(content!);
    }

    if (content!.Coworkers != null) {
      for (ContentCoworker contentCoworker
          in content!.Coworkers ?? List.empty()) {
        String graphQLQuery = ''' mutation MyMutation {
              createContentCoworker(
                input: {
                  contentId: "${content!.id}", 
                  coworkerId: "${contentCoworker.coworker.id}",
                  id: "${contentCoworker.id}"}) {
                    id
                    }
              }
          ''';

        final request = GraphQLRequest(
            document: graphQLQuery,
            //modelType: const PaginatedModelType(Content.classType),
            variables: <String, String>{},
            decodePath: 'createContentCoworker');

        final response = await Amplify.API.query(request: request).response;

        print(response.errors);
        print(response.data);
        print('Content author relation created ${contentCoworker.id}');
      }
    }

    setState(() {
      content = content;
    });
  }
}

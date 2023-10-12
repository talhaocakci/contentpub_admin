import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/banner.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/ModelProvider.dart';
import 'package:contentpub_admin/custom_models/editable/editables.dart';
import 'package:contentpub_admin/state_container.dart';
import 'package:contentpub_admin/utils.dart';
import 'package:flutter/material.dart';
import 'package:super_editor/super_editor.dart';
import 'package:uuid/uuid.dart';
import 'package:super_editor_markdown/super_editor_markdown.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class CreateDocumentWidget extends StatefulWidget {
  final String contentId;
  final ContentType type;

  const CreateDocumentWidget({Key? key, required this.contentId, required this.type}) : super(key: key);

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

  MutableDocument? mutableDocument;

  final RegExp nonAlphaNum = RegExp("[^A-Z a-z0-9]");

  late TextEditingController slugController;

  late SuperEditor superEditor;
  late DocumentComposer _composer;

  String cursorNodeId = '';

// With a MutableDocument, create a DocumentEditor, which knows how
// to apply changes to the MutableDocument.

  @override
  void initState() {
    getCoworkers();
    initContent();
    super.initState();
  }

  Future<EditableContent> initContent() async {
    if (widget.contentId == '') {
      content = Content(id: Utils.generateId());
      editableContent = EditableContent.toEditable(content!);
      editableContent!.newItem = true;

      mutableDocument = deserializeMarkdownToDocument('Your content here');

      slugController = TextEditingController.fromValue(TextEditingValue(text: editableContent?.urlSlug ?? ''));

      _composer = DocumentComposer();
      _composer.selectionNotifier.addListener(_onSelection);
      superEditor = SuperEditor(
          autofocus: true,
          composer: _composer,
          editor: DocumentEditor(
            document: mutableDocument ?? MutableDocument(),
          ));

      return editableContent!;
    }

    content = await getContent(widget.contentId);
    editableContent = EditableContent.toEditable(content!);

    slugController = TextEditingController.fromValue(TextEditingValue(text: editableContent?.urlSlug ?? 'unknown-slug'));

    mutableDocument = deserializeMarkdownToDocument(content?.body ?? 'Header');

    mutableDocument?.addListener(_onDocumentChange);

    _composer = DocumentComposer();
    _composer.selectionNotifier.addListener(_onSelection);
    superEditor = SuperEditor(
        autofocus: true,
        composer: _composer,
        editor: DocumentEditor(
          document: mutableDocument ?? MutableDocument(),
        ));

    //superEditor!.
    //mutableDocument.

    // mutableDocument?.add(ImageNode(id: 'sadfasf', imageUrl: 'https://images.unsplash.com/photo-1687360440781-93a491d8eb58'));

    setState(() {});

    return initPage();
  }

  void _onDocumentChange() {
    //mutableDocument.
    print('do something');
  }

  void _onSelection() {
    //mutableDocument.
    //print('bisiler secildi');
    // print(_composer.selection?.base.nodeId);
    cursorNodeId = _composer.selection?.base.nodeId ?? '';
  }

  Future<EditableContent> initPage() async {
    print('editable content : ${editableContent!.name}');

    return editableContent!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,

      body: FutureBuilder(
        future: initPage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: SizedBox(
                    width: 800,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BannerWidget(maxWidth: 600),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                            child: Container(
                              //width: MediaQuery.of(context).size.width / 2,
                              margin: const EdgeInsets.all(50),

                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              onChanged: (value) {
                                                editableContent!.name = value;
                                                editableContent!.dirty = true;
                                                if ((editableContent?.isPublished ?? false) == false) {
                                                  String slug = value.toLowerCase().trimLeft().trimRight().replaceAll(nonAlphaNum, "").replaceAll(" ", "-");
                                                  slugController.text = slug;
                                                  editableContent!.urlSlug = slug;
                                                  setState(() {});
                                                }
                                              },
                                              initialValue: editableContent?.name,
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText: 'Title',
                                                hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.of(context).bodyText1,
                                              maxLines: null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
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
                                              initialValue: editableContent?.description ?? '',
                                              decoration: InputDecoration(
                                                labelText: 'Description',
                                                hintStyle: FlutterFlowTheme.of(context).bodyText2,
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: FlutterFlowTheme.of(context).primaryBackground,
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                errorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                                focusedErrorBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Color(0x00000000),
                                                    width: 2,
                                                  ),
                                                  borderRadius: BorderRadius.circular(8),
                                                ),
                                              ),
                                              style: FlutterFlowTheme.of(context).bodyText1,
                                              maxLines: null,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (widget.type == ContentType.ARTICLE) const Text("Content"),
                                    if (widget.type == ContentType.ARTICLE)
                                      FileUploadWithDrop(
                                          remoteDirectory: editableContent!.id,
                                          remoteFileName: Uuid().v1(),
                                          isPublic: true,
                                          fileType: FileType.OTHER,
                                          onVideoDurationKnown: (_) {},
                                          onComplete: (uploadedFile) {
                                            TextNode defaultNode = TextNode(id: Uuid().v1(), text: AttributedText(text: 'null text'));
                                            String paragraphNodeId = Uuid().v4();
                                            String currentNodeId = _composer.selection?.base.nodeId ?? Uuid().v4();
                                            mutableDocument?.insertNodeAfter(
                                                existingNode: mutableDocument?.getNodeById(currentNodeId) ?? defaultNode,
                                                newNode: ParagraphNode(id: paragraphNodeId, text: AttributedText(text: '''
                                    ''')));

                                            mutableDocument?.insertNodeBefore(
                                                existingNode: mutableDocument?.getNodeById(paragraphNodeId) ?? defaultNode,
                                                newNode: ImageNode(id: Uuid().v4(), imageUrl: uploadedFile.remoteUrl));

                                            // editableContent?.s3Url = uploadedFile.remoteUrl;
                                          },
                                          onClear: () {
                                            print('Clear the object here as well');
                                          }),
                                    /*if (widget.type == ContentType.ARTICLE)
                              Row(mainAxisSize: MainAxisSize.max, children: [
                                Expanded(
                                    child: TextFormField(
                                        maxLines: 100,
                                        initialValue: editableContent?.body ?? '',
                                        //initialValue: editableContent?.body ?? '',
                                        onChanged: (value) {
                                          editableContent?.body = value;
                                          editableContent!.dirty = true;
                                        })),
                              ]),*/
                                    if (widget.type == ContentType.ARTICLE)
                                      Row(mainAxisSize: MainAxisSize.max, children: [
                                        Expanded(child: superEditor),
                                      ]),
                                    if (widget.type == ContentType.DOCUMENT) const Text("Your file"),
                                    if (widget.type == ContentType.DOCUMENT)
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: FileUploadWithDrop(
                                                remoteDirectory: editableContent!.id,
                                                remoteFileName: 'file1',
                                                isPublic: false,
                                                remoteUrl: editableContent?.s3Url,
                                                fileType: FileType.OTHER,
                                                onVideoDurationKnown: (_) {},
                                                onComplete: (uploadedFile) {
                                                  editableContent?.s3Url = uploadedFile.remoteUrl;
                                                },
                                                onClear: () {
                                                  print('Clear the object here as well');
                                                }),
                                          ),
                                        ],
                                      ),
                                    const Text('Cover photo:'),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FileUploadWithDrop(
                                              remoteDirectory: editableContent!.id,
                                              remoteFileName: 'cover-photo',
                                              isPublic: true,
                                              remoteUrl: editableContent?.photoUrl,
                                              fileType: FileType.PICTURE,
                                              onVideoDurationKnown: (_) {},
                                              onComplete: (uploadedFile) {
                                                editableContent?.photoUrl = uploadedFile.remoteUrl;
                                              },
                                              onClear: () {
                                                print('Clear the object here as well');
                                              }),
                                        ),
                                      ],
                                    ),
                                    if (widget.type == ContentType.DOCUMENT) const Text("Your file"),
                                    const Text('Promo video :'),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Expanded(
                                          child: FileUploadWithDrop(
                                              remoteDirectory: editableContent!.id,
                                              remoteFileName: 'promo-video',
                                              isPublic: true,
                                              fileType: FileType.VIDEO,
                                              remoteUrl: editableContent?.promoVideoUrl,
                                              onComplete: (uploadedFile) {
                                                editableContent?.promoVideoUrl = uploadedFile.remoteUrl;
                                              },
                                              onVideoDurationKnown: (_) {},
                                              onClear: () {
                                                print('Clear the object here as well');
                                              }),
                                        ),
                                      ],
                                    ),
                                    if (widget.type == ContentType.ARTICLE)
                                      Row(mainAxisSize: MainAxisSize.max, children: [
                                        Expanded(
                                            child: Column(children: [
                                          Text('Show on main page'),
                                          Checkbox(
                                              value: editableContent?.showOnMainPage ?? true,
                                              onChanged: (value) {
                                                editableContent?.showOnMainPage = value;
                                                setState(() {});
                                              }),
                                          Text('Highlight on main page'),
                                          Checkbox(
                                              value: editableContent?.highlightOnMainPage ?? false,
                                              onChanged: (value) {
                                                editableContent?.highlightOnMainPage = value;
                                                setState(() {});
                                              }),
                                          Text('URL slug'),
                                          TextFormField(controller: slugController),
                                          Text('Meta title'),
                                          TextFormField(onChanged: (value) {}),
                                          Text('Meta description'),
                                          TextFormField(onChanged: (value) {})
                                        ]))
                                      ]),
                                    Row(children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                                        child: FFButtonWidget(
                                          onPressed: () {
                                            //print(docEditor.document.getNodeAt(0));
                                            saveContent();
                                            // save course here

                                            print('Button_Secondary pressed ...');
                                          },
                                          text: 'Save Changes',
                                          options: FFButtonOptions(
                                            width: 300,
                                            height: 50,
                                            color: const Color(0xFF4B39EF),
                                            textStyle: FlutterFlowTheme.of(context).bodyText2.override(
                                                  fontFamily: 'Lexend Deca',
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                            elevation: 3,
                                            borderSide: const BorderSide(
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
                    )));
          }
          return const Text('Loading');
        },
      ),
    );
  }

  Future<Content?> getContent(String id) async {
    const getContent = 'getContent';

    String graphQLQuery = '''query MyQuery2 {
              getContent(id: "$id") {
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
                body
                urlSlug
                showOnMainPage;
                highlightOnMainPage;
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
    ''';

    final request = GraphQLRequest<Content>(document: graphQLQuery, modelType: Content.classType, decodePath: getContent);

    try {
      var response = await Amplify.API.query(request: request).response;
      var retrievedContent = response.data ?? Content();

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

    final request = GraphQLRequest(document: graphQLQuery, modelType: const PaginatedModelType(Coworker.classType), decodePath: 'listCoworkers');

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

  /*Future<void> deleteExistingCoworkerRelations(Content content) async {
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

  Future<void> saveAuthors() async {
    if (content!.Coworkers != null) {
      for (ContentCoworker contentCoworker in content!.Coworkers ?? List.empty()) {
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
  }
  */

  Future<void> saveContent() async {
    String contentId = editableContent!.id;

    print('saving content with id ${editableContent!.id}');

    String id = editableContent!.id;

    print('editableContent new ${editableContent!.newItem}');

    editableContent?.type = widget.type;

    editableContent?.tenantId = StateContainer.of(context).tenantId;

    // do not change original creator
    // if (editableContent!.coworkerId!.isEmpty) editableContent?.coworkerId = StateContainer.of(context).coworkerId;

    editableContent?.urlSlug = slugController.text;

    editableContent?.body = serializeDocumentToMarkdown(mutableDocument ?? MutableDocument());

    if (editableContent!.newItem == true) {
      content = EditableContent.fromEditable(editableContent!);
      final contentSaveRequest = ModelMutations.create(content!);

      print(contentSaveRequest);

      var response = await Amplify.API.mutate(request: contentSaveRequest).response;
      print(response.data);
      print(response.errors);

      // content = content?.copyWith(Coworkers: List.empty(growable: true));

      /* content?.Coworkers?.add(ContentCoworker(
          content: content ?? Content(tenantID: StateContainer.of(context).tenantId ?? ''),
          coworker: Coworker(id: StateContainer.of(context).coworkerId, tenantID: StateContainer.of(context).tenantId ?? '')));

     

      saveAuthors();*/

      editableContent = EditableContent.toEditable(content!);
      editableContent!.newItem = false;
    } else {
      content = EditableContent.fromEditable(editableContent!);

      final contentSaveRequest = ModelMutations.update(content!);

      print(contentSaveRequest);

      var response = await Amplify.API.mutate(request: contentSaveRequest).response;

      print(response.data);
      print(response.errors);

      // deleteExistingCoworkerRelations(content!);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Good Job! Your content is saved.')),
    );

    setState(() {
      content = content;
    });
  }
}

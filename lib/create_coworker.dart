import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/Coworker.dart';
import 'package:contentpub_admin/models/ModelProvider.dart';
import 'package:contentpub_admin/custom_models//editable/editables.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class CreateAuthorWidget extends StatefulWidget {
  final String coworkerId;

  const CreateAuthorWidget({Key? key, required this.coworkerId})
      : super(key: key);

  @override
  _CreateAuthorWidgetState createState() => _CreateAuthorWidgetState();
}

class _CreateAuthorWidgetState extends State<CreateAuthorWidget> {
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Coworker? coworker;
  EditableCoworker? editableCoworker = EditableCoworker(id: '');

  @override
  void initState() {
    if (widget.coworkerId == '') {
      coworker = Coworker(id: Uuid().v4());
      editableCoworker = EditableCoworker.toEditable(coworker!);
      editableCoworker!.newItem = true;
    } else {
      _initCoworker();
    }

    super.initState();
  }

  Future<EditableCoworker> _initCoworker() async {
    coworker = await getCoworker(widget.coworkerId);
    print('in init coworker: $coworker');

    editableCoworker = EditableCoworker.toEditable(coworker!);

    print('editable coworker : ${editableCoworker!.displayName}');

    setState(() {
      coworker = coworker;
      editableCoworker = editableCoworker;
    });

    return editableCoworker!;
  }

  Future<EditableCoworker> _initPage() async {
    // editableCoworker = EditableCoworker.toEditable(coworker!);

    return editableCoworker!;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
          'Basic Coworker Information',
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
        future: _initPage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Center(
                child: SingleChildScrollView(
                    child: SizedBox(
                        width: 600,
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.all(50),
                                  child: Text('Basic Information :',
                                      style:
                                          FlutterFlowTheme.of(context).title1)),
                              Row(mainAxisSize: MainAxisSize.max, children: [
                                Expanded(
                                    child: TextFormField(
                                  onChanged: (value) {
                                    editableCoworker!.displayName = value;
                                    editableCoworker!.dirty = true;
                                  },
                                  initialValue: editableCoworker?.displayName,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Title is required for the coworker';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Title',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black87,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  maxLines: null,
                                ))
                              ]),
                              Row(mainAxisSize: MainAxisSize.max, children: [
                                Expanded(
                                    child: TextFormField(
                                  onChanged: (value) {
                                    editableCoworker!.description = value;
                                    editableCoworker!.dirty = true;
                                  },
                                  obscureText: false,
                                  initialValue:
                                      editableCoworker?.description ?? '',
                                  decoration: InputDecoration(
                                    labelText: 'Subtitle',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black87,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
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
                                ))
                              ]),
                              Row(mainAxisSize: MainAxisSize.max, children: [
                                Expanded(
                                    child: TextFormField(
                                  obscureText: false,
                                  initialValue:
                                      editableCoworker?.description ?? '',
                                  onChanged: (value) {
                                    editableCoworker!.description = value;
                                    editableCoworker!.dirty = true;
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Could you describe your coworker? Audience will need it';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Description',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Colors.black87,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  maxLines: 20,
                                )),
                              ]),
                              Padding(
                                padding:
                                    const EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                                child: Container(
                                  //width: MediaQuery.of(context).size.width / 2,

                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                            padding: const EdgeInsets.all(50),
                                            child: Text('Cover photo :',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1)),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: FileUploadWithDrop(
                                                  remoteDirectory: 'files',
                                                  remoteFileName:
                                                      '${editableCoworker!.id}-profile-photo',
                                                  isPublic: true,
                                                  remoteUrl: editableCoworker
                                                      ?.photoUrl,
                                                  fileType: FileType.PICTURE,
                                                  onComplete: (uploadedFile) {
                                                    editableCoworker?.photoUrl =
                                                        uploadedFile.remoteUrl;
                                                  },
                                                  onVideoDurationKnown: (_) {},
                                                  onClear: () {
                                                    print(
                                                        'Clear the object here as well');
                                                  }),
                                            ),
                                          ],
                                        ),
                                        Row(children: [
                                          const Spacer(),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 20),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                saveCoworker();
                                                // save coworker here

                                                print(
                                                    'Button_Secondary pressed ...');
                                              },
                                              text: 'Save Changes',
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
                        ))));
          }
          return const Text('Loading');
        },
      ),
    );
  }

  Future<Coworker?> getCoworker(String id) async {
    const getCoworker = 'getCoworker';

    String graphQLQuery = '''query MyQuery2 {
        getCoworker(id: "$id") {
          createdAt
          description
          displayName
          email
          id
          photoUrl
          updatedAt
        }
      }
    ''';

    final request = GraphQLRequest<Coworker>(
        document: graphQLQuery,
        modelType: Coworker.classType,
        variables: <String, String>{
          'coworkerId': id,
        },
        decodePath: getCoworker);

    try {
      var response = await Amplify.API.query(request: request).response;
      var retrievedItem = response.data ?? Coworker();

      //print('Retrieved coworker: ${mycourse}');
      return retrievedItem;
    } catch (e) {
      print(e);
    }

    return Coworker();
  }

  Future<void> saveCoworker() async {
    if (!_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Some information missing')),
      );
      return;
    }

    var uuid = Uuid();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saving the coworker')),
    );

    bool newItem = editableCoworker!.newItem;
    String coworkerId = (coworker!.id != '') ? coworker!.id : uuid.v4();

    coworker = Coworker(
      id: coworkerId,
      displayName: editableCoworker!.displayName,
      email: editableCoworker!.email,
      photoUrl: editableCoworker?.photoUrl,
      description: editableCoworker!.description,
    );

    if (newItem) {
      final courseSaveRequest = ModelMutations.create(coworker!);

      Amplify.API.mutate(request: courseSaveRequest);

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Coworker is created. It can be referenced from contents now')),
      );
      editableCoworker!.newItem = false;
    } else {
      final courseSaveRequest = ModelMutations.update(coworker!);

      Amplify.API.mutate(request: courseSaveRequest);

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Coworker is updated')),
      );
    }

    setState(() {
      coworker = coworker;
    });
  }
}

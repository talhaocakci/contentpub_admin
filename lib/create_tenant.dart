import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/create_settings.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/ModelProvider.dart';
import 'package:contentpub_admin/models/Tenant.dart';
import 'package:contentpub_admin/models/editable/editables.dart';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

class CreateTenantWidget extends StatefulWidget {
  final String tenantId;

  const CreateTenantWidget({Key? key, required this.tenantId})
      : super(key: key);

  @override
  _CreateTenantWidgetState createState() => _CreateTenantWidgetState();
}

class _CreateTenantWidgetState extends State<CreateTenantWidget> {
  String? coverPhotoUrl;
  String? promoVideoUrl;

  bool? switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Tenant? tenant;
  EditableTenant? editableTenant;

  String? coworkerId;

  @override
  void initState() {
    initTenant();
    super.initState();
  }

  Future<EditableTenant> initTenant() async {
    if (widget.tenantId == '') {
      tenant = Tenant(id: Uuid().v4());
      editableTenant = EditableTenant.toEditable(tenant!);
      editableTenant!.newItem = true;

      editableTenant!.testingConfiguration =
          EditableTenantConfiguration(id: '${editableTenant!.id}-staging');

      editableTenant!.productionConfiguration =
          EditableTenantConfiguration(id: '${editableTenant!.id}-prod');

      return editableTenant!;
    }

    tenant = await getTenant(widget.tenantId);
    editableTenant = EditableTenant.toEditable(tenant!);
    print('in init tenant: ${tenant}');

    setState(() {});

    return initPage();
  }

  Future<EditableTenant> initPage() async {
    print('editable tenant : ${editableTenant!.name}');

    return editableTenant!;
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
          'Basic tenant Information',
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
                                        editableTenant!.name = value;
                                      },
                                      initialValue: editableTenant?.name,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Name',
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
                                        editableTenant!.description = value;
                                      },
                                      obscureText: false,
                                      initialValue:
                                          editableTenant?.description ?? '',
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
                            Text('Cover photo:'),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FileUploadWithDrop(
                                      remoteDirectory: tenant!.id,
                                      remoteFileName: 'photo',
                                      isPublic: true,
                                      remoteUrl: editableTenant?.coverPhotoUrl,
                                      fileType: FileType.PICTURE,
                                      onComplete: (uploadedFile) {
                                        editableTenant?.coverPhotoUrl =
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
                                      remoteDirectory: editableTenant!.id,
                                      remoteFileName: 'promo-video',
                                      isPublic: true,
                                      fileType: FileType.VIDEO,
                                      remoteUrl: editableTenant?.promoVideoUrl,
                                      onComplete: (uploadedFile) {
                                        editableTenant?.promoVideoUrl =
                                            uploadedFile.remoteUrl;
                                      },
                                      onClear: () {
                                        print('Clear the object here as well');
                                      }),
                                ),
                              ],
                            ),
                            Text('Settings'),
                            SizedBox(
                              height: 300,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: DefaultTabController(
                                      length: 2,
                                      initialIndex: 0,
                                      child: Column(
                                        children: [
                                          TabBar(
                                            labelColor:
                                                FlutterFlowTheme.of(context)
                                                    .primaryColor,
                                            labelStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyText1,
                                            indicatorColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryColor,
                                            tabs: const [
                                              Tab(
                                                text: 'Staging',
                                              ),
                                              Tab(
                                                text: 'Prod',
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                SizedBox(
                                                    width: 100,
                                                    child: CreateSettingsWidget(
                                                      tenantId: '',
                                                      conf: editableTenant!
                                                              .testingConfiguration ??
                                                          EditableTenantConfiguration(
                                                              id: ''),
                                                    )),
                                                SizedBox(
                                                  width: 100,
                                                  child: CreateSettingsWidget(
                                                      tenantId: '',
                                                      conf: editableTenant!
                                                              .productionConfiguration ??
                                                          EditableTenantConfiguration(
                                                              id: '')),
                                                ),
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
                            Row(children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 12, 0, 12),
                                child: FFButtonWidget(
                                  onPressed: () {
                                    saveTenant();
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

  Future<Tenant?> getTenant(String id) async {
    String graphQLQuery = '''query MyQuery {
          getTenant(id: "${id}") {
            coverPhotoUrl
            createdAt
            description
            id
            name
            productionConfiguration {
              updatedAt
              stripeWebhookUrl
              stripeWebhookSecretKey
              stripeSecretKey
              id
              createdAt
              contentpubApiKey
            }
            promoVideoUrl
            tenantProductionConfigurationId
            tenantTestingConfigurationId
            testingConfiguration {
              contentpubApiKey
              createdAt
              id
              stripeSecretKey
              stripeWebhookSecretKey
              stripeWebhookUrl
              updatedAt
            }
            updatedAt
          }
        }
    ''';

    final request = GraphQLRequest<Tenant>(
        document: graphQLQuery,
        modelType: Tenant.classType,
        decodePath: 'getTenant');

    try {
      var response = await Amplify.API.query(request: request).response;
      var retrievedtenant = response.data ?? Tenant();

      //print('Retrieved course: ${mycourse}');
      return retrievedtenant;
    } catch (e) {
      print(e);
    }

    return Tenant();
  }

  Future<void> saveTenant() async {
    String tenantId = editableTenant!.id;

    print('saving tenant with id ${editableTenant!.id}');

    String id = editableTenant!.id;

    print('editableTenant new ${editableTenant!.newItem}');

    if (editableTenant!.newItem == true) {
      tenant = EditableTenant.fromEditable(editableTenant!);
      final tenantSaveRequest = ModelMutations.create(tenant!);

      var response =
          await Amplify.API.mutate(request: tenantSaveRequest).response;
      print(response.data);
      print(response.errors);

      tenant = response.data;

      if (editableTenant!.testingConfiguration != null) {
        final confSaveRequest = ModelMutations.create(
            EditableTenantConfiguration.fromEditable(
                editableTenant!.testingConfiguration!));

        var response =
            await Amplify.API.mutate(request: confSaveRequest).response;

        print(response.data);
        print(response.errors);
      }

      if (tenant!.productionConfiguration != null) {
        final confSaveRequest = ModelMutations.create(
            EditableTenantConfiguration.fromEditable(
                editableTenant!.productionConfiguration!));

        var response =
            await Amplify.API.mutate(request: confSaveRequest).response;

        print(response.data);
        print(response.errors);
      }

      editableTenant = EditableTenant.toEditable(tenant!);
      editableTenant!.newItem = false;
    } else {
      Tenant t = EditableTenant.fromEditable(editableTenant!);

      final tenantSaveRequest = ModelMutations.update(t);

      var response =
          await Amplify.API.mutate(request: tenantSaveRequest).response;

      print(response.data);
      print(response.errors);

      if (t.testingConfiguration != null) {
        TenantConfiguration c =
            t.testingConfiguration ?? TenantConfiguration(id: t.id);

        final confSaveRequest = ModelMutations.update(c);

        var response =
            await Amplify.API.mutate(request: confSaveRequest).response;

        print(response.data);
        print(response.errors);
      }

      if (t!.productionConfiguration != null) {
        TenantConfiguration c =
            t!.productionConfiguration ?? TenantConfiguration(id: t.id);

        final confSaveRequest = ModelMutations.update(c);

        print(confSaveRequest);

        var response =
            await Amplify.API.mutate(request: confSaveRequest).response;

        print(response.data);
        print(response.errors);
      }
    }

    setState(() {
      tenant = tenant;
    });
  }
}

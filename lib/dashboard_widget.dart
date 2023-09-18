import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:contentpub_admin/create_coworker.dart';
import 'package:contentpub_admin/create_product.dart';
import 'package:contentpub_admin/create_tenant.dart';
import 'package:contentpub_admin/list_contents.dart';
import 'package:contentpub_admin/state_container.dart';

import '../flutter_flow/flutter_flow_theme.dart';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void dispose() {
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Authenticator(
            signInForm: SignInForm(
              includeDefaultSocialProviders: false,
            ),
            child: MaterialApp(
                // theme: theme,
                builder: Authenticator.builder(),
                home: Scaffold(
                    body: // display progress indicator
                        Center(
                            child: SizedBox(
                  width: 600,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(24, 12, 0, 0),
                            child: Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              alignment: WrapAlignment.start,
                              crossAxisAlignment: WrapCrossAlignment.start,
                              direction: Axis.horizontal,
                              runAlignment: WrapAlignment.start,
                              verticalDirection: VerticalDirection.down,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  width: 160,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                    boxShadow: [
                                      const BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ListContentsWidget()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                              child: Icon(
                                                Icons.schedule_rounded,
                                                color: Colors.white,
                                                size: 44,
                                              ),
                                            ),
                                            Text(
                                              'Your contents',
                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                    fontFamily: 'Brazila',
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Container(
                                  width: 160,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primaryColor,
                                    boxShadow: [
                                      const BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        const Padding(
                                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                          child: Icon(
                                            Icons.meeting_room_outlined,
                                            color: Colors.white,
                                            size: 44,
                                          ),
                                        ),
                                        Text(
                                          'Create a document',
                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                fontFamily: 'Brazila',
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 160,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                    boxShadow: [
                                      const BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const CreateTenantWidget(
                                                      tenantId: '',
                                                    )));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                              child: Icon(
                                                Icons.schedule_rounded,
                                                color: Colors.white,
                                                size: 44,
                                              ),
                                            ),
                                            Text(
                                              'Project Settings',
                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                    fontFamily: 'Brazila',
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Container(
                                  width: 160,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).secondaryColor,
                                    boxShadow: [
                                      const BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context, MaterialPageRoute(builder: (context) => CreateAuthorWidget(coworkerId: StateContainer.of(context).coworkerId ?? '')));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            const Padding(
                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                              child: Icon(
                                                Icons.schedule_rounded,
                                                color: Colors.white,
                                                size: 44,
                                              ),
                                            ),
                                            Text(
                                              'Update user settings',
                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                    fontFamily: 'Brazila',
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                                Container(
                                  width: 160,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    boxShadow: [
                                      const BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                          child: Icon(
                                            Icons.group_add_rounded,
                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                            size: 44,
                                          ),
                                        ),
                                        Text(
                                          'Create newsletter',
                                          style: FlutterFlowTheme.of(context).bodyText2.override(
                                                fontFamily: 'Brazila',
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                fontWeight: FontWeight.normal,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 160,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primaryText,
                                    boxShadow: [
                                      const BoxShadow(
                                        blurRadius: 3,
                                        color: Color(0x33000000),
                                        offset: Offset(0, 1),
                                      )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => const CreateProductWidget(
                                                      bundleId: '',
                                                    )));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
                                              child: Icon(
                                                Icons.attach_money_rounded,
                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                size: 44,
                                              ),
                                            ),
                                            Text(
                                              'Create bundle',
                                              style: FlutterFlowTheme.of(context).bodyText2.override(
                                                    fontFamily: 'Brazila',
                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                    fontWeight: FontWeight.normal,
                                                    useGoogleFonts: false,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ))))));
  }
}

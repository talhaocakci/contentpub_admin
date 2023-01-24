import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/course/create_curriculum.dart';
import 'package:contentpub_admin/create_product.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/models/Course.dart';
import 'package:contentpub_admin/models/Lesson.dart';
import 'package:contentpub_admin/models/Section.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:uuid/uuid.dart';

class CreateCourseWidget extends StatefulWidget {
  const CreateCourseWidget({Key? key}) : super(key: key);

  @override
  _CreateCourseWidgetState createState() => _CreateCourseWidgetState();
}

class _CreateCourseWidgetState extends State<CreateCourseWidget> {
  String? coverPhotoUrl;
  String? promoVideoUrl;
  TextEditingController? titleTextController;
  TextEditingController? subtitleTextController;
  TextEditingController? descriptionTextController;
  bool? switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    titleTextController = TextEditingController();
    subtitleTextController = TextEditingController();
    descriptionTextController = TextEditingController();
  }

  @override
  void dispose() {
    titleTextController?.dispose();
    subtitleTextController?.dispose();
    descriptionTextController?.dispose();
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
          'Basic Course Information',
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
              child: Container(
                width: MediaQuery.of(context).size.width,
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
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Image.network(
                                    'https://images.unsplash.com/photo-1626544827763-d516dce335e2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTc1fHxwcm9kdWN0fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                                    width: MediaQuery.of(context).size.width,
                                    height: 130,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      color: Color(0x77090F13),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        FlutterFlowIconButton(
                                          borderColor: Colors.transparent,
                                          borderRadius: 30,
                                          buttonSize: 48,
                                          icon: Icon(
                                            Icons.photo_camera,
                                            color: Colors.white,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            print('IconButton pressed ...');
                                          },
                                        ),
                                        Text(
                                          'Change Cover Photo',
                                          style: GoogleFonts.getFont(
                                            'DM Sans',
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FileUploadWithDrop(
                                fileType: FileType.PICTURE,
                                onComplete: (uploadedFile) {
                                  coverPhotoUrl = uploadedFile.remoteUrl;
                                },
                                onClear: () {
                                  print('Clear the object here as well');
                                }),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: FileUploadWithDrop(
                                fileType: FileType.VIDEO,
                                onComplete: (uploadedFile) {
                                  promoVideoUrl = uploadedFile.remoteUrl;
                                  print(uploadedFile.remoteUrl);
                                },
                                onClear: () {
                                  print('Clear the object here as well');
                                }),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: titleTextController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Title',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
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
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
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
                        padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: subtitleTextController,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Subtitle',
                                  hintStyle:
                                      FlutterFlowTheme.of(context).bodyText2,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
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
                                    borderSide: BorderSide(
                                      color: Color(0x00000000),
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
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
                      Container(
                        height: 200,
                        child: TextFormField(
                          controller: descriptionTextController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Description',
                            hintStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context)
                                    .primaryBackground,
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
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                          maxLines: 20,
                        ),
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(),
                      ),
                      SwitchListTile.adaptive(
                        value: switchListTileValue ??= true,
                        onChanged: (newValue) async {
                          setState(() => switchListTileValue = newValue!);
                        },
                        title: Text(
                          'Recieve Notifications',
                          style: FlutterFlowTheme.of(context).subtitle2,
                        ),
                        subtitle: Text(
                          'Turn on notifications.',
                          style: FlutterFlowTheme.of(context).bodyText2,
                        ),
                        tileColor: Colors.white,
                        activeColor: Color(0xFF4B39EF),
                        activeTrackColor: Color(0x8D4B39EF),
                        dense: false,
                        controlAffinity: ListTileControlAffinity.trailing,
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                        child: FFButtonWidget(
                          onPressed: () {
                            saveCourseAndNavigate();
                            // save course here
                            ;

                            print('Button_Secondary pressed ...');
                          },
                          text: 'Save Changes and continue curriculum',
                          options: FFButtonOptions(
                            width: 300,
                            height: 50,
                            color: Color(0xFF4B39EF),
                            textStyle:
                                FlutterFlowTheme.of(context).bodyText2.override(
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
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveCourseAndNavigate() async {
    var uuid = Uuid();

    String courseId = uuid.v4();
    String sectionId = uuid.v4();
    String lessonId = uuid.v4();

    Course course = Course(
        id: courseId,
        title: titleTextController!.text,
        subtitle: subtitleTextController!.text,
        description: descriptionTextController!.text);

    Section section =
        Section(id: sectionId, courseID: courseId, name: 'Section 1');

    final sectionSaveRequest = ModelMutations.create(section);

    Amplify.API.mutate(request: sectionSaveRequest);

    print('Section id: ${section.id}');

    Lesson lesson =
        Lesson(id: lessonId, sectionID: sectionId, name: 'Lesson 1');

    final lessonSaveRequest = ModelMutations.create(lesson);

    Amplify.API.mutate(request: lessonSaveRequest);

    print('Lesson id: ${lesson.id}');

    section = section.copyWith(Lessons: [lesson]);

    course = course.copyWith(Sections: [section]);

    final courseSaveRequest = ModelMutations.create(course);

    await Amplify.API.mutate(request: courseSaveRequest).response;

    print('Course id: ${course.id}');

    setState(() {
      course = course;
    });

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CurriculumCreateWidget(
                  courseId: course.id,
                )));
  }
}

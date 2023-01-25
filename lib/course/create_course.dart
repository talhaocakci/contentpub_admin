import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/course/create_curriculum.dart';
import 'package:contentpub_admin/create_product.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/Content.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/models/Course.dart';
import 'package:contentpub_admin/models/Lesson.dart';
import 'package:contentpub_admin/models/Section.dart';
import 'package:contentpub_admin/models/editable/editables.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:uuid/uuid.dart';

class CreateCourseWidget extends StatefulWidget {
  final String courseId;

  const CreateCourseWidget({Key? key, required this.courseId})
      : super(key: key);

  @override
  _CreateCourseWidgetState createState() => _CreateCourseWidgetState();
}

class _CreateCourseWidgetState extends State<CreateCourseWidget> {
  String? coverPhotoUrl;
  String? promoVideoUrl;

  bool? switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  Course? course;
  EditableCourse? editableCourse;

  @override
  void initState() {
    if (widget.courseId != '') {
      initCourse();
    } else {
      course = Course();
    }

    super.initState();
  }

  Future<EditableCourse> initCourse() async {
    course = await getCourse(widget.courseId);
    print('in initCourse: ${course}');

    editableCourse =
        course != null ? EditableCourse.toEditable(course!) : EditableCourse();

    print('editable course : ${editableCourse!.title}');

    return editableCourse ?? EditableCourse();
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
      body: FutureBuilder(
        future: initCourse(),
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 130,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text('Cover photo:'),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: FileUploadWithDrop(
                                      isPublic: true,
                                      remoteUrl: editableCourse?.coverPhotoUrl,
                                      fileType: FileType.PICTURE,
                                      onComplete: (uploadedFile) {
                                        editableCourse?.coverPhotoUrl =
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
                                      isPublic: true,
                                      fileType: FileType.VIDEO,
                                      remoteUrl: editableCourse?.promoVideoUrl,
                                      onComplete: (uploadedFile) {
                                        editableCourse?.promoVideoUrl =
                                            uploadedFile.remoteUrl;
                                      },
                                      onClear: () {
                                        print('Clear the object here as well');
                                      }),
                                ),
                              ],
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
                                        editableCourse!.title = value;
                                        editableCourse!.dirty = true;
                                      },
                                      initialValue: editableCourse?.title,
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
                                        editableCourse!.subtitle = value;
                                        editableCourse!.dirty = true;
                                      },
                                      obscureText: false,
                                      initialValue:
                                          editableCourse?.subtitle ?? '',
                                      decoration: InputDecoration(
                                        labelText: 'Subtitle',
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
                            Container(
                              height: 200,
                              child: TextFormField(
                                obscureText: false,
                                initialValue: editableCourse?.description ?? '',
                                onChanged: (value) {
                                  editableCourse!.description = value;
                                  editableCourse!.dirty = true;
                                },
                                decoration: InputDecoration(
                                  labelText: 'Description',
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
                                maxLines: 20,
                              ),
                            ),
                            /*SwitchListTile.adaptive(
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
                           */
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                              child: FFButtonWidget(
                                onPressed: () {
                                  saveCourseAndNavigate();
                                  // save course here

                                  print('Button_Secondary pressed ...');
                                },
                                text: 'Save Changes and continue curriculum',
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

  Future<Course?> getCourse(String id) async {
    const getCourse = 'getCourse';

    String graphQLQuery =
        '''query GetCourseDetailsWithLessonSummaries(\$courseId: ID!) {
              $getCourse(id: \$courseId) {
                title
                subtitle
                thumbnail
                stripeProduct
                id
                description
                coverPhotoUrl
                promoVideoUrl
              }
            }
    ''';

    final request = GraphQLRequest<Course>(
        document: graphQLQuery,
        modelType: Course.classType,
        variables: <String, String>{
          'courseId': id,
        },
        decodePath: getCourse);

    try {
      var response = await Amplify.API.query(request: request).response;
      var retrievedCourse = response.data ?? Course();

      //print('Retrieved course: ${mycourse}');
      return retrievedCourse;
    } catch (e) {
      print(e);
    }

    return Course();
  }

  Future<void> saveCourseAndNavigate() async {
    var uuid = Uuid();

    String courseId = (widget.courseId != '') ? widget.courseId : uuid.v4();
    String sectionId = uuid.v4();
    String lessonId = uuid.v4();
    String contentId = uuid.v4();

    Course course = Course(
        id: courseId,
        title: editableCourse!.title,
        subtitle: editableCourse!.subtitle,
        courseContentId: contentId,
        coverPhotoUrl: editableCourse?.coverPhotoUrl,
        promoVideoUrl: editableCourse?.promoVideoUrl,
        description: editableCourse!.description);

    if (widget.courseId == '') {
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

      print('Course to save ${course}');

      final courseSaveRequest = ModelMutations.create(course);

      var response =
          await Amplify.API.mutate(request: courseSaveRequest).response;

      print('Saved course ${response}');
      print('Saved course errors: ${response.errors}');

      print('Retrieved course id: ${course.id}');

      var content = Content(
          id: contentId,
          type: ContentType.COURSE,
          objectId: courseId,
          name: course.title);

      final contentSaveRequest = ModelMutations.create(content);

      await Amplify.API.mutate(request: contentSaveRequest).response;

      print('Course id ${course.id}');
      print('Course id ${course}');
    }

    if (course.id == '') {
      final courseSaveRequest = ModelMutations.create(course!);

      Amplify.API.mutate(request: courseSaveRequest);
    } else {
      final courseSaveRequest = ModelMutations.update(course!);

      Amplify.API.mutate(request: courseSaveRequest);
    }

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

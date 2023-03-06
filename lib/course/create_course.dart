import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/course/create_curriculum.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/Content.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/models/Course.dart';
import 'package:contentpub_admin/models/Lesson.dart';
import 'package:contentpub_admin/models/Section.dart';
import 'package:contentpub_admin/models/editable/editables.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:simple_markdown_editor/simple_markdown_editor.dart';

import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_widgets.dart';

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

  TextEditingController _descriptionController = TextEditingController();

  bool? switchListTileValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();

  Course? course;
  EditableCourse? editableCourse;

  bool isNewCourse = true;

  @override
  void initState() {
    if (widget.courseId == '') {
      String id = Uuid().v4();
      course = Course(id: id);
      editableCourse = EditableCourse.toEditable(course!);
    } else {
      isNewCourse = false;
      course = Course(id: widget.courseId);
      _initCourse();
    }

    super.initState();
  }

  Future<EditableCourse> _initCourse() async {
    course = await getCourse(course!.id);
    print('in initCourse: ${course}');

    editableCourse =
        course != null ? EditableCourse.toEditable(course!) : EditableCourse();

    print('editable course : ${editableCourse!.title}');

    _descriptionController.text = editableCourse?.description ?? '';

    setState(() {
      course = course;
      editableCourse = editableCourse;
    });

    return editableCourse ?? EditableCourse();
  }

  Future<EditableCourse> _initPage() async {
    return editableCourse!;
  }

  @override
  void dispose() {
    super.dispose();
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
                                  padding: EdgeInsets.all(50),
                                  child: Text('Basic Information :',
                                      style:
                                          FlutterFlowTheme.of(context).title1)),
                              Row(mainAxisSize: MainAxisSize.max, children: [
                                Expanded(
                                    child: TextFormField(
                                  onChanged: (value) {
                                    editableCourse!.title = value;
                                    editableCourse!.dirty = true;
                                  },
                                  initialValue: editableCourse?.title,
                                  obscureText: false,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Title is required for the course';
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    labelText: 'Title',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
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
                                      borderSide: BorderSide(
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
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
                                    editableCourse!.subtitle = value;
                                    editableCourse!.dirty = true;
                                  },
                                  obscureText: false,
                                  initialValue: editableCourse?.subtitle ?? '',
                                  decoration: InputDecoration(
                                    labelText: 'Subtitle',
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
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
                                ))
                              ]),
                              Row(mainAxisSize: MainAxisSize.max, children: [
                                SizedBox(
                                  height: 400,
                                  width: 600,
                                  child: MarkdownFormField(
                                      enableToolBar: true,
                                      readOnly: false,
                                      controller: _descriptionController,
                                      onChanged: (value) {
                                        editableCourse!.description = value;
                                        editableCourse!.dirty = true;
                                      }),
                                ),
                              ]),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                                child: Container(
                                  //width: MediaQuery.of(context).size.width / 2,

                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(50),
                                            child: Text('Cover photo :',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1)),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: FileUploadWithDrop(
                                                  remoteDirectory: course!.id,
                                                  remoteFileName: 'cover-photo',
                                                  isPublic: true,
                                                  remoteUrl: editableCourse
                                                      ?.coverPhotoUrl,
                                                  fileType: FileType.PICTURE,
                                                  onComplete: (uploadedFile) {
                                                    editableCourse
                                                            ?.coverPhotoUrl =
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
                                        Padding(
                                            padding: EdgeInsets.all(50),
                                            child: Text('Promo video :',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title1)),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: FileUploadWithDrop(
                                                  remoteDirectory: course!.id,
                                                  remoteFileName: 'promo-video',
                                                  isPublic: true,
                                                  fileType: FileType.VIDEO,
                                                  remoteUrl: editableCourse
                                                      ?.promoVideoUrl,
                                                  onComplete: (uploadedFile) {
                                                    editableCourse
                                                            ?.promoVideoUrl =
                                                        uploadedFile.remoteUrl;
                                                  },
                                                  onVideoDurationKnown:
                                                      (duration) {
                                                    print(
                                                        'update duration with $duration');
                                                  },
                                                  onClear: () {
                                                    print(
                                                        'Clear the object here as well');
                                                  }),
                                            ),
                                          ],
                                        ),
                                        Row(children: [
                                          if (course!.id != '')
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: 10, top: 20),
                                              child: FFButtonWidget(
                                                onPressed: () {
                                                  goToCurriculum(course!.id);
                                                  // save course here

                                                  print(
                                                      'Button_Secondary pressed ...');
                                                },
                                                text: 'Edit Curricilum',
                                              ),
                                            ),
                                          Spacer(),
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, top: 20),
                                            child: FFButtonWidget(
                                              onPressed: () {
                                                saveCourse();
                                                // save course here

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

  Future<void> saveCourse() async {
    if (!_formKey.currentState!.validate()) {
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Some information missing, lets complete them for better information for your audience')),
      );
      return;
    }

    var uuid = Uuid();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Saving the course')),
    );

    String sectionId = uuid.v4();
    String lessonId = uuid.v4();
    String contentId = uuid.v4();

    course = EditableCourse.fromEditable(editableCourse!);

    if (isNewCourse) {
      Section section =
          Section(id: sectionId, courseID: course!.id, name: 'Section 1');

      final sectionSaveRequest = ModelMutations.create(section);

      Amplify.API.mutate(request: sectionSaveRequest);

      print('Section id: ${section.id}');

      Lesson lesson =
          Lesson(id: lessonId, sectionID: sectionId, name: 'Lesson 1');

      final lessonSaveRequest = ModelMutations.create(lesson);

      Amplify.API.mutate(request: lessonSaveRequest);

      print('Lesson id: ${lesson.id}');

      section = section.copyWith(Lessons: [lesson]);

      course = course!.copyWith(Sections: [section]);

      print('Course to save ${course}');

      final courseSaveRequest = ModelMutations.create(course!);

      var response =
          await Amplify.API.mutate(request: courseSaveRequest).response;

      print('Saved course ${response}');
      print('Saved course errors: ${response.errors}');

      print('Retrieved course id: ${course!.id}');

      var content = Content(
          id: course!.id, // use the same id with course for simplicity
          type: ContentType.COURSE,
          objectId: course!.id, // this will not be needed
          name: course!.title);

      final contentSaveRequest = ModelMutations.create(content);

      await Amplify.API.mutate(request: contentSaveRequest).response;

      print('Course id ${course!.id}');
      print('Course id ${course}');

      isNewCourse = false;
    }

    if (isNewCourse) {
      final courseSaveRequest = ModelMutations.create(course!);

      Amplify.API.mutate(request: courseSaveRequest);

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Course is created, you can go on adding lessons to it.')),
      );
    } else {
      final courseSaveRequest = ModelMutations.update(course!);

      Amplify.API.mutate(request: courseSaveRequest);

      ScaffoldMessenger.of(context).clearSnackBars();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content:
                Text('Course is updated, you can go on adding lessons to it.')),
      );
    }

    setState(() {
      course = course;
    });
  }

  void goToCurriculum(String courseId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CurriculumCreateWidget(
                  courseId: courseId,
                )));
  }

  void goToProductPage() {}
}

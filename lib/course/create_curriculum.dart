import 'package:amplify_api/amplify_api.dart';
import 'package:contentpub_admin/aws_s3.dart';
import 'package:contentpub_admin/create_product.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/models/Course.dart';
import 'package:contentpub_admin/models/Lesson.dart';
import 'package:contentpub_admin/models/Section.dart';
import 'package:contentpub_admin/models/editable/editables.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:video_player/video_player.dart';

class CurriculumCreateWidget extends StatefulWidget {
  final String courseId;

  const CurriculumCreateWidget({required this.courseId, super.key});

  @override
  State<CurriculumCreateWidget> createState() => CurriculumCreateWidgetState();
}

class CurriculumCreateWidgetState extends State<CurriculumCreateWidget> {
  bool _customTileExpanded = false;
  Course? course;
  EditableCourse? editableCourse;

  final ScrollController _firstController = ScrollController();

  @override
  void initState() {
    initWidget();

    super.initState();
  }

  void initWidget() async {
    Course mycourse = await getCourseDetails() ?? Course();

    editableCourse = EditableCourse.toEditable(mycourse);

    setState(() {
      course = mycourse;
      editableCourse = editableCourse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            controller: _firstController,
            child: Column(
              children: <Widget>[
                ElevatedButton(
                    onPressed: () async {
                      saveCourse();
                    },
                    child: const Text("Save the course")),
                ElevatedButton(
                    onPressed: () async {
                      setState(() {
                        course = course;
                      });
                    },
                    child: const Text("Add section")),
                for (var section in editableCourse?.Sections ?? List.empty())
                  ExpansionTile(
                      trailing: ElevatedButton(
                          onPressed: () {
                            section.Lessons.add(EditableLesson(
                                sectionID: section.id, name: 'New lesson'));
                            setState(() {
                              course = course;
                            });
                          },
                          child: Text('Add Lesson')),
                      initiallyExpanded: (course?.Sections as List).length == 1,
                      title: Text(section.name ?? 'Please insert title'),
                      leading: Icon(
                        _customTileExpanded
                            ? Icons.arrow_drop_down_circle
                            : Icons.arrow_drop_down,
                      ),
                      children: <Widget>[
                        for (var lesson in section.Lessons)
                          Padding(
                              padding: EdgeInsets.only(left: 50),
                              child: ExpansionTile(
                                initiallyExpanded:
                                    (section?.Lessons as List).length == 1,
                                title:
                                    Text(lesson.name ?? 'Please insert title'),
                                leading: Icon(
                                  _customTileExpanded
                                      ? Icons.arrow_drop_down_circle
                                      : Icons.arrow_drop_down,
                                ),
                                children: <Widget>[
                                  Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Container(
                                                width: 300,
                                                child: FileUploadWithDrop(
                                                  remoteUrl: lesson.video,
                                                  fileType: FileType.VIDEO,
                                                  onComplete: (uploadedFile) {
                                                    var editable = (lesson
                                                        as EditableLesson);
                                                    editable.video =
                                                        uploadedFile.remoteUrl;
                                                    editable.dirty = true;
                                                    section.dirty = true;
                                                    print(lesson.video);
                                                    setState(() {
                                                      lesson = lesson;
                                                    });
                                                  },
                                                  onClear: () {},
                                                ))),
                                        Expanded(
                                            child: FormBuilder(
                                                child: FormBuilderTextField(
                                          name: 'text',
                                          initialValue: lesson.name,
                                          onChanged: (val) {
                                            print(val);
                                          },
                                        ))),
                                      ]),
                                ],
                                onExpansionChanged: (bool expanded) {
                                  setState(
                                      () => _customTileExpanded = expanded);
                                },
                              ))
                      ]),
              ],
            )));
  }

  void saveCourse() async {
    //course = EditableCourse.fromEditable(editableCourse ?? EditableCourse());

    for (EditableSection section in editableCourse!.Sections ?? List.empty()) {
      for (EditableLesson lesson in section.Lessons ?? List.empty()) {
        if (lesson.dirty) {
          lesson.sectionID = section.id;
          if (lesson.newItem) {
            var lessonSaveRequest =
                ModelMutations.create(EditableLesson.fromEditable(lesson));
            print(lessonSaveRequest.document);
            print(lessonSaveRequest.variables);
            var response =
                await Amplify.API.mutate(request: lessonSaveRequest).response;
            print(response.errors);
            print(response.data);
          } else {
            var lessonSaveRequest =
                ModelMutations.update(EditableLesson.fromEditable(lesson));
            print(lessonSaveRequest.document);
            print(lessonSaveRequest.variables);
            var response =
                await Amplify.API.mutate(request: lessonSaveRequest).response;
            print(response.errors);
            print(response.data);
          }
        }
      }

      // final sectionSaveRequest = ModelMutations.create(section);

      // Amplify.API.mutate(request: sectionSaveRequest);
    }

    // final courseSaveRequest = ModelMutations.create(course);

    //Amplify.API.mutate(request: courseSaveRequest);

    //print('Course id: ${course!.id}');
  }

  Future<Course?> getCourseDetails() async {
    const getCourse = 'getCourse';

    String graphQLQuery =
        '''query GetCourseDetailsWithLessonSummaries(\$courseId: ID!) {
              $getCourse(id: \$courseId) {
                title
                thumbnail
                stripeProduct
                id
                description
                
                Sections {
                  items {
                    id
                    name
                    description
                    Lessons {
                      items {
                        id
                        name
                        video
                        description
                        sectionID
                      }
                    }
                  }
                }
              }
            }
    ''';

    final request = GraphQLRequest<Course>(
        document: graphQLQuery,
        modelType: Course.classType,
        variables: <String, String>{
          'courseId': widget.courseId,
        },
        decodePath: getCourse);

    try {
      var response = await Amplify.API.query(request: request).response;
      var course = response.data;
      print(course);
      for (var section in course?.Sections ?? List.empty()) {
        for (var lesson in section.Lessons ?? List.empty()) {
          print(lesson);
        }
      }
      return course;
    } catch (e) {
      print(e);
    }

    return Course();
  }
}

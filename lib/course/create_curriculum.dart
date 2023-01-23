import 'package:amplify_api/amplify_api.dart';
import 'package:contentpub_admin/aws_s3.dart';
import 'package:contentpub_admin/create_product.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/models/Course.dart';
import 'package:contentpub_admin/models/Lesson.dart';
import 'package:contentpub_admin/models/Section.dart';
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

  final ScrollController _firstController = ScrollController();

  @override
  void initState() {
    initWidget();

    super.initState();
  }

  void initWidget() async {
    Course mycourse = await getCourseDetails() ?? Course();
    setState(() {
      course = mycourse;
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
                      course!.Sections!.add(
                          Section(courseID: course!.id, name: 'New section'));
                      setState(() {
                        course = course;
                      });
                    },
                    child: const Text("Add section")),
                for (var section in course?.Sections ?? List.empty())
                  ExpansionTile(
                      trailing: ElevatedButton(
                          onPressed: () {
                            section.Lessons.add(Lesson(
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
                                                  sourceObject: lesson,
                                                  fileType: FileType.VIDEO,
                                                  onComplete: (uploadedFile,
                                                      sourceObject) {
                                                    List<Lesson> lessons =
                                                        (section.Lessons
                                                            as List<Lesson>);

                                                    int sourceLessonIndex =
                                                        lessons.indexOf(
                                                            sourceObject);

                                                    print(
                                                        '${sourceLessonIndex}. remove edilecek');

                                                    lessons.remove(
                                                        sourceLessonIndex);

                                                    Lesson newLesson =
                                                        (sourceObject as Lesson)
                                                            .copyWith(
                                                                sectionID:
                                                                    section.id,
                                                                video: uploadedFile
                                                                    .remoteUrl);

                                                    print(newLesson);
                                                    lessons.insert(
                                                        sourceLessonIndex,
                                                        newLesson);

                                                    print(uploadedFile);
                                                    print(sourceObject.video);
                                                    setState(() {});
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

  void saveCourse() {
    for (Section section in course!.Sections ?? List.empty()) {
      for (Lesson lesson in section.Lessons ?? List.empty()) {
        final lessonSaveRequest = ModelMutations.create(lesson);
        print(lesson);
        Amplify.API.mutate(request: lessonSaveRequest);
      }

      final sectionSaveRequest = ModelMutations.create(section);

      Amplify.API.mutate(request: sectionSaveRequest);
    }

    final courseSaveRequest = ModelMutations.create(course!);

    Amplify.API.mutate(request: courseSaveRequest);

    print('Course id: ${course!.id}');

    setState(() {
      course = course;
    });
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

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/Course.dart';
import 'package:contentpub_admin/custom_models/editable/editables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:uuid/uuid.dart';

var uuid = Uuid();

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
                      String sectionId = uuid.v4();

                      var newSection = EditableSection(
                          courseID: editableCourse?.id, name: 'New section');

                      newSection.id = sectionId;
                      newSection.dirty = true;
                      newSection.newItem = true;

                      newSection.Lessons = [
                        EditableLesson(
                            dirty: true,
                            newItem: true,
                            sectionID: sectionId,
                            name: 'New lesson')
                      ];

                      editableCourse?.Sections?.add(newSection);
                      setState(() {});
                    },
                    child: const Text("Add section")),
                for (var section in editableCourse?.Sections ?? List.empty())
                  ExpansionTile(
                      expandedCrossAxisAlignment: CrossAxisAlignment.start,
                      trailing: ElevatedButton(
                          onPressed: () {
                            section.Lessons.add(EditableLesson(
                                id: uuid.v4(),
                                dirty: true,
                                sectionID: section.id,
                                name: 'New lesson'));
                            setState(() {
                              course = course;
                            });
                          },
                          child: Text('Add Lesson')),
                      initiallyExpanded: (course?.Sections as List).length == 1,
                      title: Text(section.name ?? 'Please insert title',
                          style: TextStyle(
                              color: (!section.dirty)
                                  ? Colors.greenAccent
                                  : Colors.redAccent)),
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
                                title: Text(
                                  lesson.name ?? 'Please insert title',
                                  style: TextStyle(
                                      color: (!lesson.dirty)
                                          ? Colors.greenAccent
                                          : Colors.redAccent),
                                ),
                                leading: Icon(
                                  _customTileExpanded
                                      ? Icons.arrow_drop_down_circle
                                      : Icons.arrow_drop_down,
                                ),
                                children: <Widget>[
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.all(20),
                                            child: Container(
                                                width: 300,
                                                child: FileUploadWithDrop(
                                                  remoteDirectory: course!.id,
                                                  remoteFileName:
                                                      '${lesson?.id}',
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
                                                  onVideoDurationKnown:
                                                      (duration) {
                                                    lesson?.duration =
                                                        duration.inSeconds;
                                                    print(
                                                        'update duration with $duration');
                                                  },
                                                  onClear: () {
                                                    var editable = (lesson
                                                        as EditableLesson);
                                                    editable.video = '';
                                                    editable.dirty = true;
                                                  },
                                                ))),
                                        Expanded(
                                            child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                              FormBuilderTextField(
                                                name: 'text',
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Title'),
                                                initialValue: lesson.name,
                                                onChanged: (val) {
                                                  var editable = (lesson
                                                      as EditableLesson);
                                                  editable.name = val;
                                                  editable.dirty = true;
                                                },
                                              ),
                                              FormBuilderTextField(
                                                autocorrect: true,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText:
                                                            'Description'),
                                                minLines: 6,
                                                maxLines: 12,
                                                name: 'description',
                                                initialValue:
                                                    lesson.description,
                                                onChanged: (val) {
                                                  lesson.description = val;
                                                  lesson.dirty = true;
                                                },
                                              )
                                            ])),
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
    int sectionOrder = 0;
    int totalDurationInSeconds = 0;

    for (EditableSection section in editableCourse!.Sections ?? List.empty()) {
      if (section.order != sectionOrder) {
        section.dirty = true;
      }
      section.order = sectionOrder;
      int lessonOrder = 0;

      for (EditableLesson lesson in section.Lessons ?? List.empty()) {
        if (lesson.order != lessonOrder) {
          lesson.dirty = true;
        }
        lesson.order = lessonOrder;
        totalDurationInSeconds += (lesson.duration ?? 0);
        if (lesson.dirty) {
          lesson.sectionID = section.id;
          if (lesson.newItem) {
            var lessonSaveRequest =
                ModelMutations.create(EditableLesson.fromEditable(lesson));
            print(lessonSaveRequest.document);
            print(lessonSaveRequest.variables);
            var response =
                await Amplify.API.mutate(request: lessonSaveRequest).response;
            if (!response.hasErrors) {
              lesson.dirty = false;
            }
            print(response.errors);
            print(response.data);
          } else {
            var lessonSaveRequest =
                ModelMutations.update(EditableLesson.fromEditable(lesson));
            print(lessonSaveRequest.document);
            print(lessonSaveRequest.variables);
            var response =
                await Amplify.API.mutate(request: lessonSaveRequest).response;
            if (!response.hasErrors) {
              lesson.dirty = false;
            }
            print(response.errors);
            print(response.data);
          }
        }
        lessonOrder++;
      }
      section.dirty = false;

      setState(() {});

      if (section.newItem) {
        var s = EditableSection.fromEditable(section);
        final sectionSaveRequest = ModelMutations.create(s);

        Amplify.API.mutate(request: sectionSaveRequest);
      } else {
        var s = EditableSection.fromEditable(section);
        final sectionSaveRequest = ModelMutations.update(s);

        Amplify.API.mutate(request: sectionSaveRequest);
      }
      sectionOrder++;
    }

    editableCourse!.totalVideoDuration = totalDurationInSeconds;

    course = EditableCourse.fromEditable(editableCourse ?? EditableCourse());

    final courseSaveRequest = ModelMutations.update(course!);

    Amplify.API.mutate(request: courseSaveRequest);

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
                    courseID
                    order
                    Lessons {
                      items {
                        id
                        name
                        video
                        description
                        sectionID
                        order
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

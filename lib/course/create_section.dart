import 'package:amplify_api/amplify_api.dart';
import 'package:contentpub_admin/aws_s3.dart';
import 'package:contentpub_admin/create_product.dart';
import 'package:contentpub_admin/editablelesson.dart';
import 'package:contentpub_admin/file_upload.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/models/Course.dart';
import 'package:contentpub_admin/models/Lesson.dart';
import 'package:contentpub_admin/models/Section.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';

import 'package:video_player/video_player.dart';

class CourseCreateWidget extends StatefulWidget {
  const CourseCreateWidget({super.key});

  @override
  State<CourseCreateWidget> createState() => CourseCreateWidgetState();
}

class CourseCreateWidgetState extends State<CourseCreateWidget> {
  bool _customTileExpanded = false;

  final ScrollController _firstController = ScrollController();

  String courseId = 'my-course-id-from-amplify';

  List<EditableContent> contentList = [
    EditableContent(contentType: ContentType.VIDEO, name: "dasfsdfsdfsdfsdf")
  ];

  @override
  void initState() {
    EditableContent content = EditableContent(
        contentType: ContentType.VIDEO,
        name: "Lesson 1",
        uploadedFileUrl: 'someurl');
    EditableContent content2 =
        EditableContent(contentType: ContentType.VIDEO, name: "Lesson 2");
    EditableContent content3 =
        EditableContent(contentType: ContentType.VIDEO, name: "Lesson 3");

    contentList.addAll([content, content2, content3]);

    super.initState();
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
                for (var content in contentList)
                  ExpansionTile(
                    initiallyExpanded: false,
                    title: Text(content.name ?? 'Please insert title'),
                    trailing: Icon(
                      _customTileExpanded
                          ? Icons.arrow_drop_down_circle
                          : Icons.arrow_drop_down,
                    ),
                    children: <Widget>[
                      Row(
                        children: [
                          Expanded(
                              child: Center(
                                  child: Text(content.description ??
                                      'Please enter description'))),
                          Expanded(
                              child: FileUploadWithDrop(
                            editableContent: content,
                          ))
                        ],
                      ),
                    ],
                    onExpansionChanged: (bool expanded) {
                      setState(() => _customTileExpanded = expanded);
                    },
                  ),
              ],
            )));
  }
}

Future<void> uploadHtmlFile(EditableLesson l) async {
  String bucketName =
      "https://contentpub-media174002-staging.s3.amazonaws.com/public/";

  print("cozulecek dosya");
  print("name:${l.localVideoUrl}");

  AWSFile file = AWSFile.fromPath(l.localVideoUrl ?? 'wrong video url',
      contentType: "video/mp4");

  print("awsfile:${file.toString()}");
  print("local video size:${l.localVideoSize}");

  final String bucket = "contentpub-media174002-staging";
  final endpoint = 'https://$bucket.s3.amazonaws.com';

  print(endpoint);

  final uploadDest = 'public/${l.localVideoName}';

  AwsS3.uploadFile(
      accessKey: "AKIAVCISBNGUGFQ4LAPR", // cognitoya cevir
      secretKey: "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",
      inputStream: file.stream,
      fileSize: l.localVideoSize ?? 10000,
      filename: "myfile.mp4", //degistri, laf olsun diye koyduk
      bucket: bucket,
      destination: uploadDest,
      region: "us-east-1");
}

Future<void> saveCourse() async {
  Course course = Course(
      // id: '5e226317-ef09-4f4c-b1f8-eb20446dcc32',
      title: 'My Spring Boot course 2');

  final courseSaveRequest = ModelMutations.create(course);

  Amplify.API.mutate(request: courseSaveRequest);

  print('Course id: ${course.id}');

  Section section = Section(courseID: course.id, name: 'Introduction 2');

  final sectionSaveRequest = ModelMutations.create(section);

  Amplify.API.mutate(request: sectionSaveRequest);

  print('Section id: ${section.id}');

  Lesson lesson1 = Lesson(sectionID: section.id, name: 'lesson 1');

  final lessonSaveRequest = ModelMutations.create(lesson1);

  Amplify.API.mutate(request: lessonSaveRequest);

  print('Lesson id: ${lesson1.id}');
}

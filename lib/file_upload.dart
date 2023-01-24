import 'package:contentpub_admin/create_product.dart';
import 'package:contentpub_admin/flutter_flow/flutter_flow_icon_button.dart';
import 'package:contentpub_admin/models/ContentType.dart';
import 'package:contentpub_admin/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:contentpub_admin/aws_s3.dart';
import 'package:contentpub_admin/models/Lesson.dart';
import 'package:contentpub_admin/models/Section.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'package:amplify_flutter/amplify_flutter.dart';

import 'file_upload.dart';

import 'models/Course.dart';

import 'package:video_player/video_player.dart';

import 'dart:html' as html;

import 'dart:convert';

class FileUploadWithDrop extends StatefulWidget {
  final FileType fileType;
  final String? remoteUrl;
  final Function(UploadedFile) onComplete;
  final Function() onClear;

  const FileUploadWithDrop(
      {required this.fileType,
      required this.onComplete,
      required this.onClear,
      this.remoteUrl,
      Key? key})
      : super(key: key);

  @override
  _FileUploadWithDropState createState() => _FileUploadWithDropState(fileType);
}

enum FileType { PICTURE, VIDEO, OTHER }

class UploadedFile {
  String remoteUrl;
  String? accessibleUrl;
  String? localFileName;
  int fileSize;
  // for video only
  int? fileDurationInSeconds;
  FileType fileType;

  UploadedFile(
      {this.accessibleUrl,
      required this.remoteUrl,
      this.localFileName,
      required this.fileSize,
      this.fileDurationInSeconds,
      required this.fileType});
}

class _FileUploadWithDropState extends State<FileUploadWithDrop> {
  late DropzoneViewController controller2;
  String message2 = 'or drop file here';
  bool highlighted1 = false;

  FileType fileType;

  String? localFile;
  String? localVideoName;
  int? localFileSize;
  String? uploadedFileUrl;
  String? uploadedVideoAccessUrl;
  String? uploadMessage;
  bool? dirty;
  bool uploadInProgress = false;

  _FileUploadWithDropState(this.fileType);

  @override
  void initState() {
    if (widget.remoteUrl != null) {
      uploadedFileUrl = widget.remoteUrl;
      uploadInProgress = false;
    }
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Center(
            child: uploadedFileUrl == null
                ? Column(children: [
                    Row(
                      children: [
                        Expanded(child: Text('Drop file below or')),
                        ElevatedButton(
                          onPressed: () async {
                            print(await controller2.pickFiles());
                          },
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 30,
                            buttonSize: 48,
                            icon: Icon(
                              Icons.photo_camera,
                              color: Colors.white,
                              size: 20,
                            ),
                            onPressed: () {
                              print('IconButton pressed ...');
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 150, child: buildZone2(context)),
                  ])
                : Column(
                    children: (uploadInProgress == false &&
                            uploadedFileUrl != null)
                        ? (fileType == FileType.VIDEO)
                            ? [
                                ElevatedButton(
                                    onPressed: () {
                                      widget.onClear();

                                      setState(() {
                                        uploadedFileUrl = null;
                                        localFile = null;
                                        localFileSize = null;
                                      });
                                    },
                                    child: Text('Clear')),
                                SizedBox(
                                    height: 150,
                                    child: VideoPlayerScreen(
                                      videoUrl: uploadedFileUrl ?? '',
                                      autoPlay: false,
                                    ))
                              ]
                            : (fileType == FileType.PICTURE)
                                ? [
                                    ElevatedButton(
                                        onPressed: () {
                                          widget.onClear();
                                          setState(() {
                                            uploadedFileUrl = null;
                                            localFile = null;
                                            localFileSize = null;
                                          });
                                        },
                                        child: Text('Clear')),
                                    Container(
                                        height: 100,
                                        width: 100,
                                        child: Image.network(
                                            uploadedFileUrl ?? ''))
                                  ]
                                : [
                                    ElevatedButton(
                                        onPressed: () {
                                          widget.onClear();
                                          setState(() {
                                            uploadedFileUrl = null;
                                            localFile = null;
                                            localFileSize = null;
                                          });
                                        },
                                        child: Text('Clear')),
                                    ElevatedButton(
                                        onPressed: () => downloadFile(
                                            uploadedFileUrl ?? 'Wrong url'),
                                        child: const Text('Download the file'))
                                  ]
                        : [Text(uploadMessage ?? '')])));
  }

  Widget buildZone2(BuildContext context) => Builder(
        builder: (context) => Container(
            child: DropzoneView(
          operation: DragOperation.move,
          onCreated: (ctrl) => controller2 = ctrl,
          onLoaded: () => print('Zone 2 loaded'),
          onError: (ev) => print('Zone 2 error: $ev'),
          onLeave: () => print('Zone 2 left'),
          onDrop: (ev) {
            onDrop(controller2, ev);
          },
          onDropMultiple: (ev) async {
            print('Zone 2 drop multiple: $ev');
          },
        )),
      );

  void onDrop(DropzoneViewController controller, dynamic ev) async {
    String url = await controller2.createFileUrl(ev);

    localFile = url;
    setState(() {
      message2 = '${ev.name} dropped';
    });

    uploadFile(controller2, ev, url);
  }

  Future<void> uploadFile(
      DropzoneViewController controller, dynamic ev, String url) async {
    print("cozulecek dosya");

    AWSFile file = AWSFile.fromPath(url ?? 'wrong video url');

    print("awsfile:${file.toString()}");
    print("awsfile:${url.toString()}");

    const String bucket = "contentpub-media174002-staging";

    final uploadDest = 'public';

    String remoteFileUrl =
        'https://$bucket.s3.amazonaws.com/$uploadDest/${ev.name}';

    uploadedFileUrl = remoteFileUrl;

    print('ev.name: ${ev.name}');

    int fileSize = await getFileSize(controller, ev);

    print('size: ${fileSize}');

    setState(() {
      uploadInProgress = true;
      localFile = url;
    });

    await AwsS3.uploadFile(
        accessKey: "AKIAVCISBNGUGFQ4LAPR", // cognitoya cevir
        secretKey: "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",
        inputStream: file.stream,
        fileSize: fileSize,
        filename: ev.name, //degistri, laf olsun diye koyduk
        bucket: bucket,
        destination: uploadDest,
        onProgress: (bytes, totalBytes) => printprogress(bytes, totalBytes),
        region: "us-east-1");

    //make s3 resign call to access the video

    UploadedFile uploadedFile = UploadedFile(
        remoteUrl: remoteFileUrl,
        localFileName: localFile,
        fileSize: fileSize,
        fileType: widget.fileType);

    widget.onComplete(uploadedFile);

    setState(() {
      uploadInProgress = false;
      uploadedFileUrl = remoteFileUrl;
    });
  }

  void printprogress(int bytes, int totalBytes) {
    setState(() {
      uploadMessage = 'uploaded ${bytes} of ${totalBytes}';

      if (bytes == totalBytes) {
        uploadInProgress = false;
        // widget.editableLesson.uploadedVideo =
      }
    });
  }
}

Future<int> getFileSize(DropzoneViewController controller, dynamic ev) async {
  int size = await controller.getFileSize(ev);
  print("size: ${size}");
  return size;
}

void downloadFile(String url) {
  html.AnchorElement anchorElement = html.AnchorElement(href: url);
  anchorElement.download = url;
  anchorElement.click();
}

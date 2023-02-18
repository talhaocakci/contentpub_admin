import 'dart:html' as html;

import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:contentpub_admin/aws_s3.dart';
import 'package:contentpub_admin/flutter_flow/flutter_flow_icon_button.dart';
import 'package:contentpub_admin/flutter_flow/flutter_flow_theme.dart';
import 'package:contentpub_admin/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

class FileUploadWithDrop extends StatefulWidget {
  final FileType fileType;
  final String? remoteUrl;
  final String remoteFileName;
  final String remoteDirectory;
  final Function(UploadedFile) onComplete;
  final Function() onClear;
  final bool? isPublic;

  const FileUploadWithDrop(
      {required this.fileType,
      required this.onComplete,
      required this.onClear,
      required this.remoteFileName,
      required this.remoteDirectory,
      this.isPublic,
      this.remoteUrl,
      Key? key})
      : super(key: key);

  @override
  _FileUploadWithDropState createState() =>
      _FileUploadWithDropState(fileType, remoteFileName, remoteDirectory);
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
  String remoteFileName;
  String remoteDirectory;
  bool? dirty;
  bool uploadInProgress = false;

  _FileUploadWithDropState(
      this.fileType, this.remoteFileName, this.remoteDirectory);

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
                ? Expanded(
                    child: Stack(children: [
                    SizedBox(height: 150, child: buildZone2(context)),
                    Container(
                        alignment: Alignment.center,
                        child: const Expanded(child: Text('Drop file here'))),
                    Container(
                        alignment: Alignment.topRight,
                        child: FlutterFlowIconButton(
                          fillColor: Colors.black54,
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          buttonSize: 48,
                          icon: const Icon(
                            Icons.photo_camera,
                            color: Colors.white,
                            size: 20,
                          ),
                          onPressed: () async {
                            print('IconButton pressed ...');
                            var ev = await controller2.pickFiles();
                            onDrop(controller2, (ev as List).elementAt(0));
                          },
                        )),
                  ]))
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
                                    child: const Text('Clear')),
                                SizedBox(
                                    height: 150,
                                    width: double.infinity,
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
                                        child: const Text('Clear')),
                                    Container(
                                        height: 150,
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                alignment: Alignment(-.2, 0),
                                                image: NetworkImage(
                                                    uploadedFileUrl ?? ''),
                                                fit: BoxFit.fill)))
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
                                        child: const Text('Clear')),
                                    ElevatedButton(
                                        onPressed: () => downloadFile(
                                            uploadedFileUrl ?? 'Wrong url'),
                                        child: const Text('Download the file'))
                                  ]
                        : [Text(uploadMessage ?? '')])));
  }

  Widget buildZone2(BuildContext context) => Builder(
        builder: (context) => Container(
            decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).buttonColor.withAlpha(20)),
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

    await uploadFile(controller2, ev, url);
  }

  Future<String> uploadFile(
      DropzoneViewController controller, dynamic ev, String url) async {
    print("cozulecek dosya");

    AWSFile file = AWSFile.fromPath(url ?? 'wrong video url');

    print("awsfile:${file.toString()}");
    print("awsfile:${url.toString()}");

    String bucket = "contentpub-media174002-staging-restricted";

    bucket = (widget.isPublic ?? false)
        ? "contentpub-media174002-staging-public"
        : bucket;

    String uploadDest = remoteDirectory;

    String extension = ev.name.substring(ev.name.lastIndexOf('.'));
    String filename = '${remoteFileName}${extension}';

    String remoteFileUrl =
        'https://$bucket.s3.amazonaws.com/$uploadDest/${filename}';

    uploadedFileUrl = remoteFileUrl;

    print('ev.name: ${filename}');

    int fileSize = await getFileSize(controller, ev);

    print('size: ${fileSize}');

    setState(() {
      uploadInProgress = true;
      localFile = url;
    });

    String? result = await AwsS3.uploadFile(
        //acl: ,
        accessKey: "access key from env", // cognitoya cevir
        secretKey: "secret key from env",
        inputStream: file.stream,
        fileSize: fileSize,
        destination: uploadDest,
        filename: filename, //degistri, laf olsun diye koyduk
        bucket: bucket,
        onProgress: (bytes, totalBytes) =>
            printprogress(bytes, totalBytes, remoteFileUrl),
        region: "us-east-1");

    return result ?? 'Unknown file upload result';
  }

  void printprogress(int bytes, int totalBytes, String remoteFileUrl) {
    setState(() {
      uploadMessage = 'uploaded ${bytes} of ${totalBytes}';
    });

    if (bytes == totalBytes) {
      uploadInProgress = false;
      //make s3 resign call to access the video

      UploadedFile uploadedFile = UploadedFile(
          remoteUrl: remoteFileUrl,
          localFileName: localFile,
          fileSize: totalBytes,
          fileType: widget.fileType);

      print('result of upload: ${uploadedFile.remoteUrl}');

      setState(() {
        uploadInProgress = false;
        uploadedFileUrl = remoteFileUrl;
      });

      widget.onComplete(uploadedFile);
    }
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

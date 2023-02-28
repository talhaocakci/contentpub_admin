import 'dart:html' as html;

import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:async/async.dart';
import 'package:chunked_stream/chunked_stream.dart';
import 'package:contentpub_admin/aws_s3.dart';
import 'package:contentpub_admin/flutter_flow/flutter_flow_icon_button.dart';
import 'package:contentpub_admin/flutter_flow/flutter_flow_theme.dart';
import 'package:contentpub_admin/models/api/presign_response.dart';
import 'package:contentpub_admin/state_container.dart';
import 'package:contentpub_admin/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:xml/xml.dart';

var regex = RegExp(r'https:\/\/(.?[^\.]*)\.(s3.amazonaws.com)\/(.*)');

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

  String? projectName;

  _FileUploadWithDropState(
      this.fileType, this.remoteFileName, this.remoteDirectory);

  @override
  void initState() {
    if (widget.remoteUrl != null) {
      uploadedFileUrl = widget.remoteUrl;
      uploadInProgress = false;

      if (!(widget.isPublic ?? false)) {
        convertToAccessibleUrl();
      }
    }

    setState(() {});
    super.initState();
  }

  Future<String> convertToAccessibleUrl() async {
    Iterable<RegExpMatch> matches = regex.allMatches(uploadedFileUrl ?? '');
    String bucket = '';
    String key = '';

    for (final m in matches) {
      bucket = m[1] ?? '';
      key = m[3] ?? '';
    }

    uploadedFileUrl = await retrievePresignedUrlForRead(bucket, key);

    setState(() {
      uploadedFileUrl = uploadedFileUrl;
    });

    return uploadedFileUrl ?? 'wrong presign url';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 200,
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Center(
            child: uploadedFileUrl == null
                ? Stack(children: [
                    SizedBox(height: 150, child: buildZone2(context)),
                    Container(
                        alignment: Alignment.center,
                        child: Text('Drop file here')),
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

    AWSFile file = AWSFile.fromPath(url);

    print("awsfile:${file.toString()}");
    print("awsfile:${url.toString()}");

    String projectName = StateContainer.of(context).projectName ?? 'contentpub';
    String environment = StateContainer.of(context).environment ?? 'staging';
    String visibility = (widget.isPublic ?? false) ? 'public' : 'restricted';

    String bucket = "$projectName-$environment-$visibility";

    String extension = ev.name.substring(ev.name.lastIndexOf('.'));
    String filename = '${remoteFileName}${extension}';

    String uploadDest = remoteDirectory;

    String remoteFileUrl =
        'https://$bucket.s3.amazonaws.com/$uploadDest/${filename}';

    uploadedFileUrl = remoteFileUrl;

    print('ev.name: ${filename}');

    int fileSize = await getFileSize(controller, ev);

    print('size: ${fileSize}');

    setState(() {
      uploadInProgress = true;
      localFile = url;
      uploadMessage = 'Initating secure URL to AWS';
    });

    int index = 0;

    int chunkSize = 25 * 1024 * 1024;

    int splitCount = (fileSize / chunkSize).ceil();

    var r = await retrievePresignedUrl(
        bucket, '$uploadDest/$filename', splitCount, "");

    PresignUploadResponse presign = PresignUploadResponse();
    presign.initUrl = jsonDecode(r)['initUrl'];
    presign.partUrls = jsonDecode(r)['partUrls'];
    presign.abortUrl = jsonDecode(r)['abortUrl'];
    presign.singleUrl = jsonDecode(r)['singleUrl'];

    print('split count $splitCount');

    if (splitCount.compareTo(1) == 0) {
      setState(() {
        uploadMessage = 'Uploading...';
      });

      final chunkStreamReader = ChunkedStreamReader(file.stream);

      var res = await http.put(Uri.parse(presign.singleUrl!),
          body: await chunkStreamReader.readBytes(fileSize));
      print('single upload');
      print(res.statusCode);
      print(res.headers);

      completeUpload(visibility, bucket, uploadDest, filename, fileSize);

      return remoteFileUrl;
    }

    var initiateResponse =
        await http.post(Uri.parse(presign.initUrl ?? 'wrong url'), body: {});

    final document = XmlDocument.parse(initiateResponse.body);
    String? uploadId = document
        .getElement('InitiateMultipartUploadResult')!
        .getElement('UploadId')!
        .text;

    print('upload id: $uploadId');

    r = await retrievePresignedUrl(bucket, '$uploadDest/$filename', splitCount,
        uploadId ?? 'wrong upload id');

    presign = PresignUploadResponse();
    presign.initUrl = jsonDecode(r)['initUrl'];
    presign.partUrls = jsonDecode(r)['partUrls'];
    presign.abortUrl = jsonDecode(r)['abortUrl'];
    presign.completeUrl = jsonDecode(r)['completeUrl'];

    int i = 0;
    String parts = '';

    var stream = file.stream;

    print(presign.completeUrl);
    String? remoteUrl =
        presign.completeUrl?.substring(0, presign.completeUrl?.indexOf("?"));
    print(remoteUrl);

    Uint8List substream;

    final chunkStreamReader = ChunkedStreamReader(stream);

    while (index < fileSize) {
      var substreamSize = chunkSize;

      if (fileSize - index < substreamSize) {
        substreamSize = fileSize - index;
      }

      setState(() {
        uploadMessage = 'Uploading chunk ${i + 1} of $splitCount';
      });

      substream = await chunkStreamReader.readBytes(substreamSize);

      print('part ${i + 1}');

      print('substream length ${substream.length}');

      var res = await http.put(Uri.parse(presign.partUrls!.elementAt(i)),
          body: substream);

      print(res.statusCode);
      print(res.headers);

      String s = '''<Part>
     
      <ETag>${res.headers["etag"]}</ETag>
      <PartNumber>${i + 1}</PartNumber>
   </Part>
    ''';

      print(s);

      index += substreamSize;
      i++;

      parts = parts + s;
    }

    String completeRequest = '''<?xml version="1.0" encoding="UTF-8"?>
<CompleteMultipartUpload xmlns="http://s3.amazonaws.com/doc/2006-03-01/">
   $parts
</CompleteMultipartUpload>''';

    var completeResponse = await http.post(
        Uri.parse(presign.completeUrl ?? 'wrong url'),
        body: completeRequest);

    completeUpload(visibility, bucket, uploadDest, filename, fileSize);

    return remoteUrl ?? 'wrong url';
  }

  Future<AuthSession> getCurrentSession() async {
    final session = await Amplify.Auth.fetchAuthSession(
        options: CognitoSessionOptions(getAWSCredentials: false));
    return session;
  }

  Future<String> retrievePresignedUrl(
      String bucket, String key, int splitCount, String uploadId) async {
    AuthSession session = await getCurrentSession();

    var tokens = (session as CognitoAuthSession).userPoolTokens;
    var idToken = tokens?.idToken;

    String rawIdToken = idToken!.raw;

    String apiRoot = StateContainer.of(context).apiRootUrl ?? '';

    final initUri = Uri.parse(
        "$apiRoot/presignupload?bucket=$bucket&key=$key&splitCount=$splitCount&uploadId=$uploadId");

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': rawIdToken
    };

    http.Response initResponse = await http.get(initUri, headers: headers);

    //print(initResponse.body);

    return initResponse.body;
  }

  Future<String> retrievePresignedUrlForRead(String bucket, String key) async {
    AuthSession session = await getCurrentSession();

    var tokens = (session as CognitoAuthSession).userPoolTokens;
    var idToken = tokens?.idToken;

    String rawIdToken = idToken!.raw;

    String apiRoot = StateContainer.of(context).apiRootUrl ?? '';

    final initUri = Uri.parse("$apiRoot/presign?bucket=$bucket&key=$key");

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': rawIdToken
    };

    http.Response response = await http.get(initUri, headers: headers);

    if (response.statusCode == 200) {
      return jsonDecode(response.body)['url'];
    }

    return 'https://$bucket.s3.amazonaws.com/$key';
  }

  void completeUpload(String visibility, String bucket, String uploadDest,
      String fileName, int fileSize) async {
    uploadInProgress = false;

    String remoteFileUrl =
        'https://$bucket.s3.amazonaws.com/$uploadDest/$fileName';

    if (visibility == 'restricted') {
      remoteFileUrl =
          await retrievePresignedUrlForRead(bucket, '$uploadDest/$fileName');

      print('get url $remoteFileUrl');
    }

    UploadedFile uploadedFile = UploadedFile(
        remoteUrl: remoteFileUrl,
        localFileName: localFile,
        fileSize: fileSize,
        fileType: widget.fileType);

    print('result of upload: ${uploadedFile.remoteUrl}');

    setState(() {
      uploadInProgress = false;
      uploadedFileUrl = remoteFileUrl;
    });

    widget.onComplete(uploadedFile);
  }

  void printprogress(int bytes, int totalBytes, String remoteFileUrl) {
    setState(() {
      uploadMessage = 'uploaded ${bytes} of ${totalBytes}';
    });

    if (bytes == totalBytes) {
      // complete
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

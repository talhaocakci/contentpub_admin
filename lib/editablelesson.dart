import 'dart:typed_data';

class EditableLesson {
  String? id;
  String? name;
  String? description;
  String? localVideoUrl;
  String? localVideoName;
  int? localVideoSize;
  String? uploadedVideo;
  String? uploadedVideoAccessUrl;
  String? localAttachmentUrl;
  String? uploadedAttachmentUrl;
  String? videoUploadMessage;
  bool? dirty;
  bool videoUploadInProgress = false;
  bool? attachmentUploadInProgress;

  EditableLesson(
      {this.name,
      this.description,
      this.id,
      this.localVideoUrl,
      this.localVideoName,
      this.localVideoSize,
      this.uploadedVideo,
      this.uploadedVideoAccessUrl,
      this.localAttachmentUrl,
      this.uploadedAttachmentUrl,
      this.dirty,
      this.attachmentUploadInProgress});
}

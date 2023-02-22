import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:http/http.dart' as http;

import 'acl.dart';
import 'multipart_request.dart';
import 'policy.dart';
import 'utils.dart';

/// Convenience class for uploading files to AWS S3
class AwsS3 {
  /// Upload a file, returning the file's public URL on success.
  static Future<String?> uploadFile({
    /// AWS access key
    required String presignedUrl,

    /// The file to upload
    required Stream<List<int>> inputStream,
    required int fileSize,

    /// The filename to upload as. If null, defaults to the given file's current filename.
    String? filename,

    /// this method will show file upload progress and file total size
    final void Function(int bytes, int totalBytes)? onProgress,
  }) async {
    final stream = http.ByteStream(Stream.castFrom(inputStream));
    final length = fileSize;

    final uri = Uri.parse(presignedUrl);
    final req = MultipartRequest("POST", uri, onProgress: onProgress);
    final multipartFile =
        http.MultipartFile('file', stream, length, filename: filename);

    req.files.add(multipartFile);

    print(req.toString());

    try {
      final res = await req.send();

      print(res.statusCode);

      if (res.statusCode == 204) return presignedUrl;
    } catch (e) {
      print('Failed to upload to AWS, with exception:');
      print(e);
      return null;
    }
  }
}

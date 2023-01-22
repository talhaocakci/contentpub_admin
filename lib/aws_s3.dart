import 'dart:io';
import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'utils.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

import 'policy.dart';
import 'acl.dart';
import 'multipart_request.dart';

/// Convenience class for uploading files to AWS S3
class AwsS3 {
  /// Upload a file, returning the file's public URL on success.
  static Future<String?> uploadFile({
    /// AWS access key
    required String accessKey,

    /// AWS secret key
    required String secretKey,

    /// The name of the S3 storage bucket to upload  to
    required String bucket,

    /// The file to upload
    required Stream<List<int>> inputStream,
    required int fileSize,

    /// The path to upload the file to (e.g. "uploads/public"). Defaults to the root "directory"
    String destination = '',

    /// The AWS region. Must be formatted correctly, e.g. us-west-1
    String region = 'us-east-2',

    ///Access control list enables you to manage access to bucket and objects
    ///For more information visit [https://docs.aws.amazon.com/AmazonS3/latest/userguide/acl-overview.html]
    ACL acl = ACL.public_read,

    /// The filename to upload as. If null, defaults to the given file's current filename.
    String? filename,

    /// this method will show file upload progress and file total size
    final void Function(int bytes, int totalBytes)? onProgress,
  }) async {
    final stream = http.ByteStream(Stream.castFrom(inputStream));
    final length = fileSize;

    final endpoint = 'https://$bucket.s3.amazonaws.com';

    print(endpoint);

    final uploadDest = '$destination/${filename}';

    final uri = Uri.parse(endpoint);
    final req = MultipartRequest("POST", uri, onProgress: onProgress);
    final multipartFile =
        http.MultipartFile('file', stream, length, filename: filename);

    final policy = Policy.fromS3PresignedPost(
        uploadDest, bucket, accessKey, 15, length, acl,
        region: region);
    final key =
        SigV4.calculateSigningKey(secretKey, policy.datetime, region, 's3');
    final signature = SigV4.calculateSignature(key, policy.encode());

    req.files.add(multipartFile);
    req.fields['key'] = policy.key;
    req.fields['acl'] = aclToString(acl);
    req.fields['X-Amz-Credential'] = policy.credential;
    req.fields['X-Amz-Algorithm'] = 'AWS4-HMAC-SHA256';
    req.fields['X-Amz-Date'] = policy.datetime;
    req.fields['Policy'] = policy.encode();
    req.fields['X-Amz-Signature'] = signature;

    print(req.toString());

    try {
      final res = await req.send();

      print(res.statusCode);

      if (res.statusCode == 204) return destination;
    } catch (e) {
      print('Failed to upload to AWS, with exception:');
      print(e);
      return null;
    }
  }
}

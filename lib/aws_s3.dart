import 'package:amazon_cognito_identity_dart_2/sig_v4.dart';
import 'package:amplify_api/amplify_api.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import 'acl.dart';
import 'multipart_request.dart';
import 'package:http_parser/http_parser.dart';

/// Convenience class for uploading files to AWS S3
class AwsS3 {
  /// Upload a file, returning the file's public URL on success.
  static Future<String?> uploadFile({
    /// AWS access key
    required String presignedUrl,

    /// The file to upload
    required Stream<List<int>> inputStream,
    required int partNumber,

    /// The filename to upload as. If null, defaults to the given file's current filename.
    String? filename,

    /// this method will show file upload progress and file total size
    final void Function(int bytes, int totalBytes)? onProgress,
  }) async {
    var stream = http.ByteStream(Stream.castFrom(inputStream));

    final uri = Uri.parse(presignedUrl);

    try {
      var res = await http.put(uri, body: await stream.toBytes());

      print(res.statusCode);
      print(res.headers);

      String s = '''<Part>
     
      <ETag>${res.headers["etag"]}</ETag>
      <PartNumber>$partNumber</PartNumber>
   </Part>
    ''';

      print(s);

      if (res.statusCode == 200) return s;
    } catch (e) {
      print('Failed to upload to AWS, with exception:');
      print(e);
      return '';
    }
  }
}

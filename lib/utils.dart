import 'package:uuid/uuid.dart';

class Utils {
  static String generateId() {
    return Uuid().v4().substring(0, 8) + Uuid().v1().substring(0, 3);
  }
}

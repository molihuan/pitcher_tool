import 'dart:io';
import 'package:path/path.dart' as path;

class FileUtils {
  static String getCurrentExecutablePath() {
    return path.dirname(Platform.resolvedExecutable);
  }
}

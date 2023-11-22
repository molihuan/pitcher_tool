import 'dart:io';
import 'package:path/path.dart' as path;

class FileUtils {
  static String getCurrentExecutablePath() {
    return path.dirname(Platform.resolvedExecutable);
  }

  static bool exists({String? filePath, File? file}) {
    file = file ?? File(filePath!);
    return file.existsSync();
  }

  static void openDir(String path) {
    if (Platform.isWindows) {
      Process.run('explorer.exe', ['/select,', '$path']);
    } else if (Platform.isLinux) {
      Process.run('xdg-open', ['$path']);
    } else if (Platform.isMacOS) {
      Process.run('open', ['$path']);
    } else {
      throw Exception('Unsupported platform');
    }
  }
}

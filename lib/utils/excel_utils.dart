import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart';

class ExcelUtils {
  static Excel loadFile({String? path, File? file}) {
    file = file ?? File(path!);
    var bytes = file.readAsBytesSync();
    Excel excel = Excel.decodeBytes(bytes);
    return excel;
  }

  static Future<Excel> loadAssets(String path) async {
    ByteData data = await rootBundle.load(path);
    var bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
    var excel = Excel.decodeBytes(bytes);
    return excel;
  }
}

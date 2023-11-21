import 'dart:io';

import 'package:excel/excel.dart';

class ExcelUtils {
  static Excel load(String path) {
    var bytes = File(path).readAsBytesSync();
    Excel excel = Excel.decodeBytes(bytes);
    return excel;
  }
}

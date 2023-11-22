import 'dart:collection';
import 'dart:ffi';
import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter/services.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pitcher_tool/models/facebook_msg.dart';
import 'package:pitcher_tool/utils/excel_utils.dart';
import 'package:pitcher_tool/utils/file_utils.dart';
import 'package:pitcher_tool/utils/str_utils.dart';
import 'package:velocity_x/velocity_x.dart';

import 'index.dart';

class QuickFacebookController extends GetxController {
  QuickFacebookController();

  final state = QuickFacebookState();

  Future<void> createFacebookExcel(String inputText) async {
    if (inputText.isEmpty) {
      SmartDialog.showToast("信息为空");
      return;
    }

    FacebookMsg facebookMsg = StrUtils.getFacebookMsg(inputText);
    print(facebookMsg);

    var fileSave = File(FileUtils.getCurrentExecutablePath() + "/批量导入二解.xlsx");
    Excel excel;
    if (FileUtils.exists(file: fileSave)) {
      excel = ExcelUtils.loadFile(file: fileSave);
    } else {
      excel = await ExcelUtils.loadAssets(
          "assets/FacebookAccountImportTemplate.xlsx");
    }

    Sheet sheetObject = excel["Sheet1"];
    int i = 1;
    for (;; i++) {
      if (insertFacebookMsg(sheetObject, facebookMsg, i)) {
        break;
      }
    }

    fileSave.writeAsBytesSync(excel.encode()!);
    // excel.save(fileName: fileSave.path);
    state.facebookNamesMap[i.toString()] = facebookMsg.userName;
    update();
    SmartDialog.showToast("成功,文件保存在:${fileSave.path}");
  }

  bool insertFacebookMsg(
      Sheet sheetObject, FacebookMsg facebookMsg, int rowIndex) {
    ///备注
    Data cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: rowIndex));

    if (cell.value != null) {
      return false;
    }

    cell.value =
        "${facebookMsg.checkCode}\n${facebookMsg.email}\n${facebookMsg.emailPwd}\n${facebookMsg.idCardImgUrl}";

    ///facebook账号配置
    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: rowIndex));
    cell.value = "facebook.com";

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: rowIndex));
    cell.value = facebookMsg.userName;

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: rowIndex));
    cell.value = facebookMsg.userPwd;

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: rowIndex));
    cell.value = facebookMsg.checkCode;

    ///代理配置
    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: rowIndex));
    cell.value = "noproxy";
    return true;
  }

  Future<void> clearFacebookExcel() async {
    // 读取assets中的文件内容
    ByteData data =
        await rootBundle.load("assets/FacebookAccountImportTemplate.xlsx");
    List<int> bytes = data.buffer.asUint8List();
    File file = File(FileUtils.getCurrentExecutablePath() + "/批量导入二解.xlsx");
    await file.create(recursive: true);
    await file.writeAsBytes(bytes);

    state.facebookNamesMap.clear();
    update();

    SmartDialog.showToast("清理成功");
  }

  Future<Map<String, String>> getFacebookMsgs() async {
    var fileSave = File(FileUtils.getCurrentExecutablePath() + "/批量导入二解.xlsx");
    Excel excel;
    if (FileUtils.exists(file: fileSave)) {
      excel = ExcelUtils.loadFile(file: fileSave);
    } else {
      excel = await ExcelUtils.loadAssets(
          "assets/FacebookAccountImportTemplate.xlsx");
    }

    Sheet sheetObject = excel["Sheet1"];
    Map<String, String> facebookNamesMap = HashMap();
    for (int i = 1;; i++) {
      Data cell = sheetObject
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i));

      if (cell.value == null) {
        break;
      }

      facebookNamesMap[i.toString()] = cell.value.toString();
    }

    state.facebookNamesMap = facebookNamesMap;

    return facebookNamesMap;
  }

  Future<bool> delFacebookMsg(int rowIndex) async {
    var fileSave = File(FileUtils.getCurrentExecutablePath() + "/批量导入二解.xlsx");
    Excel excel;
    if (FileUtils.exists(file: fileSave)) {
      excel = ExcelUtils.loadFile(file: fileSave);
    } else {
      excel = await ExcelUtils.loadAssets(
          "assets/FacebookAccountImportTemplate.xlsx");
    }

    Sheet sheetObject = excel["Sheet1"];

    Data cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: rowIndex));

    if (cell.value == null) {
      return true;
    }
    sheetObject.removeRow(rowIndex);

    fileSave.writeAsBytesSync(excel.encode()!);
    // excel.save(fileName: fileSave.path);
    state.facebookNamesMap.remove(rowIndex.toString());
    update();
    SmartDialog.showToast("移除成功");

    return true;
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
    getFacebookMsgs();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}

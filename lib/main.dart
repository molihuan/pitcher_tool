import 'dart:io';
import 'dart:math';

import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:test_appcenter/utils/excel_utils.dart';
import 'package:test_appcenter/utils/file_utils.dart';
import 'package:test_appcenter/utils/str_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final String title = "投手工具";
  final TextEditingController facebookAccountMsgInput = TextEditingController();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: widget.facebookAccountMsgInput,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.withOpacity(0.1),
              hintText: '二解账号信息',
              contentPadding: EdgeInsets.all(20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                var facebookMsg = StrUtils.getFacebookMsg(
                    widget.facebookAccountMsgInput.text);
                print(facebookMsg);
                var excel = ExcelUtils.load(
                    FileUtils.getCurrentExecutablePath() + "/批量导入模板.xlsx");
                Sheet sheetObject = excel["Sheet1"];
                Data cell = sheetObject.cell(
                    CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: 1));
                cell.value =
                    "${facebookMsg.checkCode}\n${facebookMsg.email}\n${facebookMsg.emailPwd}\n${facebookMsg.idCardImgUrl}";

                cell = sheetObject.cell(
                    CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: 1));
                cell.value = "facebook.com";

                cell = sheetObject.cell(
                    CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: 1));
                cell.value = facebookMsg.userName;

                cell = sheetObject.cell(
                    CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: 1));
                cell.value = facebookMsg.userPwd;

                cell = sheetObject.cell(
                    CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: 1));
                cell.value = facebookMsg.checkCode;

                cell = sheetObject.cell(
                    CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: 1));
                cell.value = "noproxy";

                var fileSave =
                    File(FileUtils.getCurrentExecutablePath() + "/生成.xlsx");
                fileSave.writeAsBytesSync(excel.encode()!);
              },
              child: Text("生成"))
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pitcher_tool/utils/file_utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../index.dart';

/// hello
class QuickFacebook extends GetView<QuickFacebookController> {
  QuickFacebook({Key? key}) : super(key: key);

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: VStack([
        Text(
          "请粘贴完整的二解信息",
          style: TextStyle(fontSize: 19),
        ).text.make().center(),
        VxTextField(
          controller: textController,
          maxLine: 5,
          hint: "请粘贴在这里",
        ).py12().p16(),
        HStack(
          [
            ElevatedButton(
                onPressed: () {
                  controller.createFacebookExcel(textController.text);
                },
                child: "生成批量文件".text.center.make().p8().w16(context)),
            ElevatedButton(
                onPressed: () {
                  controller.clearFacebookExcel();
                },
                child: "清空批量文件".text.center.make().p8().w16(context)),
            ElevatedButton(
                onPressed: () {
                  var path = FileUtils.getCurrentExecutablePath();
                  log(path);
                  FileUtils.openDir(path);
                },
                child: "打开批量文件位置".text.center.make().p8().w16(context)),
          ],
        ).center(),
        Text(
          "生成批量文件简单预览",
          style: TextStyle(fontSize: 19),
        ).text.make().center().p16(),
        Obx(() {
          return Container(
            child: <TableRow>[
              TableRow(
                children: [
                  "账号".text.make().p12(),
                  "操作".text.make().p12(),
                ],
              ),
              for (var entry in controller.state.facebookNamesMap.entries)
                TableRow(
                  children: [
                    Text(entry.value).text.make().p12(),
                    ElevatedButton(
                        onPressed: () {
                          log("删除了${entry.key}");
                          String index = entry.key as String;
                          controller
                              .delFacebookMsg(index.toInt(defaultValue: 1));
                        },
                        child: "删除".text.make()),
                  ],
                )
            ].table.gray300.middleAligned.roundedBorder.make(),
          );
        })
      ]).scrollVertical(),
    );
  }
}

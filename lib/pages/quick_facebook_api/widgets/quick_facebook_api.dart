import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:pitcher_tool/models/facebook_msg.dart';
import 'package:pitcher_tool/utils/str_utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../index.dart';

/// hello
class QuickFacebookApi extends GetView<QuickFacebookApiController> {
  QuickFacebookApi({Key? key}) : super(key: key);
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
        ElevatedButton(
                onPressed: () async {
                  String? id =
                      await controller.createFacebookUser(textController.text);
                  if (id != null) {
                    SmartDialog.showToast("创建成功");
                    textController.text = "";
                    controller.openBrowser(id.toInt());
                  } else {
                    SmartDialog.showToast("创建失败,请检查二解信息,或联系开发者");
                  }
                },
                child: "创建".text.make().px64().py8())
            .centered(),
      ]).scrollVertical(),
    );
  }
}

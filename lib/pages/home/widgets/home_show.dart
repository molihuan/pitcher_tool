import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';
import 'package:pitcher_tool/http/api.dart';
import 'package:pitcher_tool/http/http.dart';
import 'package:pitcher_tool/http/mock.dart';
import 'package:pitcher_tool/routes/app_pages.dart';
import 'package:pitcher_tool/utils/platform_utils.dart';
import 'package:velocity_x/velocity_x.dart';

import '../controller.dart';

class HomeShow extends GetView<HomeController> {
  const HomeShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("超级投手工具"),
        ),
        body: Container(
          child: HStack(
            [
              ElevatedButton(onPressed: () async {}, child: "测试按钮".text.make())
                  .px12(),
              ElevatedButton(
                      onPressed: () {
                        PlatformUtils.voidCallback(
                            web: () {
                              SmartDialog.showToast("不支持");
                            },
                            android: () {},
                            ios: () {},
                            other: () {
                              Get.toNamed(AppRoutes.QuickFacebook);
                            });
                      },
                      child: "Excel速拿二解号".text.make())
                  .px12(),
              ElevatedButton(
                      onPressed: () {
                        Get.toNamed(AppRoutes.QuickFacebookApi);
                      },
                      child: "Api速拿二解号".text.make())
                  .px12(),
            ],
          ).scrollVertical().p20(),
        ));
  }
}

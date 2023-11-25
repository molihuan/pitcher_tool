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
import 'package:pitcher_tool/utils/web_utils.dart';
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
        body: Wrap(
          children: [
            Container(
              child: <TableRow>[
                TableRow(
                  children: [
                    "账号".text.make().p12(),
                    "操作".text.make().p12(),
                  ],
                ),
                for (var entry in [1, 2, 3])
                  TableRow(
                    children: [
                      Text("111").text.make().p12(),
                      ElevatedButton(
                          onPressed: () {
                            tos();
                          },
                          child: "选择".text.make()),
                    ],
                  )
              ].table.gray300.middleAligned.roundedBorder.make(),
            ).p4(),
            ElevatedButton(
                    onPressed: () async {
                      SmartDialog.showToast("你干嘛~~哎呦~~");
                    },
                    child: "测试按钮".text.make())
                .p8()
                .centered(),
            Column(
              children: [
                "自动化".text.make().scale150().p12(),
                Wrap(
                  children: [ElevatedButton(
                    onPressed: () {
                      Get.toNamed(AppRoutes.QuickFacebookApi);
                    },
                    child: "速拿二解号".text.make())
                .p8(),
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
                    child: "通过Excel速拿二解号".text.make())
                .p8(),
            ElevatedButton(
                    onPressed: () {
                      tos();
                    },
                    child: "自动登录邮箱".text.make())
                .p8(),
            ElevatedButton(
                    onPressed: () {
                      tos();
                    },
                    child: "自动输入二次验证码".text.make())
                .p8(),
            ElevatedButton(
                    onPressed: () {
                      tos();
                    },
                    child: "自动授权主页并登记授权主页".text.make())
                .p8(),
            ElevatedButton(
                    onPressed: () {
                      tos();
                    },
                    child: "下户自动更换主页”茶“背景头像".text.make())
                .p8(),
            ElevatedButton(
                    onPressed: () {
                      tos();
                    },
                    child: "自动填写开户资料".text.make())
                .p8(),
            ElevatedButton(
                    onPressed: () {
                      tos();
                    },
                    child: "微信自动发消息@某人".text.make())
                .p8(),],
                )
              ],
            ).centered(),
            Column(
              children: [
                "快捷网址".text.make().scale150().p12(),
                Wrap(
                  children: [
                    ElevatedButton(
                            onPressed: () {
                              tos();
                            },
                            child: "打开邮箱页".text.make())
                        .p8(),
                    ElevatedButton(
                            onPressed: () {
                              WebUtils.openUrl('https://www.kdocs.cn/l/cdFQ2NM4wCcU');
                            },
                            child: "打开内部主页".text.make())
                        .p8(),
                    ElevatedButton(
                            onPressed: () {
                              WebUtils.openUrl('https://www.kdocs.cn/l/cqsJ6IjNVZSg');
                            },
                            child: "打开伽佰主页".text.make())
                        .p8(),
                    ElevatedButton(
                            onPressed: () {
                              WebUtils.openUrl('https://www.kdocs.cn/l/ce0M7wZemcgi');
                            },
                            child: "打开腾达主页".text.make())
                        .p8(),
                    ElevatedButton(
                            onPressed: () {
                               WebUtils.openUrl('https://www.facebook.com/ads/library/');
                            },
                            child: "打开资料库".text.make())
                        .p8(),
                    ElevatedButton(
                            onPressed: () {
                              tos();
                            },
                            child: "打开BM".text.make())
                        .p8(),
                    ElevatedButton(
                            onPressed: () {
                              tos();
                            },
                            child: "打开发广告页面".text.make())
                        .p8(),
                    ElevatedButton(
                            onPressed: () {
                              tos();
                            },
                            child: "打开业务支持中心".text.make())
                        .p8(),
                    ElevatedButton(
                            onPressed: () {
                              WebUtils.openUrl('https://translate.google.com/');
                            },
                            child: "打开翻译".text.make())
                        .p8(),
                  ],
                ),
              ],
            ).centered(),
            Column(
              children: [
                "快捷文件".text.make().scale150().p12(),
                Wrap(
                  children: [


                  ],
                )
              ],
            ).centered(),
            
          ],
        ));
  }

  void tos() {
    SmartDialog.showToast("正在开发中...");
  }
}

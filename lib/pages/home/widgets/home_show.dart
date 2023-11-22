import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:pitcher_tool/routes/app_pages.dart';
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
          child: VStack(
            [
              ElevatedButton(
                  onPressed: () {
                    Get.toNamed(AppRoutes.QuickFacebook);
                  },
                  child: "速拿二解号".text.make())
            ],
          ).scrollVertical().p20(),
        ));
  }
}

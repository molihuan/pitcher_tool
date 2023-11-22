import 'package:get/get.dart';

import 'controller.dart';

class QuickFacebookBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuickFacebookController>(() => QuickFacebookController());
  }
}

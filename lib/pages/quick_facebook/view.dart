import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class QuickFacebookPage extends GetView<QuickFacebookController> {
  const QuickFacebookPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return QuickFacebook();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuickFacebookController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("quick_facebook")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pitcher_tool/pages/quick_facebook_api/widgets/quick_facebook_api.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class QuickFacebookApiPage extends GetView<QuickFacebookApiController> {
  const QuickFacebookApiPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return QuickFacebookApi();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuickFacebookApiController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("quick_facebook_api")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}

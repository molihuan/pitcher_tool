import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:nb_utils/nb_utils.dart';
import 'package:pitcher_tool/http/mock.dart';
import 'package:pitcher_tool/routes/app_pages.dart';

Future<void> main() async {
  /// 插件初始化
  WidgetsFlutterBinding.ensureInitialized();

  ///init nb_utils
  await initialize();
  HttpMock.init(need: false);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),

      debugShowCheckedModeBanner: false,
      // 初始路由
      initialRoute: AppPages.INITIAL,
      // 所有的页面
      getPages: AppPages.routes,

      ///flutter_smart_dialog初始化
      navigatorObservers: [FlutterSmartDialog.observer],
      builder: FlutterSmartDialog.init(),

      navigatorKey: navigatorKey,
    );
  }
}

// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:pitcher_tool/pages/home/bindings.dart';
import 'package:pitcher_tool/pages/home/view.dart';
import 'package:pitcher_tool/pages/quick_facebook/index.dart';
import 'package:pitcher_tool/pages/quick_facebook_api/index.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final routes = [
    GetPage(
      name: AppRoutes.Home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.QuickFacebook,
      page: () => const QuickFacebookPage(),
      binding: QuickFacebookBinding(),
    ),
    GetPage(
      name: AppRoutes.QuickFacebookApi,
      page: () => const QuickFacebookApiPage(),
      binding: QuickFacebookApiBinding(),
    ),
  ];
}

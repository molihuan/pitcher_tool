import 'dart:collection';

import 'package:get/get.dart';

class QuickFacebookState {
  final _facebookNamesMap = HashMap().obs;

  set facebookNamesMap(value) => _facebookNamesMap.value = value;

  Map get facebookNamesMap => _facebookNamesMap.value;
}

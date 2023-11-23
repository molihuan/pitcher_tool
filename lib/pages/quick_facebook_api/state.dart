import 'dart:collection';

import 'package:get/get.dart';

class QuickFacebookApiState {
  // title

  final _facebookAccountGroup = <Map>[].obs;

  set facebookAccountGroup(value) => _facebookAccountGroup.value = value;

  get facebookAccountGroup => _facebookAccountGroup;
}

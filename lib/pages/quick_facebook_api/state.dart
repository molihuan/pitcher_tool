import 'dart:collection';

import 'package:get/get.dart';

class QuickFacebookApiState {
  // title

  final _facebookAccountGroup = [].obs;

  set facebookAccountGroup(value) => _facebookAccountGroup.value = value;

  List get facebookAccountGroup => _facebookAccountGroup;

  ///选择的分组id
  final _selectedGroupId = "测试分组id".obs;

  set selectedGroupId(value) => _selectedGroupId.value = value;

  get selectedGroupId => _selectedGroupId.value;
}

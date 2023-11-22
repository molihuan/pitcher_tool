import 'package:get/get.dart';

class HomeState {
  //创建视频笔记类型
  final _videoType = Object().obs;

  set videoType(value) => _videoType.value = value;

  get videoType => _videoType.value;
}

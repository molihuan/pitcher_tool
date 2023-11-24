import 'package:nb_utils/nb_utils.dart';

class DataManager {
  set groupId(String value) {
    setValue("GroupId", value);
  }

  String get groupId {
    return getStringAsync("GroupId");
  }
}

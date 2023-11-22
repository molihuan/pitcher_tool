import 'dart:io';

import 'package:excel/excel.dart';
import 'package:pitcher_tool/models/facebook_msg.dart';

class StrUtils {
  static FacebookMsg getFacebookMsg(String msg) {
    List<String> msgList = msg.split('|');
    String idCardImgUrl;
    if (msgList[msgList.length - 1].isEmpty) {
      idCardImgUrl = msgList[msgList.length - 2];
    } else {
      idCardImgUrl = msgList[msgList.length - 1];
    }

    FacebookMsg facebookMsg = FacebookMsg(
        userName: msgList[0],
        userPwd: msgList[1],
        checkCode: msgList[2],
        email: msgList[3],
        emailPwd: msgList[4],
        idCardImgUrl: idCardImgUrl);

    return facebookMsg;
  }
}

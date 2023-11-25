import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class WebUtils {
  static Future<void> openUrl(String url) async {
    final Uri targetUrl = Uri.parse(url);
    if (!await launchUrl(targetUrl)) {
      SmartDialog.showToast('不能打开： $url');
    }
  }
}

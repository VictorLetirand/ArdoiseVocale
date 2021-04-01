import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Command {
  static final all = [aled];

  static const aled = 'ffrfrfrfrfrffdcdccscscs';
}

class Utils {
  static Future openEmail({
    @required String toEmail,
    @required String subject,
    @required String body,
    @required String path,
  }) async {
    final url =
        'mailto:$toEmail?subject=${Uri.encodeFull(subject)}&body=${Uri.encodeFull(body)}&attachmentPath=${Uri.encodeFull(path)}';
    await _launchUrl(url);
  }

  static Future _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}

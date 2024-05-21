// ignore_for_file: empty_catches

import 'package:url_launcher/url_launcher.dart';

import '../services/app_remote_config.dart';

Future<void> openUrl(String url) async {
  try {
    await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
  } catch (e, _) {}
}

Future<void> onTapTerms() async {
  final link = AppRemoteConfig().getString(RemoteConfigEnum.linkTerms);
  openUrl(link);
}

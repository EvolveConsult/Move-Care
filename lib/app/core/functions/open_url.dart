import 'package:url_launcher/url_launcher.dart';

Future<void> openUrl(String url) async {
  try {
    final Uri uri = Uri.parse(url);
    await launchUrl(uri);
    // ignore: empty_catches
  } catch (e) {}
}

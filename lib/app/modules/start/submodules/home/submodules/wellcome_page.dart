import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:moveecare/app/core/ui/widgets/app_scaffold_widget.dart';

import '../../../../../core/functions/open_url.dart';
import '../../../../../core/services/app_remote_config.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  String message = '';

  @override
  void initState() {
    message = AppRemoteConfig().getString(RemoteConfigEnum.wellcomeText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      title: 'Apresentação',
      page: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          child: Html(
            data: message,
            onLinkTap: (url, attributes, element) {
              if (url == null) return;
              openUrl(url);
            },
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:moveecare/app/core/ui/widgets/app_scaffold_widget.dart';

import '../../../../../../../../core/functions/open_url.dart';
import '../../domain/entities/guidance_for_users_entity.dart';

class GuidanceForUserDetailsPage extends StatelessWidget {
  const GuidanceForUserDetailsPage({super.key, required this.guidanceForUsersEntity});

  final GuidanceForUsersEntity guidanceForUsersEntity;
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
        page: Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SingleChildScrollView(
        child: Html(
          data: guidanceForUsersEntity.content,
          onLinkTap: (url, attributes, element) {
            if (url == null) return;
            openUrl(url);
          },
        ),
      ),
    ));
  }
}

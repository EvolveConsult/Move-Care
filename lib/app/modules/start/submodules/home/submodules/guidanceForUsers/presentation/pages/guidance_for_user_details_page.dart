import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:movecare/app/core/ui/widgets/app_scaffold_widget.dart';

import '../../domain/entities/guidance_for_users_entity.dart';

class GuidanceForUserDetailsPage extends StatelessWidget {
  const GuidanceForUserDetailsPage({super.key, required this.guidanceForUsersEntity});

  final GuidanceForUsersEntity guidanceForUsersEntity;
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(page: SingleChildScrollView(child: Html(data: guidanceForUsersEntity.content)));
  }
}

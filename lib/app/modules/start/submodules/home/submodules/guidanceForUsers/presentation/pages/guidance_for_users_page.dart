import 'package:flutter/material.dart';
import 'package:movecare/app/core/ui/widgets/app_scaffold_widget.dart';

class GuidanceForUsersPage extends StatelessWidget {
  const GuidanceForUsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      pagePadding: EdgeInsets.zero,
      page: const Text('GuidanceForUsersPage'),
    );
  }
}

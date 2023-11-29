import 'package:flutter/material.dart';
import 'package:movecare/app/core/ui/theme/icons.dart';

class AppNavigationDestinationWidget extends StatelessWidget {
  const AppNavigationDestinationWidget({super.key, required this.label, required this.pathSvg});

  final String label;
  final String pathSvg;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: AppIcon(icon: pathSvg, color: Theme.of(context).colorScheme.onSurface, height: 24, width: 24),
      icon:
          AppIcon(icon: pathSvg, color: Theme.of(context).colorScheme.onSurface.withOpacity(.3), height: 24, width: 24),
      label: label,
    );
  }
}

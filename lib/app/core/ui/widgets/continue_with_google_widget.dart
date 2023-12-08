import 'package:flutter/material.dart';
import 'package:movecare/app/core/ui/theme/app_typography.dart';
import 'package:movecare/app/core/ui/theme/app_icons.dart';

class ContinueWithGoogleWidget extends StatelessWidget {
  const ContinueWithGoogleWidget({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: Theme.of(context).colorScheme.outline, width: 1.5),
          color: Theme.of(context).colorScheme.background,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Align(alignment: Alignment.centerLeft, child: AppIcons.google.icon()),
            const AppText('Continuar com Google'),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../theme/app_typography.dart';

enum AppButtonWidgetType { primary, secondary, transparent }

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.type = AppButtonWidgetType.primary,
  });
  final String text;
  final VoidCallback? onTap;
  final AppButtonWidgetType type;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onTap == null ? .5 : 1,
      child: GestureDetector(onTap: onTap, child: button(context)),
    );
  }

  Widget button(BuildContext context) {
    return switch (type) {
      AppButtonWidgetType.primary => Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: AppText(
            text,
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.primaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      AppButtonWidgetType.secondary => Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: AppText(
            text,
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      AppButtonWidgetType.transparent => Container(
          alignment: Alignment.center,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Theme.of(context).colorScheme.secondaryContainer)),
          child: AppText(
            text,
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.secondaryContainer,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
    };
  }
}

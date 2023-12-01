import 'package:flutter/material.dart';

class AppCheckbox extends StatelessWidget {
  final ValueNotifier<bool> notifier;
  const AppCheckbox({super.key, required this.notifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: notifier,
        builder: (_, value, __) {
          return SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              side: BorderSide(color: Theme.of(context).colorScheme.primary),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              activeColor: Theme.of(context).colorScheme.primary,
              value: value,
              onChanged: (current) {
                notifier.value = current ?? false;
              },
            ),
          );
        });
  }
}

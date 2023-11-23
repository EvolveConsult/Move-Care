import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppButtonPreviusWidget extends StatelessWidget {
  const AppButtonPreviusWidget({super.key, this.onTap, this.color, this.text});

  final VoidCallback? onTap;
  final Color? color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ?? () => Modular.to.pop(),
      child: Icon(Icons.arrow_back_ios_new_rounded, color: Theme.of(context).colorScheme.onSecondary),
    );
  }
}

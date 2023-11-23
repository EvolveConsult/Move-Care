import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

enum AppTextSize { verySmall, small, normal, great, big, ultra }

class AppText extends StatelessWidget {
  const AppText(this.text, {super.key, this.size = AppTextSize.normal, this.maxLine});

  final String text;
  final AppTextSize size;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textScaler: TextScaler.linear(getScaler),
      style: GoogleFonts.roboto(),
      maxLines: maxLine,
    );
  }

  double get getScaler {
    final isIOS = Platform.isIOS;
    return switch (size) {
      AppTextSize.verySmall => isIOS ? 1 : 0.9,
      AppTextSize.small => isIOS ? 1.2 : 1.05,
      AppTextSize.normal => isIOS ? 1.4 : 1.2,
      AppTextSize.great => isIOS ? 1.7 : 1.5,
      AppTextSize.big => isIOS ? 1.9 : 1.6,
      AppTextSize.ultra => isIOS ? 2.2 : 1.8,
    };
  }
}

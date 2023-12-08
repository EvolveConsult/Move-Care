import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:io';

enum AppTextSize { verySmall, small, normal, great, big, ultra }

double getScaler(AppTextSize size) {
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

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    super.key,
    this.size = AppTextSize.normal,
    this.maxLine,
    this.textStyle,
    this.textAlign,
    this.textOverflow,
  });

  final String text;
  final AppTextSize size;
  final int? maxLine;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final TextOverflow? textOverflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: textOverflow,
      text,
      textScaler: TextScaler.linear(getScaler(size)),
      style: GoogleFonts.inter(textStyle: textStyle),
      maxLines: maxLine,
      textAlign: textAlign,
    );
  }
}

class AppRichText extends StatelessWidget {
  const AppRichText({
    this.text,
    super.key,
    this.size = AppTextSize.normal,
    this.maxLine,
    this.textStyle,
    this.textAlign,
    this.children,
  });

  final String? text;
  final AppTextSize size;
  final int? maxLine;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  final List<InlineSpan>? children;
  @override
  Widget build(BuildContext context) {
    return RichText(
      textScaler: TextScaler.linear(getScaler(size)),
      text: TextSpan(
        style: const TextStyle(color: Colors.black),
        text: text,
        children: children,
      ),
    );
  }
}

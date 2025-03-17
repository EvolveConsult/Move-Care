import 'package:flutter/material.dart';

class AppImages {
  static const path = "assets/images";
  static const uneb = "$path/uneb.png";
  static const uneb2 = "$path/uneb2.png";
  static const proinovacao = "$path/proinovacao.png";
  static const proinovacao2 = "$path/proinovacao2.png";
}

extension AppImagesExt on String {
  Widget image({
    double? width,
    double? height,
    BoxFit? fit,
    VoidCallback? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        this,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}

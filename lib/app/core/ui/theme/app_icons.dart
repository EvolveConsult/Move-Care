import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcons {
  static const _path = "assets/icons";

  static const logo = '$_path/logo.svg';
  static const google = '$_path/google.svg';
  static const home = '$_path/home.svg';
  static const profile = '$_path/profile.svg';
  static const tests = '$_path/tests.svg';
  static const mail = '$_path/mail.svg';
  static const terms = '$_path/terms.svg';
  static const exit = '$_path/exit.svg';
  static const star = '$_path/star.svg';
  static const arrowRight = '$_path/arrowRight.svg';
  static const recoveryPassword = '$_path/recoveryPassword.svg';
  static const trash = '$_path/trash.svg';
}

extension AppIconsExt on String {
  AppIcon icon({
    String? icon,
    BoxFit? fit,
    Color? color,
    double? width,
    double? height,
    double? parentWidth,
    double? parentHeight,
    Alignment? alignment,
    Function()? onTap,
  }) {
    return AppIcon(
      icon: this,
      fit: fit,
      color: color,
      width: width,
      height: height,
      alignment: alignment,
      parentHeight: parentHeight,
      parentWidth: parentWidth,
      onTap: onTap,
    );
  }
}

class AppIcon extends StatelessWidget {
  final String icon;
  final BoxFit? fit;
  final Color? color;
  final double? height;
  final double? width;
  final double? parentHeight;
  final double? parentWidth;
  final AlignmentGeometry? alignment;
  final Function()? onTap;

  const AppIcon({
    super.key,
    required this.icon,
    this.fit,
    this.color,
    this.height,
    this.alignment,
    this.width,
    this.parentHeight,
    this.parentWidth,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: parentWidth,
        height: parentHeight,
        alignment: alignment,
        child: SizedBox(
          height: height ?? 20,
          width: width ?? 20,
          child: SvgPicture.asset(
            icon,
            fit: fit ?? BoxFit.contain,
            colorFilter: color != null ? ColorFilter.mode(color!, BlendMode.srcIn) : null,
            width: width ?? 20,
            height: height ?? 20,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/core/app_routes.dart';

class RecoveryPasswordEmailController {
  final TextEditingController email = TextEditingController();

  Future<void> onConfirm() async {
    Modular.to.pushNamed(AppRoutes.recoveryPasswordToken);
  }
}

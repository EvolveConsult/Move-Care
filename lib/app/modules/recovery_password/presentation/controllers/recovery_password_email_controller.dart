import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/core/app_routes.dart';

class RecoveryPasswordEmailController {
  final TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> enableButton = ValueNotifier(false);

  Future<void> onConfirm() async {
    if (validate() == false) return;
    Modular.to.pushNamed(AppRoutes.recoveryPasswordToken);
  }

  bool validate() {
    FocusManager.instance.primaryFocus?.unfocus();
    enableButton.value = formKey.currentState?.validate() == true;
    return enableButton.value;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/core/app_routes.dart';
import 'package:movecare/app/core/ui/widgets/app_loading.dart';

import '../../domain/usecases/recovery_with_email_usecase.dart';

class RecoveryPasswordEmailController {
  RecoveryPasswordEmailController({required this.recoveryWithEmailUsecase});
  final RecoveryWithEmailUsecase recoveryWithEmailUsecase;

  final TextEditingController email = TextEditingController();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> enableButton = ValueNotifier(false);

  Future<void> onConfirm() async {
    if (validate() == false) return;

    showAppLoading();
    final result = await recoveryWithEmailUsecase(email.text);
    hideAppLoading();

    result.fold((l) {
      Modular.to.pushNamed(AppRoutes.recoveryPasswordSuccess);
    }, (r) {
      Modular.to.pushNamed(AppRoutes.recoveryPasswordSuccess);
    });
  }

  bool validate() {
    FocusManager.instance.primaryFocus?.unfocus();
    enableButton.value = formKey.currentState?.validate() == true;
    return enableButton.value;
  }
}

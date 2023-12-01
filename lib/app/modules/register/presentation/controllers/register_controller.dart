import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movecare/app/core/domain/value_objects/quantity_minimum.dart';
import 'package:movecare/main.dart';

import '../../../../core/ui/theme/app_typography.dart';
import '../../../../core/ui/widgets/default_bottom_sheet.dart';

class RegisterController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final FocusNode focusNodePassword = FocusNode();
  final TextEditingController confirmPassword = TextEditingController();
  final FocusNode focusconfirmPassword = FocusNode();
  final formKey = GlobalKey<FormState>();
  ValueNotifier<bool> enableButton = ValueNotifier(false);

  final QuantityMinimum validatePassword = QuantityMinimum(minimum: 8, field: 'senha');

  ValueNotifier<DefaultBottomSheet?> bottomSheetAlert = ValueNotifier(null);

  ValueNotifier<bool> acceptContract = ValueNotifier(false);

  void onInit() {
    acceptContract.addListener(() {
      validate();
    });
  }

  Future<void> onConfirm() async {
    if (validate() == false) return;
    bottomSheetAlert.value = DefaultBottomSheet(
        title: 'E-mail já cadastrado',
        content: AppRichText(
          children: [
            const TextSpan(
                text: 'O e-mail inserido já está sendo utilizado, se você já tem um cadastro tente fazer login ou'),
            TextSpan(
              text: ' clique aqui ',
              style: TextStyle(color: Theme.of(AppGlobalKeys.globalKey.currentState!.context).colorScheme.primary),
              recognizer: TapGestureRecognizer()..onTap = () {},
            ),
            const TextSpan(text: 'para recuperar o acesso.'),
          ],
        ),
        confirmText: 'Entendi');
  }

  bool validate() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (formKey.currentState?.validate() == true && acceptContract.value) {
      enableButton.value = true;
    } else {
      enableButton.value = false;
    }
    return enableButton.value;
  }

  void onTapContract() {
    //TODO levar para tela de contrato
  }
}

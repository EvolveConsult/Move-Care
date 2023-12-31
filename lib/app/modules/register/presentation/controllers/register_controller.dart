import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/modules/register/domain/entities/create_user_request_entity.dart';
import 'package:movecare/main.dart';

import '../../../../core/app_routes.dart';
import '../../../../core/domain/value_objects/quantity_minimum.dart';
import '../../../../core/ui/theme/app_typography.dart';
import '../../../../core/ui/widgets/app_loading.dart';
import '../../../../core/ui/widgets/default_bottom_sheet.dart';
import '../../domain/errors.dart';
import '../../domain/usecases/create_user_usecase.dart';

class RegisterController {
  RegisterController({required this.createUserWithEmailAndPassword});
  final CreateUserUsecase createUserWithEmailAndPassword;

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

    showAppLoading();

    final request = CreateUserRequestEntity(email: email.text, password: password.text);

    final result = await createUserWithEmailAndPassword(request);
    hideAppLoading();
    result.fold((l) {
      if (l is EmailAlreadyInUseFailure) {
        _errorEmailAlreadyInUseFailure();
      } else if (l is InvalidEmailFailure) {
        _errorInvalidEmailFailure();
      } else {
        _errorDefault(l.errorMessage);
      }
    }, (r) {
      Modular.to.pushReplacementNamed(AppRoutes.registerSuccess);
    });
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

  void _errorEmailAlreadyInUseFailure() {
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

  void _errorInvalidEmailFailure() {
    bottomSheetAlert.value = DefaultBottomSheet(
        title: 'E-mail inválido',
        content: const AppRichText(children: [TextSpan(text: 'O e-mail inserido está inválido')]),
        confirmText: 'Entendi');
  }

  void _errorDefault(String message) {
    bottomSheetAlert.value =
        DefaultBottomSheet(content: AppRichText(children: [TextSpan(text: message)]), confirmText: 'Entendi');
  }
}

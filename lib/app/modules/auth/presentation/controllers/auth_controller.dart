import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/main.dart';

import '../../../../core/app_routes.dart';
import '../../../../core/ui/theme/app_typography.dart';
import '../../../../core/ui/widgets/app_loading.dart';
import '../../../../core/ui/widgets/default_bottom_sheet.dart';
import '../../domain/errors.dart';
import '../../domain/usecases/check_authorization_usecase.dart';
import '../../domain/usecases/login_with_email_and_password_usecase.dart';

class AuthController {
  AuthController({required this.loginWithEmailAndPasswordUsecase, required this.checkAuthorizationUsecase});

  final LoginWithEmailAndPasswordUsecase loginWithEmailAndPasswordUsecase;
  final CheckAuthorizationUsecase checkAuthorizationUsecase;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  ValueNotifier<DefaultBottomSheet?> bottomSheetAlert = ValueNotifier(null);

  Future<void> onConfirm() async {
    showAppLoading();
    final result = await loginWithEmailAndPasswordUsecase(email: email.text, password: password.text);
    hideAppLoading();

    result.fold((l) {
      if (l is Unauthorized) {
        _errorUnauthorized();
      } else if (l is EmailNotVerified) {
        _errorEmailNotVerified();
      } else if (l is ManyFailedLoginAttempts) {
        _errorManyFailedLoginAttempts();
      } else {
        _errorDefault(l.errorMessage);
      }
    }, (r) {
      Modular.to.pushNamed(AppRoutes.start);
    });
  }

  void onTapRecovery() {
    Modular.to.pop(); //close bottomSheet
    Modular.to.pushNamed(AppRoutes.recoveryPasswordEmail);
  }

  void _errorUnauthorized() {
    bottomSheetAlert.value = DefaultBottomSheet(
      title: 'Credenciais inválidas',
      content: AppRichText(
        children: [
          const TextSpan(text: 'E-mail ou senha inválidos.\n\n'),
          TextSpan(
            style: TextStyle(color: Theme.of(AppGlobalKeys.globalKey.currentState!.context).colorScheme.primary),
            text: 'Recuperar o acesso.',
            recognizer: TapGestureRecognizer()..onTap = onTapRecovery,
          ),
        ],
      ),
      confirmText: 'Entendi',
    );
  }

  void _errorManyFailedLoginAttempts() {
    bottomSheetAlert.value = DefaultBottomSheet(
      title: 'Excesso de tentativas de login',
      content: AppRichText(
        children: [
          const TextSpan(text: 'Sua conta está bloqueada até que seja feita a recuperação.\n\n'),
          TextSpan(
            style: TextStyle(color: Theme.of(AppGlobalKeys.globalKey.currentState!.context).colorScheme.primary),
            text: 'Recuperar o acesso.',
            recognizer: TapGestureRecognizer()..onTap = onTapRecovery,
          ),
        ],
      ),
      confirmText: 'Entendi',
    );
  }

  void _errorEmailNotVerified() {
    bottomSheetAlert.value = DefaultBottomSheet(
      title: 'E-mail não verificado',
      content: const AppRichText(
        children: [
          TextSpan(text: 'Você precisa confirma seu e-mail através do link enviado.\nVerifique a caixa de spam.'),
        ],
      ),
      confirmText: 'Entendi',
    );
  }

  void _errorDefault(String message) {
    bottomSheetAlert.value =
        DefaultBottomSheet(content: AppRichText(children: [TextSpan(text: message)]), confirmText: 'Entendi');
  }

  Future<bool> get isLogged async {
    final result = await checkAuthorizationUsecase();
    return result.fold((l) => false, (r) => r);
  }
}

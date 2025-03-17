import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:moveecare/main.dart';

import '../../../../core/app_routes.dart';
import '../../../../core/domain/erros/errors_comons.dart';
import '../../../../core/services/app_remote_config.dart';
import '../../../../core/ui/theme/app_typography.dart';
import '../../../../core/ui/widgets/app_loading.dart';
import '../../../../core/ui/widgets/default_bottom_sheet.dart';
import '../../../shared/domain/usecases/login_with_google_usecase.dart';
import '../../domain/errors.dart';
import '../../domain/usecases/check_authorization_usecase.dart';
import '../../domain/usecases/login_with_email_and_password_usecase.dart';

class AuthController {
  AuthController({
    required this.loginWithEmailAndPasswordUsecase,
    required this.checkAuthorizationUsecase,
    required this.loginWithGoogleUsecase,
  });
  final LoginWithGoogleUsecase loginWithGoogleUsecase;
  final LoginWithEmailAndPasswordUsecase loginWithEmailAndPasswordUsecase;
  final CheckAuthorizationUsecase checkAuthorizationUsecase;

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  ValueNotifier<DefaultBottomSheet?> bottomSheetAlert = ValueNotifier(null);

  ValueNotifier<bool> acceptContract = ValueNotifier(false);

  final formKey = GlobalKey<FormState>();

  Future<void> onConfirm() async {
    if (formKey.currentState?.validate() == false) return;
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
        _errorDefault();
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
          TextSpan(
              text:
                  'Você precisa confirmar seu e-mail através do link enviado.\nVerifique a caixa de entrada e a caixa de spam.'),
        ],
      ),
      confirmText: 'Entendi',
    );
  }

  void _errorDefault() {
    final supportEmail = AppRemoteConfig().getString(RemoteConfigEnum.supportEmail);
    bottomSheetAlert.value = DefaultBottomSheet(
        content: AppRichText(children: [
          TextSpan(
              text:
                  'Ocorreu um erro inesperado. Se o problema persistir entre em contato conosco através do nosso e-mail: $supportEmail')
        ]),
        confirmText: 'Entendi');
  }

  Future<bool> get isLogged async {
    final result = await checkAuthorizationUsecase();
    return result.fold((l) => false, (r) => r);
  }

  Future<void> loginWithGoogle() async {
    if (acceptContract.value == false) return;
    Modular.to.pop();
    acceptContract.value = false;
    showAppLoading();
    final result = await loginWithGoogleUsecase();
    hideAppLoading();
    result.fold((l) {
      if (l is LoginCanceled) return;
      _errorDefault();
    }, (r) => Modular.to.pushReplacementNamed(AppRoutes.start));
  }
}

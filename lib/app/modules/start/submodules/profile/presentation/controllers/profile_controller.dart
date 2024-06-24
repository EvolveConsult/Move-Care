import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../../core/app_routes.dart';
import '../../../../../../core/services/app_remote_config.dart';
import '../../../../../../core/ui/theme/app_typography.dart';
import '../../../../../../core/ui/widgets/app_loading.dart';
import '../../../../../../core/ui/widgets/default_bottom_sheet.dart';

class ProfileController {
  ValueNotifier<DefaultBottomSheet?> bottomSheetAlert = ValueNotifier(null);

  Future<void> onConfirmDeleteAccount() async {
    try {
      showAppLoading();
      await FirebaseAuth.instance.currentUser?.delete();
      hideAppLoading();
      Modular.to.navigate(AppRoutes.splash);
    } on FirebaseAuthException catch (e) {
      if (e.code.toLowerCase() == 'requires-recent-login') {
        _errorRequiresRecentLogin();
      }
    } catch (e) {
      final emailSupport = AppRemoteConfig().getString(RemoteConfigEnum.supportEmail);
      bottomSheetAlert.value = DefaultBottomSheet(
          content: AppText(
            'Ocorreu um erro inesperado.\n\nSe o problema persistir entre em contato conosco através do nosso e-mail: $emailSupport',
          ),
          confirmText: 'Entendi');
    } finally {
      hideAppLoading();
    }
  }

  void _errorRequiresRecentLogin() {
    bottomSheetAlert.value = DefaultBottomSheet(
      title: 'Realizar login',
      content: const AppText(
          'Faz algum tempo desde o seu último login. É necessário que você insira suas credenciais novamente. Em seguida você pode realizar a exclusão da conta.'),
      confirmText: 'Realizar login',
      onConfirm: () => Modular.to.navigate(AppRoutes.splash),
      cancelText: 'Cancelar',
      onCancel: Modular.to.pop,
    );
  }
}

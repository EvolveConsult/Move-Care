import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/main.dart';

import '../../../../core/app_routes.dart';
import '../../../../core/ui/theme/app_typography.dart';
import '../../../../core/ui/widgets/default_bottom_sheet.dart';

class AuthController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  ValueNotifier<DefaultBottomSheet?> bottomSheetAlert = ValueNotifier(null);

  Future<void> onConfirm() async {
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
        onCancel: () {},
        cancelText: 'Cancelar');
  }

  void onTapRecovery() {
    Modular.to.pop();
    Modular.to.pushNamed(AppRoutes.recoveryPasswordEmail);
  }
}

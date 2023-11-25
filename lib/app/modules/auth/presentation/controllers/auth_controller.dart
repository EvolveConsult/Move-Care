import 'package:flutter/material.dart';
import 'package:movecare/main.dart';

import '../../../../core/ui/theme/app_typography.dart';
import '../../../../core/ui/widgets/default_bottom_sheet.dart';

class AuthController {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  ValueNotifier<DefaultBottomSheet?> bottomSheetAlert = ValueNotifier(null);

  void onTapRecoveryPassword() {}

  Future<void> onConfirm() async {
    bottomSheetAlert.value = DefaultBottomSheet(
        title: 'Credenciais inválidas',
        content: RichText(
          text: TextSpan(
            children: [
              const WidgetSpan(child: AppText('E-mail ou senha inválidos.\n')),
              WidgetSpan(
                  child: GestureDetector(
                      child: AppText(
                'Recuperar o acesso.',
                textStyle:
                    TextStyle(color: Theme.of(AppGlobalKeys.globalKey.currentState!.context).colorScheme.primary),
              )))
            ],
          ),
        ),
        onCancel: () {},
        cancelText: 'Cancelar');
  }
}

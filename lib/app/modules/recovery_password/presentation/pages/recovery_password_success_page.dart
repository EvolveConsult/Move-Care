import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/app_routes.dart';
import '../../../../core/ui/theme/app_typography.dart';
import '../../../../core/ui/theme/app_icons.dart';
import '../../../../core/ui/widgets/app_button_widget.dart';
import '../../../../core/ui/widgets/app_scaffold_widget.dart';

class RecoveryPasswordSuccessPage extends StatelessWidget {
  const RecoveryPasswordSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      canPop: false,
      hasAppBar: false,
      page: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppIcon(icon: AppIcons.mail, height: 140, width: 140, color: Theme.of(context).colorScheme.secondary),
          const SizedBox(height: 32),
          AppText(
            'Você receberá um e-mail com instruções para recuperar a senha.\nVerifique a caixa de entrada e a caixa de spam.',
            size: AppTextSize.normal,
            textStyle: TextStyle(color: Theme.of(context).colorScheme.onSecondary, fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      bottomNavigationBar: IntrinsicHeight(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: AppButton(
            text: 'Login',
            onTap: () {
              Modular.to.popUntil(ModalRoute.withName(AppRoutes.splash));
              Modular.to.pushNamed(AppRoutes.auth);
            }),
      )),
    );
  }
}

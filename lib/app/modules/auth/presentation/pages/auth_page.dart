import 'package:flutter/material.dart';
import 'package:movecare/app/core/ui/theme/app_typography.dart';
import 'package:movecare/app/core/ui/widgets/app_button_widget.dart';
import 'package:movecare/app/core/ui/widgets/app_scaffold_widget.dart';
import 'package:movecare/app/core/ui/widgets/app_text_form_field_widget.dart';
import 'package:movecare/app/core/ui/widgets/continue_with_google_widget.dart';

import '../../../../core/domain/value_objects/email.dart';
import '../controllers/auth_controller.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key, required this.controller});

  final AuthController controller;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      backgroundColorAppBar: Theme.of(context).colorScheme.onBackground,
      bottomSheetAlert: controller.bottomSheetAlert,
      page: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Container(height: 140, width: 140, color: Theme.of(context).colorScheme.secondary),
                const SizedBox(height: 80),
                AppTextFormField(
                  labelText: 'E-mail',
                  hintText: 'Digite seu e-mail',
                  validator: [Email()],
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.email,
                ),
                const SizedBox(height: 20),
                AppTextFormFieldPasswordWidget(
                  controller: controller.password,
                  labelText: 'Senha',
                  hintText: 'Digite a senha',
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: controller.onTapRecoveryPassword,
                    child: AppText(
                      'Esqueci minha senha',
                      size: AppTextSize.verySmall,
                      textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const AppDivider(text: 'ou'),
                const SizedBox(height: 16),
                ContinueWithGoogleWidget(onTap: () {}),
              ],
            ),
          ),
          SliverFillRemaining(
            child: Column(
              children: [
                const Spacer(),
                AppButton(text: 'Entrar', onTap: controller.onConfirm),
                SizedBox(height: MediaQuery.of(context).padding.bottom),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class AppDivider extends StatelessWidget {
  const AppDivider({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Container(height: 1.5, color: Theme.of(context).colorScheme.outline)),
        if (text != null) ...[
          const SizedBox(width: 12),
          AppText(text!, size: AppTextSize.small),
          const SizedBox(width: 12),
        ],
        Expanded(child: Container(height: 1.5, color: Theme.of(context).colorScheme.outline)),
      ],
    );
  }
}

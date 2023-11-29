import 'package:flutter/material.dart';

import '../../../../core/domain/value_objects/email.dart';
import '../../../../core/ui/theme/app_typography.dart';
import '../../../../core/ui/widgets/app_button_widget.dart';
import '../../../../core/ui/widgets/app_scaffold_widget.dart';
import '../../../../core/ui/widgets/app_text_form_field_widget.dart';
import '../controllers/recovery_password_email_controller.dart';

class RecoveryPasswordPage extends StatelessWidget {
  const RecoveryPasswordPage({super.key, required this.controller});

  final RecoveryPasswordEmailController controller;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      page: ScrollConfiguration(
        behavior: const ScrollBehavior().copyWith(overscroll: false),
        child: CustomScrollView(
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 20),
                  Container(height: 140, width: 140, color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(height: 52),
                  const AppText('Nos informe o seu e-mail para recuperação de senha.',
                      textStyle: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 32),
                  AppTextFormField(
                    labelText: 'E-mail',
                    hintText: 'Digite seu e-mail',
                    validator: [Email()],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    controller: controller.email,
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  AppButton(text: 'Continuar', onTap: controller.onConfirm),
                  SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

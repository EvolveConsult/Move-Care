import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:movecare/app/core/app_routes.dart';
import 'package:movecare/app/core/ui/theme/app_typography.dart';
import 'package:movecare/app/core/ui/widgets/app_button_widget.dart';
import 'package:movecare/app/core/ui/widgets/app_scaffold_widget.dart';
import 'package:movecare/app/core/ui/widgets/app_text_form_field_widget.dart';
import 'package:movecare/app/core/ui/widgets/continue_with_google_widget.dart';
import 'package:movecare/app/core/ui/widgets/default_bottom_sheet.dart';

import '../../../../core/domain/value_objects/email.dart';
import '../../../shared/presentation/widgets/accept_terms_widget.dart';
import '../controllers/auth_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key, required this.controller});

  final AuthController controller;

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  void _confirmLoginWithGoogle() {
    widget.controller.bottomSheetAlert.value = DefaultBottomSheet(
      content: AcceptTermsWidget(acceptContract: widget.controller.acceptContract),
      cancelText: "Cancelar",
      confirmText: "Continuar",
      title: "Termos",
      onConfirm: () {
        Modular.to.pop();
        widget.controller.loginWithGoogle();
      },
      onCancel: () {
        widget.controller.acceptContract.value = false;
        Modular.to.pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      backgroundColorAppBar: Theme.of(context).colorScheme.onBackground,
      bottomSheetAlert: widget.controller.bottomSheetAlert,
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
                  const SizedBox(height: 80),
                  AppTextFormField(
                    labelText: 'E-mail',
                    hintText: 'Digite seu e-mail',
                    validator: [Email()],
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.emailAddress,
                    controller: widget.controller.email,
                  ),
                  const SizedBox(height: 20),
                  AppTextFormFieldPasswordWidget(
                    controller: widget.controller.password,
                    labelText: 'Senha',
                    hintText: 'Digite a senha',
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () => Modular.to.pushNamed(AppRoutes.recoveryPasswordEmail),
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
                  ContinueWithGoogleWidget(onTap: _confirmLoginWithGoogle),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  const Spacer(),
                  AppButton(text: 'Entrar', onTap: widget.controller.onConfirm),
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

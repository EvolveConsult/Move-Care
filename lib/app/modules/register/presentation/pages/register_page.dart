import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intersperse/intersperse.dart';
import 'package:movecare/app/core/domain/value_objects/equality.dart';
import 'package:movecare/app/core/domain/value_objects/required.dart';
import 'package:movecare/app/core/ui/theme/app_typography.dart';
import 'package:movecare/app/core/ui/widgets/app_button_widget.dart';
import 'package:movecare/app/core/ui/widgets/app_checkbox_widget.dart';
import 'package:movecare/app/core/ui/widgets/app_scaffold_widget.dart';
import 'package:movecare/app/core/ui/widgets/app_text_form_field_widget.dart';
import 'package:movecare/app/core/ui/widgets/continue_with_google_widget.dart';

import '../../../../core/domain/value_objects/email.dart';
import '../controllers/register_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key, required this.controller});

  final RegisterController controller;

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  void initState() {
    super.initState();

    widget.controller.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      backgroundColor: Theme.of(context).colorScheme.onBackground,
      backgroundColorAppBar: Theme.of(context).colorScheme.onBackground,
      bottomSheetAlert: widget.controller.bottomSheetAlert,
      onTap: widget.controller.validate,
      page: Form(
        key: widget.controller.formKey,
        child: ScrollConfiguration(
          behavior: const ScrollBehavior().copyWith(overscroll: false),
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const AppText(
                      'Informe seus dados para se cadastrar:',
                      size: AppTextSize.great,
                      textStyle: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 24),
                    ...intersperse(const SizedBox(height: 16), [
                      AppTextFormField(
                        labelText: 'E-mail',
                        hintText: 'Digite seu e-mail',
                        validator: [Email()],
                        keyboardType: TextInputType.emailAddress,
                        controller: widget.controller.email,
                        onEditingComplete: widget.controller.focusNodePassword.requestFocus,
                      ),
                      AppTextFormFieldPasswordWidget(
                        focusNode: widget.controller.focusNodePassword,
                        controller: widget.controller.password,
                        labelText: 'Senha',
                        hintText: 'Digite a senha',
                        validator: [widget.controller.validatePassword],
                        onEditingComplete: widget.controller.focusconfirmPassword.requestFocus,
                      ),
                      AppTextFormFieldPasswordWidget(
                        focusNode: widget.controller.focusconfirmPassword,
                        controller: widget.controller.confirmPassword,
                        labelText: 'Confirme a senha',
                        hintText: 'Confirme a senha digitada',
                        onEditingComplete: widget.controller.validate,
                        validator: [
                          Required('Campo obrigatório'),
                          Equality(
                            comparisonValue: widget.controller.password,
                            message: 'As senhas não coincidem',
                          )
                        ],
                      ),
                    ]),
                    const SizedBox(height: 8),
                    AppText(
                      'Digite uma senha de no mínimo 8 caracteres',
                      size: AppTextSize.verySmall,
                      textStyle: TextStyle(color: Theme.of(context).colorScheme.error),
                    ),
                    const SizedBox(height: 20),
                    const AppDivider(text: 'ou'),
                    const SizedBox(height: 16),
                    ContinueWithGoogleWidget(onTap: () {}),
                    const SizedBox(height: 12),
                    AppRichText(
                      children: [
                        WidgetSpan(
                            child: AppCheckbox(notifier: widget.controller.acceptContract),
                            alignment: PlaceholderAlignment.middle),
                        const TextSpan(text: '  Li e concordo com as'),
                        TextSpan(
                          text: ' política de privacidade e termos de uso ',
                          style: TextStyle(color: Theme.of(context).colorScheme.primary),
                          recognizer: TapGestureRecognizer()..onTap = widget.controller.onTapContract,
                        ),
                        const TextSpan(text: 'do Move & Care.'),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  children: [
                    const Spacer(),
                    ValueListenableBuilder(
                        valueListenable: widget.controller.enableButton,
                        builder: (_, value, __) {
                          return AppButton(text: 'Criar conta', onTap: value ? widget.controller.onConfirm : null);
                        }),
                    SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
                  ],
                ),
              )
            ],
          ),
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

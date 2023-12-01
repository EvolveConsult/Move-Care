import 'package:flutter/material.dart';
import 'package:movecare/app/core/ui/widgets/app_text_form_field_widget.dart';

import '../../../../../../../../core/ui/theme/app_typography.dart';
import '../../../../../../../../core/ui/widgets/app_button_widget.dart';
import '../../../../../../../../core/ui/widgets/app_checkbox_widget.dart';
import '../../../../../../../../core/ui/widgets/app_scaffold_widget.dart';
import '../controllers/contact_us_controller.dart';

class ContactUsPageState extends StatelessWidget {
  const ContactUsPageState({super.key, required this.controller});
  final ContactUsController controller;

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      resizeToAvoidBottomInset: true,
      title: 'Fale conosco',
      page: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const AppText(
                'Neste espaço você pode registrar dúvidas, elogios e sugestões sobre o aplicativo. Ficaremos felizes em receber seu feedback.',
                size: AppTextSize.normal),
            const SizedBox(height: 40),
            const AppText(
              'Digite sua mensagem aqui:',
              size: AppTextSize.small,
              textStyle: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 4),
            AppTextFormField(
              controller: controller.textController,
              isTextArea: true,
              showCounter: true,
              maxCharacters: 200,
            ),
            const SizedBox(height: 16),
            AppRichText(
              children: [
                WidgetSpan(
                    child: AppCheckbox(notifier: controller.acceptContact), alignment: PlaceholderAlignment.middle),
                const TextSpan(text: '  Desejo receber um retorno sobre a mensagem enviada'),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: IntrinsicHeight(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: ValueListenableBuilder(
            valueListenable: controller.textController,
            builder: (_, value, __) {
              return AppButton(
                  text: 'Enviar', onTap: value.text.length >= controller.minimunSizeRequired ? () {} : null);
            }),
      )),
    );
  }
}

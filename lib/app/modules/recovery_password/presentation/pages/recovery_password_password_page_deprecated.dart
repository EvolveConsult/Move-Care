// import 'package:flutter/material.dart';

// import '../../../../core/domain/value_objects/equality.dart';
// import '../../../../core/domain/value_objects/required.dart';
// import '../../../../core/ui/theme/app_typography.dart';
// import '../../../../core/ui/widgets/app_button_widget.dart';
// import '../../../../core/ui/widgets/app_scaffold_widget.dart';
// import '../../../../core/ui/widgets/app_text_form_field_widget.dart';
// import '../controllers/recovery_password_password_controller_deprecated.dart';

// class RecoveryPasswordPasswordPage extends StatelessWidget {
//   const RecoveryPasswordPasswordPage({super.key, required this.controller});

//   final RecoveryPasswordPasswordController controller;

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffoldWidget(
//       onTap: controller.validate,
//       page: ScrollConfiguration(
//         behavior: const ScrollBehavior().copyWith(overscroll: false),
//         child: CustomScrollView(
//           physics: const ClampingScrollPhysics(),
//           slivers: [
//             SliverToBoxAdapter(
//               child: Form(
//                 key: controller.formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 20),
//                     Container(height: 140, width: 140, color: Theme.of(context).colorScheme.secondary),
//                     const SizedBox(height: 52),
//                     const AppText('Defina uma senha de no mínimo 8 caracteres.',
//                         textStyle: TextStyle(fontWeight: FontWeight.w500)),
//                     const SizedBox(height: 32),
//                     AppTextFormFieldPasswordWidget(
//                       focusNode: controller.focusNodePassword,
//                       controller: controller.password,
//                       labelText: 'Senha',
//                       hintText: 'Digite a senha',
//                       validator: [controller.validatePassword],
//                       onEditingComplete: controller.focusconfirmPassword.requestFocus,
//                     ),
//                     const SizedBox(height: 16),
//                     AppTextFormFieldPasswordWidget(
//                       focusNode: controller.focusconfirmPassword,
//                       controller: controller.confirmPassword,
//                       labelText: 'Confirme a senha',
//                       hintText: 'Confirme a senha digitada',
//                       onEditingComplete: controller.validate,
//                       validator: [
//                         Required('Campo obrigatório'),
//                         Equality(comparisonValue: controller.password, message: 'As senhas não coincidem')
//                       ],
//                     ),
//                     const SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ),
//             SliverFillRemaining(
//               hasScrollBody: false,
//               child: Column(
//                 children: [
//                   const Spacer(),
//                   ValueListenableBuilder(
//                       valueListenable: controller.enableButton,
//                       builder: (_, value, __) {
//                         return AppButton(text: 'Confirmar', onTap: value ? controller.onConfirm : null);
//                       }),
//                   SizedBox(height: MediaQuery.of(context).padding.bottom + 20),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

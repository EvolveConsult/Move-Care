// import 'package:flutter/material.dart';
// import 'package:movecare/app/core/ui/theme/app_typography.dart';
// import 'package:movecare/app/core/ui/widgets/app_button_widget.dart';
// import 'package:movecare/app/core/ui/widgets/app_countdown_widget.dart';
// import 'package:movecare/app/core/ui/widgets/app_pin_code_widget.dart';
// import 'package:movecare/app/core/ui/widgets/app_scaffold_widget.dart';

// import '../controllers/recovery_password_token_controller.dart';

// class RecoveryPasswordTokenPage extends StatelessWidget {
//   const RecoveryPasswordTokenPage({super.key, required this.controller});

//   final RecoveryPasswordTokenController controller;

//   @override
//   Widget build(BuildContext context) {
//     return AppScaffoldWidget(
//       bottomSheetAlert: controller.bottomSheetAlert,
//       page: ScrollConfiguration(
//         behavior: const ScrollBehavior().copyWith(overscroll: false),
//         child: CustomScrollView(
//           physics: const ClampingScrollPhysics(),
//           slivers: [
//             SliverToBoxAdapter(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const SizedBox(height: 20),
//                   Container(height: 140, width: 140, color: Theme.of(context).colorScheme.secondary),
//                   const SizedBox(height: 52),
//                   const AppText('Por favor, informe o código enviado para seu e-mail.'),
//                   const SizedBox(height: 32),
//                   AppPinCodeWidget(controller: controller.tokenController, codeLength: controller.sizeToken),
//                   const SizedBox(height: 20),
//                   AppCountdownWidget(
//                     seconds: 13,
//                     childWhenCompleted: GestureDetector(
//                       onTap: controller.resendToken,
//                       child: AppText(
//                         'Solicitar novo código',
//                         size: AppTextSize.small,
//                         textStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
//                       ),
//                     ),
//                     child: (seconds) => AppText('Solicitar novo código em $seconds segundos.', size: AppTextSize.small),
//                     restart: controller.restartTimer,
//                   ),
//                   const SizedBox(height: 20),
//                 ],
//               ),
//             ),
//             SliverFillRemaining(
//               hasScrollBody: false,
//               child: Column(
//                 children: [
//                   const Spacer(),
//                   ValueListenableBuilder(
//                       valueListenable: controller.tokenController,
//                       builder: (_, value, __) {
//                         return AppButton(
//                           text: 'Continuar',
//                           onTap: value.text.length == controller.sizeToken ? controller.onConfirm : null,
//                         );
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

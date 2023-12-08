// import 'package:flutter/material.dart';
// import '../../../../core/ui/widgets/default_bottom_sheet.dart';

// class RecoveryPasswordTokenController {
//   ValueNotifier<DefaultBottomSheet?> bottomSheetAlert = ValueNotifier(null);
//   final TextEditingController tokenController = TextEditingController();
//   final ValueNotifier<bool> restartTimer = ValueNotifier(false);
//   final int sizeToken = 5;

//   Future<void> onConfirm() async {
//     // Modular.to.pushNamed(AppRoutes.recoveryPasswordPassword);
//     // bottomSheetAlert.value = DefaultBottomSheet(
//     //     title: 'Código inválido',
//     //     content: const AppRichText(text: 'Código informado está inválido. Verique e tente novamente.'),
//     //     onCancel: () {},
//     //     cancelText: 'Cancelar');
//   }

//   Future<void> resendToken() async {
//     tokenController.clear();
//     restartTimer.value = true;
//   }
// }

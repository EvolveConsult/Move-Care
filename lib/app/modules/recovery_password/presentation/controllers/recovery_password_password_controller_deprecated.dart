// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:movecare/app/core/app_routes.dart';

// import '../../../../core/domain/value_objects/quantity_minimum.dart';

// class RecoveryPasswordPasswordController {
//   final TextEditingController password = TextEditingController();
//   final FocusNode focusNodePassword = FocusNode();
//   final TextEditingController confirmPassword = TextEditingController();
//   final FocusNode focusconfirmPassword = FocusNode();
//   final formKey = GlobalKey<FormState>();
//   final QuantityMinimum validatePassword = QuantityMinimum(minimum: 8, field: 'senha');
//   ValueNotifier<bool> enableButton = ValueNotifier(false);

//   Future<void> onConfirm() async {
//     Modular.to.pushNamed(AppRoutes.recoveryPasswordSuccess);
//   }

//   bool validate() {
//     FocusManager.instance.primaryFocus?.unfocus();
//     enableButton.value = formKey.currentState?.validate() == true;
//     return enableButton.value;
//   }
// }

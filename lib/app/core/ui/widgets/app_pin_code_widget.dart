import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class AppPinCodeWidget extends StatelessWidget {
  final int codeLength;
  final TextEditingController controller;
  final FocusNode? focusNode;
  final Function(String)? onCompleted;
  final Function(String)? onSubmit;
  final Function(String)? onChanged;
  final bool autofocus;
  final bool showCursor;
  final bool isObscure;

  final BoxDecoration? decoration;

  final bool readOnly;
  const AppPinCodeWidget({
    super.key,
    required this.controller,
    this.codeLength = 5,
    this.focusNode,
    this.onCompleted,
    this.onSubmit,
    this.onChanged,
    this.autofocus = true,
    this.showCursor = true,
    this.isObscure = false,
    this.decoration,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      readOnly: readOnly,
      obscureText: isObscure,
      controller: controller,
      focusNode: focusNode,
      length: codeLength,
      showCursor: showCursor,
      onCompleted: onCompleted,
      onSubmitted: onSubmit,
      onChanged: onChanged,
      autofocus: autofocus,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      defaultPinTheme: PinTheme(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(4),
        textStyle: const TextStyle(
          fontSize: 24,
          height: 30 / 24,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
          color: Colors.pink,
        ),
        decoration: decoration ??
            BoxDecoration(
              border: Border(bottom: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2)),
            ),
      ),
    );
  }
}

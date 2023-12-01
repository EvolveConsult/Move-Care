import 'package:flutter/material.dart';

class ContactUsController {
  final ValueNotifier<bool> acceptContact = ValueNotifier(false);
  final TextEditingController textController = TextEditingController();
  final int minimunSizeRequired = 15;
}

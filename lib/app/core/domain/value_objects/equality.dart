import 'package:flutter/material.dart';

import 'value_object_interface.dart';

class Equality extends ValueObjectInterface {
  final String message;
  final ValueNotifier<TextEditingValue> comparisonValue;

  Equality({required this.message, required this.comparisonValue});

  @override
  String? validator(String value) {
    return value == comparisonValue.value.text ? null : message;
  }
}

import 'value_object_interface.dart';

class QuantityMinimum extends ValueObjectInterface {
  final int minimum;
  final String field;
  final String? message;

  QuantityMinimum({required this.minimum, this.field = '', this.message})
      : assert((field.isNotEmpty || message != null));
  @override
  String? validator(String value) {
    if (value.length < minimum) {
      return message ?? 'A quantidade mínima de caracteres do campo $field é $minimum.';
    } else {
      return null;
    }
  }
}

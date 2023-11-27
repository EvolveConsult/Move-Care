import 'value_object_interface.dart';

class QuantityMinimum extends ValueObjectInterface {
  final int minimum;
  final String? field;
  final String? message;

  QuantityMinimum({required this.minimum, this.field, this.message})
      : assert(
          message != null || field != null,
          'message ou field devem ser fornecidos',
        );
  @override
  String? validator(String value) {
    if (value.length < minimum) {
      return message ?? 'A quantidade mínima de caracteres do campo $field é $minimum.';
    } else {
      return null;
    }
  }
}

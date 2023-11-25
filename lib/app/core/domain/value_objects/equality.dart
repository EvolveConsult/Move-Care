import 'value_object_interface.dart';

class Equality extends ValueObjectInterface {
  final String comparisonValue;
  final String message;

  Equality({required this.comparisonValue, required this.message});

  Equality copyWith(String comparisonValue) {
    return Equality(comparisonValue: comparisonValue, message: message);
  }

  @override
  String? validator(String value) {
    if (value.isNotEmpty) {
      return value == comparisonValue ? null : message;
    } else {
      return null;
    }
  }
}

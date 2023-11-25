import 'value_object_interface.dart';

class Required extends ValueObjectInterface {
  final String message;

  Required(this.message);

  @override
  String? validator(String value) {
    return (value.isNotEmpty) ? null : message;
  }
}

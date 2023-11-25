import 'package:movecare/app/core/domain/extension/ext_string.dart';

import 'value_object_interface.dart';

class Email extends ValueObjectInterface {
  @override
  String? validator(String value) {
    if (value.isEmpty) {
      return null;
    } else if (value.length > 80) {
      return 'E-mail inválido.\nLimite de 80 caracteres.';
    } else {
      return value.isValidEmail ? null : 'E-mail inválido';
    }
  }
}

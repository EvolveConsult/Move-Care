import 'package:moveecare/app/core/domain/extension/ext_string.dart';

import 'value_object_interface.dart';

class Email extends ValueObjectInterface {
  @override
  String? validator(String value) {
    if (value.length > 80) {
      return 'E-mail inválido.\nLimite de 80 caracteres.';
    } else {
      return value.isValidEmail ? null : 'E-mail inválido';
    }
  }
}

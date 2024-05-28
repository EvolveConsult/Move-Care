import 'package:moveecare/app/core/domain/erros/failure.dart';

class UserNotFound extends Failure {}

class InvalidEmail extends Failure {
  InvalidEmail({super.errorMessage = 'E-mail inválido'});
}

class LoginCanceled extends Failure {}

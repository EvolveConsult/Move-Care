import '../../../core/domain/erros/failure.dart';

class Unauthorized extends Failure {}

class ManyFailedLoginAttempts extends Failure {}

class UserDisabled extends Failure {
  UserDisabled({super.errorMessage = 'Usuário desativado'});
}

class EmailNotVerified extends Failure {}

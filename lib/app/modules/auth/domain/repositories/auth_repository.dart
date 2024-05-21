import 'package:dartz/dartz.dart';
import '../../../../core/domain/entities/user_credentials_entity.dart';
import '../../../../core/domain/erros/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredentialsEntity>> loginWithEmailAndPassword(
      {required String email, required String password});

  Future<Either<Failure, bool>> checkAuthorization();
}

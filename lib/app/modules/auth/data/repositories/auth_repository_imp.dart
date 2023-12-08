import 'package:dartz/dartz.dart';

import '../../../../core/domain/entities/user_credentials_entity.dart';
import '../../../../core/domain/erros/failure.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_datasource.dart';

class AuthRepositoryImp implements AuthRepository {
  final AuthDatasource datasource;

  AuthRepositoryImp({required this.datasource});

  @override
  Future<Either<Failure, UserCredentialsEntity>> loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final result = await datasource.loginWithEmailAndPassword(email: email, password: password);
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(UnknownError(stackTrace: s, errorLog: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkAuthorization() async {
    try {
      final result = await datasource.checkAuthorization();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(UnknownError(stackTrace: s, errorLog: e.toString()));
    }
  }
}

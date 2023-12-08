import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/failure.dart';
import '../../domain/repositories/recovery_password_repository.dart';
import '../datasources/recovery_password_datasource.dart';

class RecoveryPasswordRepositoryImp implements RecoveryPasswordRepository {
  final RecoveryPasswordDatasource datasource;

  RecoveryPasswordRepositoryImp({required this.datasource});

  @override
  Future<Either<Failure, Unit>> sendEmailRecovery(String email) async {
    try {
      await datasource.sendEmailRecovery(email);
      return const Right(unit);
    } on Failure catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(UnknownError(stackTrace: s, errorLog: e.toString()));
    }
  }
}

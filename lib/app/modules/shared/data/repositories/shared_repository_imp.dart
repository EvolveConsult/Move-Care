import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/domain/erros/failure.dart';
import '../../domain/repositories/shared_repository.dart';
import '../datasources/shared_datasource.dart';

class SharedRepositoryImp implements SharedRepository {
  final SharedDatasource datasource;

  SharedRepositoryImp({required this.datasource});

  @override
  Future<Either<Failure, UserCredential>> signInWithGoogle() async {
    try {
      final result = await datasource.signInWithGoogle();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (e, s) {
      return Left(UnknownError(stackTrace: s, errorLog: e.toString()));
    }
  }
}

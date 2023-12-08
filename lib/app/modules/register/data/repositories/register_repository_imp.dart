import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/failure.dart';
import '../../domain/entities/create_user_request_entity.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/register_datasource.dart';

class RegisterRepositoryImp implements RegisterRepository {
  final RegisterDatasource datasource;

  RegisterRepositoryImp({required this.datasource});
  @override
  Future<Either<Failure, Unit>> createUserWithEmailAndPassword(CreateUserRequestEntity request) async {
    try {
      await datasource.createUserWithEmailAndPassword(request);
      return const Right(unit);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnknownError());
    }
  }
}

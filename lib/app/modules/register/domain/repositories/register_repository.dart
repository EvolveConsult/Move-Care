import 'package:dartz/dartz.dart';
import '../../../../core/domain/erros/failure.dart';
import '../entities/create_user_request_entity.dart';

abstract class RegisterRepository {
  Future<Either<Failure, void>> createUserWithEmailAndPassword(CreateUserRequestEntity request);
}

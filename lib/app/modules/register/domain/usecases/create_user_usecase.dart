import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/failure.dart';
import '../entities/create_user_request_entity.dart';
import '../repositories/register_repository.dart';

abstract class CreateUserUsecase {
  Future<Either<Failure, void>> call(CreateUserRequestEntity request);
}

class CreateUserWithEmailAndPasswordUsecase implements CreateUserUsecase {
  final RegisterRepository registerRepository;

  CreateUserWithEmailAndPasswordUsecase({required this.registerRepository});
  @override
  Future<Either<Failure, void>> call(CreateUserRequestEntity request) {
    return registerRepository.createUserWithEmailAndPassword(request);
  }
}

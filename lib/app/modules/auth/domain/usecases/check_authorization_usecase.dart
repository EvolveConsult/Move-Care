import 'package:dartz/dartz.dart';
import '../../../../core/domain/erros/failure.dart';
import '../repositories/auth_repository.dart';

abstract class CheckAuthorizationUsecase {
  Future<Either<Failure, bool>> call();
}

class CheckAuthorizationUsecaseImp implements CheckAuthorizationUsecase {
  final AuthRepository registerRepository;

  CheckAuthorizationUsecaseImp({required this.registerRepository});
  @override
  Future<Either<Failure, bool>> call() async {
    return await registerRepository.checkAuthorization();
  }
}

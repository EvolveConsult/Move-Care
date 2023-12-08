import 'package:dartz/dartz.dart';
import '../../../../core/domain/erros/failure.dart';
import '../repositories/auth_repository.dart';

abstract class LoginWithEmailAndPasswordUsecase {
  Future<Either<Failure, void>> call({required String email, required String password});
}

class LoginWithEmailAndPasswordUsecaseImp implements LoginWithEmailAndPasswordUsecase {
  final AuthRepository registerRepository;

  LoginWithEmailAndPasswordUsecaseImp({required this.registerRepository});
  @override
  Future<Either<Failure, void>> call({required String email, required String password}) async {
    return await registerRepository.loginWithEmailAndPassword(email: email, password: password);
  }
}

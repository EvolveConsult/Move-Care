import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movecare/app/core/domain/erros/failure.dart';

import '../repositories/shared_repository.dart';

abstract class LoginWithGoogleUsecase {
  Future<Either<Failure, UserCredential>> call();
}

class LoginWithGoogleUsecaseImp implements LoginWithGoogleUsecase {
  final SharedRepository sharedRepository;

  LoginWithGoogleUsecaseImp({required this.sharedRepository});
  @override
  Future<Either<Failure, UserCredential>> call() async {
    return await sharedRepository.signInWithGoogle();
  }
}

import 'package:dartz/dartz.dart';

import '../../../../core/domain/erros/failure.dart';
import '../repositories/recovery_password_repository.dart';

abstract class RecoveryWithEmailUsecase {
  Future<Either<Failure, void>> call(String email);
}

class RecoveryWithEmailUsecaseImp implements RecoveryWithEmailUsecase {
  final RecoveryPasswordRepository recoveryPasswordRepository;

  RecoveryWithEmailUsecaseImp({required this.recoveryPasswordRepository});
  @override
  Future<Either<Failure, void>> call(String email) async {
    return await recoveryPasswordRepository.sendEmailRecovery(email);
  }
}

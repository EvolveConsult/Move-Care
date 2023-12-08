import 'package:dartz/dartz.dart';
import '../../../../core/domain/erros/failure.dart';

abstract class RecoveryPasswordRepository {
  Future<Either<Failure, void>> sendEmailRecovery(String email);
}

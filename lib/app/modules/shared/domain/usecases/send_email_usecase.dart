import 'package:dartz/dartz.dart';
import 'package:mailto/mailto.dart';
import 'package:moveecare/app/core/functions/open_url.dart';

import '../../../../core/domain/erros/failure.dart';
import '../entities/send_email_entity.dart';

abstract class SendEmailUsecase {
  Future<Either<Failure, Unit>> call(SendEmailEntity request);
}

class SendEmailUsecaseImp implements SendEmailUsecase {
  @override
  Future<Either<Failure, Unit>> call(SendEmailEntity request) async {
    try {
      final mailtoLink = Mailto(
        to: [request.reciptient],
        subject: request.subject,
        body: request.body,
      );

      await openUrl('$mailtoLink');

      return const Right(unit);
    } catch (e) {
      return Left(UnknownError(errorMessage: "Erro ao enviar o e-mail"));
    }
  }
}

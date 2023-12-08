import 'package:dartz/dartz.dart';
import '../../../../../../../../core/domain/erros/failure.dart';
import '../entities/guidance_for_users_entity.dart';
import '../repositories/guidance_for_user_repository.dart';

abstract class FetchAllGuidanceForUserUsecase {
  Future<Either<Failure, List<GuidanceForUsersEntity>>> call();
}

class FetchAllGuidanceForUserUsecaseImp implements FetchAllGuidanceForUserUsecase {
  final GuidanceForUserRepository guidanceForUserRepository;

  FetchAllGuidanceForUserUsecaseImp({required this.guidanceForUserRepository});
  @override
  Future<Either<Failure, List<GuidanceForUsersEntity>>> call() async {
    return await guidanceForUserRepository.fetchGuidanceForUser();
  }
}

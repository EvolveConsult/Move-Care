import 'package:dartz/dartz.dart';

import '../../../../../../../../core/domain/erros/failure.dart';
import '../entities/guidance_for_users_entity.dart';

abstract class GuidanceForUserRepository {
  Future<Either<Failure, List<GuidanceForUsersEntity>>> fetchGuidanceForUser();
}

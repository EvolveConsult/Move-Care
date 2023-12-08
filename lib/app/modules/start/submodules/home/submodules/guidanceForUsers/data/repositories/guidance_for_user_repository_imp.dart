import 'package:dartz/dartz.dart';

import '../../../../../../../../core/domain/erros/failure.dart';
import '../../domain/entities/guidance_for_users_entity.dart';
import '../../domain/repositories/guidance_for_user_repository.dart';
import '../datasources/guidance_for_users_datasource.dart';

class GuidanceForUserRepositoryImp implements GuidanceForUserRepository {
  final GuidanceForUsersDatasource datasource;

  GuidanceForUserRepositoryImp({required this.datasource});
  @override
  Future<Either<Failure, List<GuidanceForUsersEntity>>> fetchGuidanceForUser() async {
    try {
      final result = await datasource.fetchGuidanceForUser();
      return Right(result);
    } on Failure catch (e) {
      return Left(e);
    } catch (_) {
      return Left(UnknownError());
    }
  }
}

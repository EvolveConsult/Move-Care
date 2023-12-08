import '../../domain/entities/guidance_for_users_entity.dart';

abstract class GuidanceForUsersDatasource {
  Future<List<GuidanceForUsersEntity>> fetchGuidanceForUser();
}

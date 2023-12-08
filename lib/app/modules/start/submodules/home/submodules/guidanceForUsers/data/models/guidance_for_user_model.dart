import '../../domain/entities/guidance_for_users_entity.dart';

class GuidanceForUserModel extends GuidanceForUsersEntity {
  GuidanceForUserModel({required super.title, required super.urlImage, required super.content});

  factory GuidanceForUserModel.fromJson(Map<String, dynamic> json) {
    return GuidanceForUserModel(title: json['title'], urlImage: json['urlImage'], content: json['content']);
  }
}

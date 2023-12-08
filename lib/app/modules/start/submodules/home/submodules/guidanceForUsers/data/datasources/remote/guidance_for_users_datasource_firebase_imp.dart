import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../../../../../core/domain/erros/failure.dart';
import '../../../domain/entities/guidance_for_users_entity.dart';
import '../../models/guidance_for_user_model.dart';
import '../guidance_for_users_datasource.dart';

class GuidanceForUsersDatasourceFirebaseImp implements GuidanceForUsersDatasource {
  @override
  Future<List<GuidanceForUsersEntity>> fetchGuidanceForUser() async {
    try {
      final guidanceForUsers = await FirebaseFirestore.instance.collection('guidanceForUsers').get();

      final docs = guidanceForUsers.docs.first.data()['guidanceForUsers'];

      if (docs is! List) throw ServerFailure();

      return docs.map((e) => GuidanceForUserModel.fromJson(e)).toList();
    } catch (e, s) {
      throw UnknownError(stackTrace: s, errorLog: e.toString());
    }
  }
}

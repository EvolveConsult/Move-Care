import '../../../../core/domain/entities/user_credentials_entity.dart';

abstract class AuthDatasource {
  Future<UserCredentialsEntity> loginWithEmailAndPassword({required String email, required String password});

  Future<bool> checkAuthorization();
}

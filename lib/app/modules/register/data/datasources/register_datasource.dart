import '../../domain/entities/create_user_request_entity.dart';

abstract class RegisterDatasource {
  Future<void> createUserWithEmailAndPassword(CreateUserRequestEntity request);
}

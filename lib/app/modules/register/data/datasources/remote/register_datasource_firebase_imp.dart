import 'package:firebase_auth/firebase_auth.dart';
import '../../../../../core/domain/erros/failure.dart';
import '../../../domain/entities/create_user_request_entity.dart';
import '../../../domain/errors.dart';
import '../register_datasource.dart';

class RegisterDatasourceFirebaseImp implements RegisterDatasource {
  @override
  Future<void> createUserWithEmailAndPassword(CreateUserRequestEntity request) async {
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: request.email,
        password: request.password,
      );

      if (credential.user != null) credential.user?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw switch (e.code) {
        'email-already-in-use' => EmailAlreadyInUseFailure(),
        'invalid-email' => InvalidEmailFailure(),
        'operation-not-allowed' => ServerFailure(),
        _ => ServerFailure(),
      };
    } catch (e, s) {
      throw UnknownError(stackTrace: s, errorLog: e.toString());
    }
  }
}

import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/domain/entities/user_credentials_entity.dart';
import '../../../../../core/domain/erros/errors_comons.dart';
import '../../../../../core/domain/erros/failure.dart';
import '../../../domain/errors.dart';
import '../auth_datasource.dart';

class AuthDatasourceFirebaseImp implements AuthDatasource {
  @override
  Future<UserCredentialsEntity> loginWithEmailAndPassword({required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);

      if (credential.user?.emailVerified == true) {
        return UserCredentialsEntity(email: credential.user?.email ?? "", name: credential.user!.displayName);
      } else {
        await FirebaseAuth.instance.signOut();
        throw EmailNotVerified();
      }
    } on FirebaseAuthException catch (e) {
      throw switch (e.code) {
        'INVALID_LOGIN_CREDENTIALS' => Unauthorized(),
        'too-many-requests' => ManyFailedLoginAttempts(),
        'user-not-found' => Unauthorized(),
        'invalid-email' => InvalidEmail(),
        'user-disabled' => UserDisabled(),
        _ => ServerFailure(),
      };
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> checkAuthorization() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return false;
      return user.emailVerified;
    } catch (e) {
      rethrow;
    }
  }
}

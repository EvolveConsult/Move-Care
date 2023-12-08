import 'package:firebase_auth/firebase_auth.dart';

import '../../../../../core/domain/erros/failure.dart';
import '../../../domain/errors.dart';
import '../recovery_password_datasource.dart';

class RecoveryPasswordDatasourceFirebaseImp implements RecoveryPasswordDatasource {
  @override
  Future<void> sendEmailRecovery(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw switch (e.code) {
        'auth/invalid-email' => InvalidEmail(),
        'auth/user-not-found' => UserNotFound(),
        _ => ServerFailure(),
      };
    } catch (e, s) {
      throw UnknownError(stackTrace: s, errorLog: e.toString());
    }
  }
}

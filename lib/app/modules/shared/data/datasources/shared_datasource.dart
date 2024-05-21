import 'package:firebase_auth/firebase_auth.dart';

abstract class SharedDatasource {
  Future<UserCredential> signInWithGoogle();
}

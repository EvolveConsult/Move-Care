import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../../core/domain/erros/failure.dart';

abstract class SharedRepository {
  Future<Either<Failure, UserCredential>> signInWithGoogle();
}

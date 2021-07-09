import 'package:dartz/dartz.dart';
import 'package:unicef/domain/auth/auth_failure.dart';
import 'package:unicef/domain/auth/value_objects.dart';

abstract class IauthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password});

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password});

  Future<Either<AuthFailure, Unit>> signInGoogle();
  Future<Either<AuthFailure, Unit>> signInFacebook();
}

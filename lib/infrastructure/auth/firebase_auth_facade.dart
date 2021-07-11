import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:unicef/domain/auth/auth_failure.dart';
import 'package:unicef/domain/auth/i_auth_facade.dart';
import 'package:unicef/domain/auth/user.dart';
import 'package:unicef/domain/auth/value_objects.dart';
import './firebase_user_mapper.dart';

@LazySingleton(as: IauthFacade)
class FirebasAuthFacade implements IauthFacade {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  // final FacebookAuth _facebookSignIn;

  FirebasAuthFacade(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final emailPasswordStr = emailAddress.getOrCrash();

    try {
      await _firebaseAuth.createUserWithEmailAndPassword(
          email: emailAddressStr, password: emailPasswordStr);
      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'EMAIL_ALREADY_IN_USE') {
        return left(const AuthFailure.emailAlreadyInUse());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  // @override
  // Future<Either<AuthFailure, Unit>> signInFacebook() async {
  //   try {
  //     final AccessToken result = await _facebookSignIn.login() as AccessToken;
  //     final facebookAuthCredential =
  //         FacebookAuthProvider.credential(result.token);
  //     await _firebaseAuth.signInWithCredential(facebookAuthCredential);
  //     return right(unit);
  //   } on PlatformException catch (_) {
  //     return left(const AuthFailure.serverError());
  //   }
  // }

  @override
  Future<Either<AuthFailure, Unit>> signInGoogle() async {
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left(const AuthFailure.canceledByUser());
      }
      final googleAuth = await googleUser.authentication;
      final authCredenatial = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      await _firebaseAuth.signInWithCredential(authCredenatial);
      return right(unit);
    } on PlatformException catch (_) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAddress, required Password password}) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final emailPasswordStr = emailAddress.getOrCrash();

    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: emailAddressStr, password: emailPasswordStr);
      return right(unit);
    } on PlatformException catch (e) {
      if (e.code == 'ERROR_WRONG_PASSWORD' ||
          e.code == 'ERROR_USER_NOT_FOUND') {
        return left(const AuthFailure.invalidEmailAndPasswordCominatio());
      } else {
        return left(const AuthFailure.serverError());
      }
    }
  }

  @override
  Future<void> signOut() => Future.wait([
        _googleSignIn.signOut(),
        _firebaseAuth.signOut(),
      ]);

  @override
  Future<Option<User>> getSignedInUser() async =>
      optionOf(_firebaseAuth.currentUser?.toDomain());
}

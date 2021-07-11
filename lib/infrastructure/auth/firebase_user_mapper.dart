import 'package:firebase_auth/firebase_auth.dart' as firebase;

import 'package:unicef/domain/auth/user.dart';
import 'package:unicef/domain/core/value_object.dart';

extension FirebaseUserDomainX on firebase.User {
  User toDomain() {
    return User(
      id: UniqueId.fromUniqueString(uid).toString(),
    );
  }
}

import 'package:dartz/dartz.dart';
import 'package:unicef/domain/core/failures.dart';
import 'package:unicef/domain/core/value_object.dart';
import 'package:unicef/domain/core/value_validators.dart';

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    return EmailAddress._(validateEmailAddress(input));
  }

  EmailAddress._(
    this.value,
  );
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    return Password._(validatePassword(input));
  }

  Password._(
    this.value,
  );
}

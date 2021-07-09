import 'package:unicef/domain/core/failures.dart';

class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    return Error.safeToString(
        "ValueFailure error triggeered: Error:$valueFailure");
  }
}

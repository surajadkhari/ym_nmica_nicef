import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failure.freezed.dart';

@freezed
abstract class AuthFailure<T> with _$AuthFailure<T> {
  const factory AuthFailure.canceledByUser({
    required T failedValue,
  }) = CancelledByUser<T>;

  const factory AuthFailure.serverError({
    required T failedValue,
  }) = ServerError<T>;

  const factory AuthFailure.emailAlreadyInUse({
    required T failedValue,
  }) = EmailAlreadyInUse<T>;

  const factory AuthFailure.invalidEmailAndPasswordComination({
    required T failedValue,
  }) = InvalidEmailAndPasswordComination<T>;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  CancelledByUser<T> canceledByUser<T>({required T failedValue}) {
    return CancelledByUser<T>(
      failedValue: failedValue,
    );
  }

  ServerError<T> serverError<T>({required T failedValue}) {
    return ServerError<T>(
      failedValue: failedValue,
    );
  }

  EmailAlreadyInUse<T> emailAlreadyInUse<T>({required T failedValue}) {
    return EmailAlreadyInUse<T>(
      failedValue: failedValue,
    );
  }

  InvalidEmailAndPasswordComination<T> invalidEmailAndPasswordComination<T>(
      {required T failedValue}) {
    return InvalidEmailAndPasswordComination<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $AuthFailure = _$AuthFailureTearOff();

/// @nodoc
mixin _$AuthFailure<T> {
  T get failedValue => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) canceledByUser,
    required TResult Function(T failedValue) serverError,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) invalidEmailAndPasswordComination,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? canceledByUser,
    TResult Function(T failedValue)? serverError,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? invalidEmailAndPasswordComination,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser<T> value) canceledByUser,
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(InvalidEmailAndPasswordComination<T> value)
        invalidEmailAndPasswordComination,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser<T> value)? canceledByUser,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(InvalidEmailAndPasswordComination<T> value)?
        invalidEmailAndPasswordComination,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthFailureCopyWith<T, AuthFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFailureCopyWith<T, $Res> {
  factory $AuthFailureCopyWith(
          AuthFailure<T> value, $Res Function(AuthFailure<T>) then) =
      _$AuthFailureCopyWithImpl<T, $Res>;
  $Res call({T failedValue});
}

/// @nodoc
class _$AuthFailureCopyWithImpl<T, $Res>
    implements $AuthFailureCopyWith<T, $Res> {
  _$AuthFailureCopyWithImpl(this._value, this._then);

  final AuthFailure<T> _value;
  // ignore: unused_field
  final $Res Function(AuthFailure<T>) _then;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(_value.copyWith(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc
abstract class $CancelledByUserCopyWith<T, $Res>
    implements $AuthFailureCopyWith<T, $Res> {
  factory $CancelledByUserCopyWith(
          CancelledByUser<T> value, $Res Function(CancelledByUser<T>) then) =
      _$CancelledByUserCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$CancelledByUserCopyWithImpl<T, $Res>
    extends _$AuthFailureCopyWithImpl<T, $Res>
    implements $CancelledByUserCopyWith<T, $Res> {
  _$CancelledByUserCopyWithImpl(
      CancelledByUser<T> _value, $Res Function(CancelledByUser<T>) _then)
      : super(_value, (v) => _then(v as CancelledByUser<T>));

  @override
  CancelledByUser<T> get _value => super._value as CancelledByUser<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(CancelledByUser<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$CancelledByUser<T> implements CancelledByUser<T> {
  const _$CancelledByUser({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'AuthFailure<$T>.canceledByUser(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CancelledByUser<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $CancelledByUserCopyWith<T, CancelledByUser<T>> get copyWith =>
      _$CancelledByUserCopyWithImpl<T, CancelledByUser<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) canceledByUser,
    required TResult Function(T failedValue) serverError,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) invalidEmailAndPasswordComination,
  }) {
    return canceledByUser(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? canceledByUser,
    TResult Function(T failedValue)? serverError,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? invalidEmailAndPasswordComination,
    required TResult orElse(),
  }) {
    if (canceledByUser != null) {
      return canceledByUser(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser<T> value) canceledByUser,
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(InvalidEmailAndPasswordComination<T> value)
        invalidEmailAndPasswordComination,
  }) {
    return canceledByUser(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser<T> value)? canceledByUser,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(InvalidEmailAndPasswordComination<T> value)?
        invalidEmailAndPasswordComination,
    required TResult orElse(),
  }) {
    if (canceledByUser != null) {
      return canceledByUser(this);
    }
    return orElse();
  }
}

abstract class CancelledByUser<T> implements AuthFailure<T> {
  const factory CancelledByUser({required T failedValue}) =
      _$CancelledByUser<T>;

  @override
  T get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $CancelledByUserCopyWith<T, CancelledByUser<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ServerErrorCopyWith<T, $Res>
    implements $AuthFailureCopyWith<T, $Res> {
  factory $ServerErrorCopyWith(
          ServerError<T> value, $Res Function(ServerError<T>) then) =
      _$ServerErrorCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$ServerErrorCopyWithImpl<T, $Res>
    extends _$AuthFailureCopyWithImpl<T, $Res>
    implements $ServerErrorCopyWith<T, $Res> {
  _$ServerErrorCopyWithImpl(
      ServerError<T> _value, $Res Function(ServerError<T>) _then)
      : super(_value, (v) => _then(v as ServerError<T>));

  @override
  ServerError<T> get _value => super._value as ServerError<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(ServerError<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$ServerError<T> implements ServerError<T> {
  const _$ServerError({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'AuthFailure<$T>.serverError(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ServerError<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $ServerErrorCopyWith<T, ServerError<T>> get copyWith =>
      _$ServerErrorCopyWithImpl<T, ServerError<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) canceledByUser,
    required TResult Function(T failedValue) serverError,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) invalidEmailAndPasswordComination,
  }) {
    return serverError(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? canceledByUser,
    TResult Function(T failedValue)? serverError,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? invalidEmailAndPasswordComination,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser<T> value) canceledByUser,
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(InvalidEmailAndPasswordComination<T> value)
        invalidEmailAndPasswordComination,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser<T> value)? canceledByUser,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(InvalidEmailAndPasswordComination<T> value)?
        invalidEmailAndPasswordComination,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError<T> implements AuthFailure<T> {
  const factory ServerError({required T failedValue}) = _$ServerError<T>;

  @override
  T get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $ServerErrorCopyWith<T, ServerError<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailAlreadyInUseCopyWith<T, $Res>
    implements $AuthFailureCopyWith<T, $Res> {
  factory $EmailAlreadyInUseCopyWith(EmailAlreadyInUse<T> value,
          $Res Function(EmailAlreadyInUse<T>) then) =
      _$EmailAlreadyInUseCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$EmailAlreadyInUseCopyWithImpl<T, $Res>
    extends _$AuthFailureCopyWithImpl<T, $Res>
    implements $EmailAlreadyInUseCopyWith<T, $Res> {
  _$EmailAlreadyInUseCopyWithImpl(
      EmailAlreadyInUse<T> _value, $Res Function(EmailAlreadyInUse<T>) _then)
      : super(_value, (v) => _then(v as EmailAlreadyInUse<T>));

  @override
  EmailAlreadyInUse<T> get _value => super._value as EmailAlreadyInUse<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(EmailAlreadyInUse<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$EmailAlreadyInUse<T> implements EmailAlreadyInUse<T> {
  const _$EmailAlreadyInUse({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'AuthFailure<$T>.emailAlreadyInUse(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailAlreadyInUse<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $EmailAlreadyInUseCopyWith<T, EmailAlreadyInUse<T>> get copyWith =>
      _$EmailAlreadyInUseCopyWithImpl<T, EmailAlreadyInUse<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) canceledByUser,
    required TResult Function(T failedValue) serverError,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) invalidEmailAndPasswordComination,
  }) {
    return emailAlreadyInUse(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? canceledByUser,
    TResult Function(T failedValue)? serverError,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? invalidEmailAndPasswordComination,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser<T> value) canceledByUser,
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(InvalidEmailAndPasswordComination<T> value)
        invalidEmailAndPasswordComination,
  }) {
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser<T> value)? canceledByUser,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(InvalidEmailAndPasswordComination<T> value)?
        invalidEmailAndPasswordComination,
    required TResult orElse(),
  }) {
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse<T> implements AuthFailure<T> {
  const factory EmailAlreadyInUse({required T failedValue}) =
      _$EmailAlreadyInUse<T>;

  @override
  T get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $EmailAlreadyInUseCopyWith<T, EmailAlreadyInUse<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvalidEmailAndPasswordCominationCopyWith<T, $Res>
    implements $AuthFailureCopyWith<T, $Res> {
  factory $InvalidEmailAndPasswordCominationCopyWith(
          InvalidEmailAndPasswordComination<T> value,
          $Res Function(InvalidEmailAndPasswordComination<T>) then) =
      _$InvalidEmailAndPasswordCominationCopyWithImpl<T, $Res>;
  @override
  $Res call({T failedValue});
}

/// @nodoc
class _$InvalidEmailAndPasswordCominationCopyWithImpl<T, $Res>
    extends _$AuthFailureCopyWithImpl<T, $Res>
    implements $InvalidEmailAndPasswordCominationCopyWith<T, $Res> {
  _$InvalidEmailAndPasswordCominationCopyWithImpl(
      InvalidEmailAndPasswordComination<T> _value,
      $Res Function(InvalidEmailAndPasswordComination<T>) _then)
      : super(_value, (v) => _then(v as InvalidEmailAndPasswordComination<T>));

  @override
  InvalidEmailAndPasswordComination<T> get _value =>
      super._value as InvalidEmailAndPasswordComination<T>;

  @override
  $Res call({
    Object? failedValue = freezed,
  }) {
    return _then(InvalidEmailAndPasswordComination<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$InvalidEmailAndPasswordComination<T>
    implements InvalidEmailAndPasswordComination<T> {
  const _$InvalidEmailAndPasswordComination({required this.failedValue});

  @override
  final T failedValue;

  @override
  String toString() {
    return 'AuthFailure<$T>.invalidEmailAndPasswordComination(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidEmailAndPasswordComination<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @JsonKey(ignore: true)
  @override
  $InvalidEmailAndPasswordCominationCopyWith<T,
          InvalidEmailAndPasswordComination<T>>
      get copyWith => _$InvalidEmailAndPasswordCominationCopyWithImpl<T,
          InvalidEmailAndPasswordComination<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T failedValue) canceledByUser,
    required TResult Function(T failedValue) serverError,
    required TResult Function(T failedValue) emailAlreadyInUse,
    required TResult Function(T failedValue) invalidEmailAndPasswordComination,
  }) {
    return invalidEmailAndPasswordComination(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T failedValue)? canceledByUser,
    TResult Function(T failedValue)? serverError,
    TResult Function(T failedValue)? emailAlreadyInUse,
    TResult Function(T failedValue)? invalidEmailAndPasswordComination,
    required TResult orElse(),
  }) {
    if (invalidEmailAndPasswordComination != null) {
      return invalidEmailAndPasswordComination(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(CancelledByUser<T> value) canceledByUser,
    required TResult Function(ServerError<T> value) serverError,
    required TResult Function(EmailAlreadyInUse<T> value) emailAlreadyInUse,
    required TResult Function(InvalidEmailAndPasswordComination<T> value)
        invalidEmailAndPasswordComination,
  }) {
    return invalidEmailAndPasswordComination(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(CancelledByUser<T> value)? canceledByUser,
    TResult Function(ServerError<T> value)? serverError,
    TResult Function(EmailAlreadyInUse<T> value)? emailAlreadyInUse,
    TResult Function(InvalidEmailAndPasswordComination<T> value)?
        invalidEmailAndPasswordComination,
    required TResult orElse(),
  }) {
    if (invalidEmailAndPasswordComination != null) {
      return invalidEmailAndPasswordComination(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailAndPasswordComination<T> implements AuthFailure<T> {
  const factory InvalidEmailAndPasswordComination({required T failedValue}) =
      _$InvalidEmailAndPasswordComination<T>;

  @override
  T get failedValue => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $InvalidEmailAndPasswordCominationCopyWith<T,
          InvalidEmailAndPasswordComination<T>>
      get copyWith => throw _privateConstructorUsedError;
}

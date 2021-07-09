// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'signup_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SignupFormEventTearOff {
  const _$SignupFormEventTearOff();

  EmailChanged emailChanged() {
    return const EmailChanged();
  }

  PasswordChanged passwordChanged() {
    return const PasswordChanged();
  }

  SignUpWithEmailAndPasswordPressed signUpWithEmailAndPasswordPressed() {
    return const SignUpWithEmailAndPasswordPressed();
  }
}

/// @nodoc
const $SignupFormEvent = _$SignupFormEventTearOff();

/// @nodoc
mixin _$SignupFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailChanged,
    required TResult Function() passwordChanged,
    required TResult Function() signUpWithEmailAndPasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailChanged,
    TResult Function()? passwordChanged,
    TResult Function()? signUpWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(SignUpWithEmailAndPasswordPressed value)
        signUpWithEmailAndPasswordPressed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(SignUpWithEmailAndPasswordPressed value)?
        signUpWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignupFormEventCopyWith<$Res> {
  factory $SignupFormEventCopyWith(
          SignupFormEvent value, $Res Function(SignupFormEvent) then) =
      _$SignupFormEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignupFormEventCopyWithImpl<$Res>
    implements $SignupFormEventCopyWith<$Res> {
  _$SignupFormEventCopyWithImpl(this._value, this._then);

  final SignupFormEvent _value;
  // ignore: unused_field
  final $Res Function(SignupFormEvent) _then;
}

/// @nodoc
abstract class $EmailChangedCopyWith<$Res> {
  factory $EmailChangedCopyWith(
          EmailChanged value, $Res Function(EmailChanged) then) =
      _$EmailChangedCopyWithImpl<$Res>;
}

/// @nodoc
class _$EmailChangedCopyWithImpl<$Res>
    extends _$SignupFormEventCopyWithImpl<$Res>
    implements $EmailChangedCopyWith<$Res> {
  _$EmailChangedCopyWithImpl(
      EmailChanged _value, $Res Function(EmailChanged) _then)
      : super(_value, (v) => _then(v as EmailChanged));

  @override
  EmailChanged get _value => super._value as EmailChanged;
}

/// @nodoc

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged();

  @override
  String toString() {
    return 'SignupFormEvent.emailChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmailChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailChanged,
    required TResult Function() passwordChanged,
    required TResult Function() signUpWithEmailAndPasswordPressed,
  }) {
    return emailChanged();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailChanged,
    TResult Function()? passwordChanged,
    TResult Function()? signUpWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(SignUpWithEmailAndPasswordPressed value)
        signUpWithEmailAndPasswordPressed,
  }) {
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(SignUpWithEmailAndPasswordPressed value)?
        signUpWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements SignupFormEvent {
  const factory EmailChanged() = _$EmailChanged;
}

/// @nodoc
abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
}

/// @nodoc
class _$PasswordChangedCopyWithImpl<$Res>
    extends _$SignupFormEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;
}

/// @nodoc

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged();

  @override
  String toString() {
    return 'SignupFormEvent.passwordChanged()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PasswordChanged);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailChanged,
    required TResult Function() passwordChanged,
    required TResult Function() signUpWithEmailAndPasswordPressed,
  }) {
    return passwordChanged();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailChanged,
    TResult Function()? passwordChanged,
    TResult Function()? signUpWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(SignUpWithEmailAndPasswordPressed value)
        signUpWithEmailAndPasswordPressed,
  }) {
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(SignUpWithEmailAndPasswordPressed value)?
        signUpWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements SignupFormEvent {
  const factory PasswordChanged() = _$PasswordChanged;
}

/// @nodoc
abstract class $SignUpWithEmailAndPasswordPressedCopyWith<$Res> {
  factory $SignUpWithEmailAndPasswordPressedCopyWith(
          SignUpWithEmailAndPasswordPressed value,
          $Res Function(SignUpWithEmailAndPasswordPressed) then) =
      _$SignUpWithEmailAndPasswordPressedCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignUpWithEmailAndPasswordPressedCopyWithImpl<$Res>
    extends _$SignupFormEventCopyWithImpl<$Res>
    implements $SignUpWithEmailAndPasswordPressedCopyWith<$Res> {
  _$SignUpWithEmailAndPasswordPressedCopyWithImpl(
      SignUpWithEmailAndPasswordPressed _value,
      $Res Function(SignUpWithEmailAndPasswordPressed) _then)
      : super(_value, (v) => _then(v as SignUpWithEmailAndPasswordPressed));

  @override
  SignUpWithEmailAndPasswordPressed get _value =>
      super._value as SignUpWithEmailAndPasswordPressed;
}

/// @nodoc

class _$SignUpWithEmailAndPasswordPressed
    implements SignUpWithEmailAndPasswordPressed {
  const _$SignUpWithEmailAndPasswordPressed();

  @override
  String toString() {
    return 'SignupFormEvent.signUpWithEmailAndPasswordPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SignUpWithEmailAndPasswordPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() emailChanged,
    required TResult Function() passwordChanged,
    required TResult Function() signUpWithEmailAndPasswordPressed,
  }) {
    return signUpWithEmailAndPasswordPressed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? emailChanged,
    TResult Function()? passwordChanged,
    TResult Function()? signUpWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (signUpWithEmailAndPasswordPressed != null) {
      return signUpWithEmailAndPasswordPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(EmailChanged value) emailChanged,
    required TResult Function(PasswordChanged value) passwordChanged,
    required TResult Function(SignUpWithEmailAndPasswordPressed value)
        signUpWithEmailAndPasswordPressed,
  }) {
    return signUpWithEmailAndPasswordPressed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(EmailChanged value)? emailChanged,
    TResult Function(PasswordChanged value)? passwordChanged,
    TResult Function(SignUpWithEmailAndPasswordPressed value)?
        signUpWithEmailAndPasswordPressed,
    required TResult orElse(),
  }) {
    if (signUpWithEmailAndPasswordPressed != null) {
      return signUpWithEmailAndPasswordPressed(this);
    }
    return orElse();
  }
}

abstract class SignUpWithEmailAndPasswordPressed implements SignupFormEvent {
  const factory SignUpWithEmailAndPasswordPressed() =
      _$SignUpWithEmailAndPasswordPressed;
}

/// @nodoc
class _$SignupFormStateTearOff {
  const _$SignupFormStateTearOff();

  _SignupFormState call() {
    return const _SignupFormState();
  }
}

/// @nodoc
const $SignupFormState = _$SignupFormStateTearOff();

/// @nodoc
mixin _$SignupFormState {}

/// @nodoc
abstract class $SignupFormStateCopyWith<$Res> {
  factory $SignupFormStateCopyWith(
          SignupFormState value, $Res Function(SignupFormState) then) =
      _$SignupFormStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignupFormStateCopyWithImpl<$Res>
    implements $SignupFormStateCopyWith<$Res> {
  _$SignupFormStateCopyWithImpl(this._value, this._then);

  final SignupFormState _value;
  // ignore: unused_field
  final $Res Function(SignupFormState) _then;
}

/// @nodoc
abstract class _$SignupFormStateCopyWith<$Res> {
  factory _$SignupFormStateCopyWith(
          _SignupFormState value, $Res Function(_SignupFormState) then) =
      __$SignupFormStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$SignupFormStateCopyWithImpl<$Res>
    extends _$SignupFormStateCopyWithImpl<$Res>
    implements _$SignupFormStateCopyWith<$Res> {
  __$SignupFormStateCopyWithImpl(
      _SignupFormState _value, $Res Function(_SignupFormState) _then)
      : super(_value, (v) => _then(v as _SignupFormState));

  @override
  _SignupFormState get _value => super._value as _SignupFormState;
}

/// @nodoc

class _$_SignupFormState implements _SignupFormState {
  const _$_SignupFormState();

  @override
  String toString() {
    return 'SignupFormState()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _SignupFormState);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _SignupFormState implements SignupFormState {
  const factory _SignupFormState() = _$_SignupFormState;
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cluster_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ClusterFailureTearOff {
  const _$ClusterFailureTearOff();

  Unexpected unexpected() {
    return const Unexpected();
  }
}

/// @nodoc
const $ClusterFailure = _$ClusterFailureTearOff();

/// @nodoc
mixin _$ClusterFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unexpected value) unexpected,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterFailureCopyWith<$Res> {
  factory $ClusterFailureCopyWith(
          ClusterFailure value, $Res Function(ClusterFailure) then) =
      _$ClusterFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ClusterFailureCopyWithImpl<$Res>
    implements $ClusterFailureCopyWith<$Res> {
  _$ClusterFailureCopyWithImpl(this._value, this._then);

  final ClusterFailure _value;
  // ignore: unused_field
  final $Res Function(ClusterFailure) _then;
}

/// @nodoc
abstract class $UnexpectedCopyWith<$Res> {
  factory $UnexpectedCopyWith(
          Unexpected value, $Res Function(Unexpected) then) =
      _$UnexpectedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnexpectedCopyWithImpl<$Res> extends _$ClusterFailureCopyWithImpl<$Res>
    implements $UnexpectedCopyWith<$Res> {
  _$UnexpectedCopyWithImpl(Unexpected _value, $Res Function(Unexpected) _then)
      : super(_value, (v) => _then(v as Unexpected));

  @override
  Unexpected get _value => super._value as Unexpected;
}

/// @nodoc

class _$Unexpected implements Unexpected {
  const _$Unexpected();

  @override
  String toString() {
    return 'ClusterFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() unexpected,
  }) {
    return unexpected();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Unexpected value) unexpected,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Unexpected value)? unexpected,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected implements ClusterFailure {
  const factory Unexpected() = _$Unexpected;
}

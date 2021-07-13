// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cluster_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ClusterListEventTearOff {
  const _$ClusterListEventTearOff();

  _FetchClusterListEvent watchAllStarted() {
    return const _FetchClusterListEvent();
  }

  _ClustersReceived clustersReceived(
      Either<ClusterFailure, List<Cluster>> failureOrClusters) {
    return _ClustersReceived(
      failureOrClusters,
    );
  }
}

/// @nodoc
const $ClusterListEvent = _$ClusterListEventTearOff();

/// @nodoc
mixin _$ClusterListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllStarted,
    required TResult Function(
            Either<ClusterFailure, List<Cluster>> failureOrClusters)
        clustersReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllStarted,
    TResult Function(Either<ClusterFailure, List<Cluster>> failureOrClusters)?
        clustersReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchClusterListEvent value) watchAllStarted,
    required TResult Function(_ClustersReceived value) clustersReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchClusterListEvent value)? watchAllStarted,
    TResult Function(_ClustersReceived value)? clustersReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterListEventCopyWith<$Res> {
  factory $ClusterListEventCopyWith(
          ClusterListEvent value, $Res Function(ClusterListEvent) then) =
      _$ClusterListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$ClusterListEventCopyWithImpl<$Res>
    implements $ClusterListEventCopyWith<$Res> {
  _$ClusterListEventCopyWithImpl(this._value, this._then);

  final ClusterListEvent _value;
  // ignore: unused_field
  final $Res Function(ClusterListEvent) _then;
}

/// @nodoc
abstract class _$FetchClusterListEventCopyWith<$Res> {
  factory _$FetchClusterListEventCopyWith(_FetchClusterListEvent value,
          $Res Function(_FetchClusterListEvent) then) =
      __$FetchClusterListEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$FetchClusterListEventCopyWithImpl<$Res>
    extends _$ClusterListEventCopyWithImpl<$Res>
    implements _$FetchClusterListEventCopyWith<$Res> {
  __$FetchClusterListEventCopyWithImpl(_FetchClusterListEvent _value,
      $Res Function(_FetchClusterListEvent) _then)
      : super(_value, (v) => _then(v as _FetchClusterListEvent));

  @override
  _FetchClusterListEvent get _value => super._value as _FetchClusterListEvent;
}

/// @nodoc

class _$_FetchClusterListEvent implements _FetchClusterListEvent {
  const _$_FetchClusterListEvent();

  @override
  String toString() {
    return 'ClusterListEvent.watchAllStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _FetchClusterListEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllStarted,
    required TResult Function(
            Either<ClusterFailure, List<Cluster>> failureOrClusters)
        clustersReceived,
  }) {
    return watchAllStarted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllStarted,
    TResult Function(Either<ClusterFailure, List<Cluster>> failureOrClusters)?
        clustersReceived,
    required TResult orElse(),
  }) {
    if (watchAllStarted != null) {
      return watchAllStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchClusterListEvent value) watchAllStarted,
    required TResult Function(_ClustersReceived value) clustersReceived,
  }) {
    return watchAllStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchClusterListEvent value)? watchAllStarted,
    TResult Function(_ClustersReceived value)? clustersReceived,
    required TResult orElse(),
  }) {
    if (watchAllStarted != null) {
      return watchAllStarted(this);
    }
    return orElse();
  }
}

abstract class _FetchClusterListEvent implements ClusterListEvent {
  const factory _FetchClusterListEvent() = _$_FetchClusterListEvent;
}

/// @nodoc
abstract class _$ClustersReceivedCopyWith<$Res> {
  factory _$ClustersReceivedCopyWith(
          _ClustersReceived value, $Res Function(_ClustersReceived) then) =
      __$ClustersReceivedCopyWithImpl<$Res>;
  $Res call({Either<ClusterFailure, List<Cluster>> failureOrClusters});
}

/// @nodoc
class __$ClustersReceivedCopyWithImpl<$Res>
    extends _$ClusterListEventCopyWithImpl<$Res>
    implements _$ClustersReceivedCopyWith<$Res> {
  __$ClustersReceivedCopyWithImpl(
      _ClustersReceived _value, $Res Function(_ClustersReceived) _then)
      : super(_value, (v) => _then(v as _ClustersReceived));

  @override
  _ClustersReceived get _value => super._value as _ClustersReceived;

  @override
  $Res call({
    Object? failureOrClusters = freezed,
  }) {
    return _then(_ClustersReceived(
      failureOrClusters == freezed
          ? _value.failureOrClusters
          : failureOrClusters // ignore: cast_nullable_to_non_nullable
              as Either<ClusterFailure, List<Cluster>>,
    ));
  }
}

/// @nodoc

class _$_ClustersReceived implements _ClustersReceived {
  const _$_ClustersReceived(this.failureOrClusters);

  @override
  final Either<ClusterFailure, List<Cluster>> failureOrClusters;

  @override
  String toString() {
    return 'ClusterListEvent.clustersReceived(failureOrClusters: $failureOrClusters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ClustersReceived &&
            (identical(other.failureOrClusters, failureOrClusters) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrClusters, failureOrClusters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrClusters);

  @JsonKey(ignore: true)
  @override
  _$ClustersReceivedCopyWith<_ClustersReceived> get copyWith =>
      __$ClustersReceivedCopyWithImpl<_ClustersReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAllStarted,
    required TResult Function(
            Either<ClusterFailure, List<Cluster>> failureOrClusters)
        clustersReceived,
  }) {
    return clustersReceived(failureOrClusters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAllStarted,
    TResult Function(Either<ClusterFailure, List<Cluster>> failureOrClusters)?
        clustersReceived,
    required TResult orElse(),
  }) {
    if (clustersReceived != null) {
      return clustersReceived(failureOrClusters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_FetchClusterListEvent value) watchAllStarted,
    required TResult Function(_ClustersReceived value) clustersReceived,
  }) {
    return clustersReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_FetchClusterListEvent value)? watchAllStarted,
    TResult Function(_ClustersReceived value)? clustersReceived,
    required TResult orElse(),
  }) {
    if (clustersReceived != null) {
      return clustersReceived(this);
    }
    return orElse();
  }
}

abstract class _ClustersReceived implements ClusterListEvent {
  const factory _ClustersReceived(
          Either<ClusterFailure, List<Cluster>> failureOrClusters) =
      _$_ClustersReceived;

  Either<ClusterFailure, List<Cluster>> get failureOrClusters =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$ClustersReceivedCopyWith<_ClustersReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$ClusterListStateTearOff {
  const _$ClusterListStateTearOff();

  Initial initial() {
    return const Initial();
  }

  DataTransferInProgress loadInProgress() {
    return const DataTransferInProgress();
  }

  LoadSuccess loadSuccess(List<Cluster> clusters) {
    return LoadSuccess(
      clusters,
    );
  }

  LoadFailure loadFailure(ClusterFailure clusterFailure) {
    return LoadFailure(
      clusterFailure,
    );
  }
}

/// @nodoc
const $ClusterListState = _$ClusterListStateTearOff();

/// @nodoc
mixin _$ClusterListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Cluster> clusters) loadSuccess,
    required TResult Function(ClusterFailure clusterFailure) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Cluster> clusters)? loadSuccess,
    TResult Function(ClusterFailure clusterFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterListStateCopyWith<$Res> {
  factory $ClusterListStateCopyWith(
          ClusterListState value, $Res Function(ClusterListState) then) =
      _$ClusterListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ClusterListStateCopyWithImpl<$Res>
    implements $ClusterListStateCopyWith<$Res> {
  _$ClusterListStateCopyWithImpl(this._value, this._then);

  final ClusterListState _value;
  // ignore: unused_field
  final $Res Function(ClusterListState) _then;
}

/// @nodoc
abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> extends _$ClusterListStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

/// @nodoc

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'ClusterListState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Cluster> clusters) loadSuccess,
    required TResult Function(ClusterFailure clusterFailure) loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Cluster> clusters)? loadSuccess,
    TResult Function(ClusterFailure clusterFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements ClusterListState {
  const factory Initial() = _$Initial;
}

/// @nodoc
abstract class $DataTransferInProgressCopyWith<$Res> {
  factory $DataTransferInProgressCopyWith(DataTransferInProgress value,
          $Res Function(DataTransferInProgress) then) =
      _$DataTransferInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class _$DataTransferInProgressCopyWithImpl<$Res>
    extends _$ClusterListStateCopyWithImpl<$Res>
    implements $DataTransferInProgressCopyWith<$Res> {
  _$DataTransferInProgressCopyWithImpl(DataTransferInProgress _value,
      $Res Function(DataTransferInProgress) _then)
      : super(_value, (v) => _then(v as DataTransferInProgress));

  @override
  DataTransferInProgress get _value => super._value as DataTransferInProgress;
}

/// @nodoc

class _$DataTransferInProgress implements DataTransferInProgress {
  const _$DataTransferInProgress();

  @override
  String toString() {
    return 'ClusterListState.loadInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DataTransferInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Cluster> clusters) loadSuccess,
    required TResult Function(ClusterFailure clusterFailure) loadFailure,
  }) {
    return loadInProgress();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Cluster> clusters)? loadSuccess,
    TResult Function(ClusterFailure clusterFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return loadInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadInProgress != null) {
      return loadInProgress(this);
    }
    return orElse();
  }
}

abstract class DataTransferInProgress implements ClusterListState {
  const factory DataTransferInProgress() = _$DataTransferInProgress;
}

/// @nodoc
abstract class $LoadSuccessCopyWith<$Res> {
  factory $LoadSuccessCopyWith(
          LoadSuccess value, $Res Function(LoadSuccess) then) =
      _$LoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Cluster> clusters});
}

/// @nodoc
class _$LoadSuccessCopyWithImpl<$Res>
    extends _$ClusterListStateCopyWithImpl<$Res>
    implements $LoadSuccessCopyWith<$Res> {
  _$LoadSuccessCopyWithImpl(
      LoadSuccess _value, $Res Function(LoadSuccess) _then)
      : super(_value, (v) => _then(v as LoadSuccess));

  @override
  LoadSuccess get _value => super._value as LoadSuccess;

  @override
  $Res call({
    Object? clusters = freezed,
  }) {
    return _then(LoadSuccess(
      clusters == freezed
          ? _value.clusters
          : clusters // ignore: cast_nullable_to_non_nullable
              as List<Cluster>,
    ));
  }
}

/// @nodoc

class _$LoadSuccess implements LoadSuccess {
  const _$LoadSuccess(this.clusters);

  @override
  final List<Cluster> clusters;

  @override
  String toString() {
    return 'ClusterListState.loadSuccess(clusters: $clusters)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadSuccess &&
            (identical(other.clusters, clusters) ||
                const DeepCollectionEquality()
                    .equals(other.clusters, clusters)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(clusters);

  @JsonKey(ignore: true)
  @override
  $LoadSuccessCopyWith<LoadSuccess> get copyWith =>
      _$LoadSuccessCopyWithImpl<LoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Cluster> clusters) loadSuccess,
    required TResult Function(ClusterFailure clusterFailure) loadFailure,
  }) {
    return loadSuccess(clusters);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Cluster> clusters)? loadSuccess,
    TResult Function(ClusterFailure clusterFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(clusters);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class LoadSuccess implements ClusterListState {
  const factory LoadSuccess(List<Cluster> clusters) = _$LoadSuccess;

  List<Cluster> get clusters => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadSuccessCopyWith<LoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadFailureCopyWith<$Res> {
  factory $LoadFailureCopyWith(
          LoadFailure value, $Res Function(LoadFailure) then) =
      _$LoadFailureCopyWithImpl<$Res>;
  $Res call({ClusterFailure clusterFailure});

  $ClusterFailureCopyWith<$Res> get clusterFailure;
}

/// @nodoc
class _$LoadFailureCopyWithImpl<$Res>
    extends _$ClusterListStateCopyWithImpl<$Res>
    implements $LoadFailureCopyWith<$Res> {
  _$LoadFailureCopyWithImpl(
      LoadFailure _value, $Res Function(LoadFailure) _then)
      : super(_value, (v) => _then(v as LoadFailure));

  @override
  LoadFailure get _value => super._value as LoadFailure;

  @override
  $Res call({
    Object? clusterFailure = freezed,
  }) {
    return _then(LoadFailure(
      clusterFailure == freezed
          ? _value.clusterFailure
          : clusterFailure // ignore: cast_nullable_to_non_nullable
              as ClusterFailure,
    ));
  }

  @override
  $ClusterFailureCopyWith<$Res> get clusterFailure {
    return $ClusterFailureCopyWith<$Res>(_value.clusterFailure, (value) {
      return _then(_value.copyWith(clusterFailure: value));
    });
  }
}

/// @nodoc

class _$LoadFailure implements LoadFailure {
  const _$LoadFailure(this.clusterFailure);

  @override
  final ClusterFailure clusterFailure;

  @override
  String toString() {
    return 'ClusterListState.loadFailure(clusterFailure: $clusterFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadFailure &&
            (identical(other.clusterFailure, clusterFailure) ||
                const DeepCollectionEquality()
                    .equals(other.clusterFailure, clusterFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(clusterFailure);

  @JsonKey(ignore: true)
  @override
  $LoadFailureCopyWith<LoadFailure> get copyWith =>
      _$LoadFailureCopyWithImpl<LoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loadInProgress,
    required TResult Function(List<Cluster> clusters) loadSuccess,
    required TResult Function(ClusterFailure clusterFailure) loadFailure,
  }) {
    return loadFailure(clusterFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loadInProgress,
    TResult Function(List<Cluster> clusters)? loadSuccess,
    TResult Function(ClusterFailure clusterFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(clusterFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(DataTransferInProgress value) loadInProgress,
    required TResult Function(LoadSuccess value) loadSuccess,
    required TResult Function(LoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(DataTransferInProgress value)? loadInProgress,
    TResult Function(LoadSuccess value)? loadSuccess,
    TResult Function(LoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class LoadFailure implements ClusterListState {
  const factory LoadFailure(ClusterFailure clusterFailure) = _$LoadFailure;

  ClusterFailure get clusterFailure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadFailureCopyWith<LoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

import 'package:freezed_annotation/freezed_annotation.dart';
part 'cluster_failure.freezed.dart';

@freezed
abstract class ClusterFailure with _$ClusterFailure {
  const factory ClusterFailure.unexpected() = Unexpected;
}

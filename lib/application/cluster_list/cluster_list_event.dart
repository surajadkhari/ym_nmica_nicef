part of 'cluster_list_bloc.dart';

@freezed
class ClusterListEvent with _$ClusterListEvent {
  const factory ClusterListEvent.watchAllStarted() = _FetchClusterListEvent;
  const factory ClusterListEvent.clustersReceived(
          Either<ClusterFailure, List<Cluster>> failureOrClusters) =
      _ClustersReceived;
}

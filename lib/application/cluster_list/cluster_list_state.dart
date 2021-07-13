part of 'cluster_list_bloc.dart';

@freezed
class ClusterListState with _$ClusterListState {
  const factory ClusterListState.initial() = Initial;
  const factory ClusterListState.loadInProgress() = DataTransferInProgress;
  const factory ClusterListState.loadSuccess(List<Cluster> clusters) =
      LoadSuccess;
  const factory ClusterListState.loadFailure(ClusterFailure clusterFailure) =
      LoadFailure;
}

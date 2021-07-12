part of 'clusterl_list_bloc.dart';

@freezed
class ClusterlListState with _$ClusterlListState {
  const factory ClusterlListState.initial() = Initial;
  const factory ClusterlListState.loadInProgress() = DataTransferInProgress;
  const factory ClusterlListState.loadSuccess(KtList<Cluster> clusters) =
      LoadSuccess;
  const factory ClusterlListState.loadFailure(ClusterFailure clusterFailure) =
      LoadFailure;
}

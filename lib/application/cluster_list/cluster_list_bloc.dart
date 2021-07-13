import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:unicef/domain/cluster/cluster_failure.dart';
import 'package:unicef/infrastructure/cluster/entities/cluster.dart';
import 'package:unicef/infrastructure/cluster/repositories/cluster_repository.dart';

part 'cluster_list_bloc.freezed.dart';
part 'cluster_list_event.dart';
part 'cluster_list_state.dart';

class ClusterListBloc extends Bloc<ClusterListEvent, ClusterListState> {
  ClusterRepository repository;
  ClusterListBloc(
    this.repository,
  ) : super(Initial());

  @override
  Stream<ClusterListState> mapEventToState(
    ClusterListEvent event,
  ) async* {
    if (event is _FetchClusterListEvent) {
      yield DataTransferInProgress();
      try {
        List<Cluster> clusters = await repository.fetchClusters();
        yield LoadSuccess(clusters);
      } catch (e) {
        yield ClusterListState.loadFailure(ClusterFailure.unexpected());
      }
    }
  }
}

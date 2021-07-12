import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import 'package:unicef/domain/cluster/cluster_failure.dart';
import 'package:unicef/infrastructure/cluster/entities/cluster.dart';

part 'clusterl_list_event.dart';
part 'clusterl_list_state.dart';
part 'clusterl_list_bloc.freezed.dart';

class ClusterlListBloc extends Bloc<ClusterlListEvent, ClusterlListState> {
  ClusterlListBloc() : super(const Initial());

  @override
  Stream<ClusterlListState> mapEventToState(
    ClusterlListEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}

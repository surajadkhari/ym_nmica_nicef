import 'package:equatable/equatable.dart';

abstract class ClusterState extends Equatable {}

class ClusterInitialState extends ClusterState {
  @override
  List<Object?> get props => [];
}

class ClusterLoadingState extends ClusterState {
  @override
  List<Object?> get props => [];
}

class ClusterSuccessState extends ClusterState {
  @override
  List<Object?> get props => [];
}

class ClusterErrorState extends ClusterState {
  final String message;

  ClusterErrorState(this.message);

  @override
  List<Object?> get props => [];
}

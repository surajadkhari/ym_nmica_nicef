// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:unicef/cluster/infrastructure/repositories/cluster_repository.dart';
// import 'package:unicef/cluster/presentation/home/state_management/cluster_state.dart';

// class ClusterCubit extends Cubit<ClusterState> {
//   ClusterCubit(initialState) : super(ClusterInitialState());

//   getClusters(ClusterRepository clusterRepository) async {
//     _startLoading();
//     final result = await clusterRepository.fetchClusters();
//   }

//   void _startLoading() {
//     emit(ClusterLoadingState());
//   }

//   void _setResultOfClusterState() {}
// }

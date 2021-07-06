import 'package:unicef/cluster/domain/entities/cluster.dart';
import 'package:unicef/cluster/domain/logics/cluster_logic.dart';
import 'package:unicef/cluster/infrastructure/repositories/cluster_repository.dart';

class ClusterFacadeService with ClusterLogic {
  const ClusterFacadeService({
    required this.repository,
  });

  final ClusterRepository repository;

  Future<List<Cluster>> fetchClusters() async {
    return repository.fetchClusters();
  }

  Future<Cluster> getCluster(String id) async {
    return repository.getCluster(id);
  }
}

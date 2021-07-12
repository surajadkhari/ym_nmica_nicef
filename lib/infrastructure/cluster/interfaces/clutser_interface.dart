import 'package:unicef/infrastructure/cluster/entities/cluster.dart';

abstract class ClusterInterface {
  Future<List<Cluster>> fetchClusters();
  Future<Cluster> getCluster(String id);
}

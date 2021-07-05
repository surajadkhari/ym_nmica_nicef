import 'package:unicef/cluster/domain/entities/cluster.dart';

abstract class ClusterInterface {
  Future<List<Cluster>> fetchClusters();
  Future<Cluster> getCluster(String id);
}

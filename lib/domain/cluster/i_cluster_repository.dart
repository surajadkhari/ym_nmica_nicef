import 'package:unicef/infrastructure/cluster/entities/cluster.dart';

abstract class IClusterRepository {
  Future<List<Cluster>> fetchClusters();
  Future<Cluster> getCluster(String id);
}

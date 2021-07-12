import 'package:unicef/infrastructure/cluster/entities/cluster.dart';

class ClusterLocalDataProvider {
  Future<List<Cluster>>? fetchClusters() {
    return null;
  }

  Future<Cluster>? getCluster(String? id) {
    //todo: cache model
    return null;
  }

  Future<bool>? cacheCluster(Cluster cluster) {
    //todo: cache model
    return null;
  }

  Future<bool>? cacheClusters(List<Cluster> cluster) {
    //todo: cache model
    return null;
  }
}

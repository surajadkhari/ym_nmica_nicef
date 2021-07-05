import 'package:unicef/cluster/infrastructure/models/cluster_model.dart';

class ClusterLocalDataProvider {
  Future<List<ClusterModel>>? fetchCluster() {
    return null;
  }

  Future<ClusterModel>? getCluster(String? id) {
    //todo: cache model
    return null;
  }

  Future<bool>? cacheCluster(ClusterModel? cluster) {
    //todo: cache model
    return null;
  }

  Future<bool>? cacheClusters(List<ClusterModel> cluster) {
    //todo: cache model
    return null;
  }
}

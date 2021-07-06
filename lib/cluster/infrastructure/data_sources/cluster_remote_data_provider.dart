import 'package:unicef/api/api.dart';
import 'package:unicef/cluster/infrastructure/models/cluster_model.dart';

class ClusterRemoteDataProvider {
  Api? _api;

  ClusterRemoteDataProvider() {
    _api = Api();
  }

  Future<List<ClusterModel>>? fetchClusters() async {
    return await _api!.httpGet('clusters');
  }

  Future<ClusterModel>? getCluster(String? id) {
    return null;
  }
}

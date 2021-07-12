import 'dart:convert';

import 'package:unicef/api/api.dart';
import 'package:unicef/infrastructure/cluster/entities/cluster.dart';

class ClusterRemoteDataProvider {
  late Api? _api;

  ClusterRemoteDataProvider() {
    _api = Api();
  }

  Future<List<Cluster>> fetchClusters() async {
    final response = _api!.httpGet('indicator-cluster');
    if (response.statusCode == 200) {
      var data = json.decode(response.body);

      List<Cluster> clusters = Cluster.fromJson(data) as List<Cluster>;
      return clusters;
    } else {
      throw Exception('Failed');
    }
  }

  Future<Cluster>? getCluster(String? id) {
    return null;
  }
}

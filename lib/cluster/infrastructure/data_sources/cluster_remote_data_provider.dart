import 'dart:convert';
import 'package:http/http.dart';
import 'package:unicef/api/api.dart';
import 'package:unicef/cluster/infrastructure/models/cluster_model.dart';
import 'package:unicef/common/exceptions/exceptions.dart';

class ClusterRemoteDataProvider {
  Api? _api;

  ClusterRemoteDataProvider() {
    _api = Api();
  }

  Future<List<ClusterModel>> fetchClusters() async {
    Response response = await _api!.httpGet('allclutsers');
    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      print(data);
      return data.map((cluster) => ClusterModel.fromJson(cluster)).toList();
    } else {
      return ServerException()();
    }
  }

  Future<ClusterModel>? getCluster(String? id) {
    return null;
  }
}

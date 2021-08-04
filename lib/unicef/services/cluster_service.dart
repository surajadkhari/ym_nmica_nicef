import 'dart:convert';

import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/repository/repository.dart';

class ClusterService {
  Api? _api;
  Repository? _repository;

  ClusterService() {
    _api = Api();
    _repository = Repository();
  }

  Future saveClusters() async {
    final res = await _api!.httpGet('indicator-cluster');

    List decodedJson = json.decode(res.body);
    decodedJson.forEach((element) async {
      await _repository!
          .save('clusters', {"name": element['name'], 'id': element['id']});
    });
  }

  Future<List> getClusters() async {
    var res = await _repository!.getData('clusters');

    return res;
  }
}

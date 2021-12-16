import 'dart:convert';

import 'package:http/http.dart';
import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/repository/repository.dart';
import 'package:unicef/unicef/widgets/CheckBoxState.dart';

class IndicatorServices {
  Api? _api;
  Repository? _repository;

  IndicatorServices() {
    _api = Api();
    _repository = Repository();
  }

  Future saveIndicators() async {
    Response response = await _api!.httpGet('indicators');

    if (response.statusCode == 200) {
      List decodedJson = json.decode(response.body);
      decodedJson.forEach((element) async {
        await _repository!.save('indicators', {
          'id': element['id'],
          "cluster_id": element['indicator_cluster_id'],
          "name": element['name'],
          "chart_type": element['chart_type'],
          "description": element['description']
        });
      });
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List<CheckBoxState>> fetchIndicators(int id) {
    return _repository!.getDataById('indicators', 'cluster_id', id);
  }

  fetchAllIndicators(String name) {
    var x = _repository!.getAll('indicators', name);

    return x;
  }
}

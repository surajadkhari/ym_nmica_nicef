import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:http/http.dart';
import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/models/chart.dart';
import 'package:unicef/unicef/repository/repository.dart';

class ChartService {
  Api? _api;
  Repository? _repository;

  ChartService() {
    _api = Api();
    _repository = Repository();
  }

  Future<List<Chart>>? fetchCharts(List<int> ids) async {
    Map<String, dynamic> data = {"ids": ids};
    var isCacheExist = await APICacheManager().isAPICacheKeyExist('chart$ids');
    print(isCacheExist);

    if (!isCacheExist) {
      Response response = await _api!.httpPost('indicator/charts', data);

      APICacheDBModel cacheDBModel =
          new APICacheDBModel(key: 'chart$ids', syncData: response.body);

      await APICacheManager().addCacheData(cacheDBModel);
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);

        var mapped =
            jsonResponse.map((chart) => new Chart.fromJson(chart)).toList();
        return mapped;
      } else {
        throw Exception('Unexpected error occured!');
      }
    } else {
      var cachedData = await APICacheManager().getCacheData('indicator$ids');

      List jsonResponse = json.decode(cachedData.syncData);

      return jsonResponse.map((chart) => new Chart.fromJson(chart)).toList();
    }
  }

  Future? saveCharts() async {
    Response response = await _api!.httpGet('charts');

    if (response.statusCode == 200) {
      List decodedJson = json.decode(response.body);
      decodedJson.forEach((element) async {
        await _repository!.save('charts', {
          'id': element['id'],
          'indicator_id': element['indicator_id'],
          'label': element['label'],
          'chart_type': element['indicator']['chart_type'],
          'name': element['indicator']['name'],
          'description': element['indicator']['description'],
          "np": element['np'],
          "p1": element['p1'],
          "p2": element['p2'],
          "p3": element['p3'],
          "p4": element['p4'],
          "p5": element['p5'],
          "p6": element['p6'],
          "p7": element['p7'],
        });
      });
    } else {
      throw Exception('Unexpected error occured!');
    }
  }

  Future<List> getCharts(List<int> ids) async {
    var res = await _repository!.getCharts('charts', 'indicator_id', ids);
    return res;
  }
}

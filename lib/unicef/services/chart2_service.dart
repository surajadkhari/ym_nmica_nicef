import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:http/http.dart';
import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/models/chart.dart';

class Chart2Service {
  Api? _api;

  Chart2Service() {
    _api = Api();
  }

  Future<List<Chart>>? fetchCharts(List<int> ids) async {
    Map<String, dynamic> data = {"ids": ids};

    var isCacheExist = await APICacheManager().isAPICacheKeyExist('chart$ids');

    if (!isCacheExist) {
      Response response = await _api!.httpPost('indicator/charts', data);

      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        APICacheDBModel cacheDBModel =
            new APICacheDBModel(key: 'chart$ids', syncData: response.body);

        await APICacheManager().addCacheData(cacheDBModel);
        var mapped =
            jsonResponse.map((chart) => new Chart.fromJson(chart)).toList();
        return mapped;
      } else {
        throw Exception('Unexpected error occured!');
      }
    } else {
      var cachedData = await APICacheManager().getCacheData('chart$ids');

      List jsonResponse = json.decode(cachedData.syncData);

      return jsonResponse.map((chart) => new Chart.fromJson(chart)).toList();
    }
  }

  cacheData() async {
    Response response = await _api!.httpGet('clusters-with-indicators');
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      jsonResponse.forEach((element) async {
        var ids = [];

        element['indicators'].forEach((e) async {
          ids.add(e['id ']);
        });

        print("Ids:$ids");

        Map<String, dynamic> data = {"ids": ids};

        Response responses = await _api!.httpPost('indicator/charts', data);

        if (responses.statusCode == 200) {
          APICacheDBModel cacheDBModel =
              new APICacheDBModel(key: 'chart$ids', syncData: responses.body);

          await APICacheManager().addCacheData(cacheDBModel);
        } else {
          throw Exception('Unexpected error occured!');
        }
      });
    }
  }
}

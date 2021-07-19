import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:http/http.dart';
import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/models/chart.dart';

class ChartService {
  Api? _api;

  ChartService() {
    _api = Api();
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
      print(cacheDBModel);
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);

        var mapped =
            jsonResponse.map((chart) => new Chart.fromJson(chart)).toList();
        print("Mapped: $mapped");
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
}

import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:http/http.dart';
import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/widgets/CheckBoxState.dart';

class IndicatorServices {
  Api? _api;

  IndicatorServices() {
    _api = Api();
  }

  Future<List<CheckBoxState>>? fetchCheckBoxState(int id) async {
    var isCacheExist =
        await APICacheManager().isAPICacheKeyExist('indicator$id');
    print(isCacheExist);
    if (!isCacheExist) {
      Response response = await _api!.httpGet('indicator-cluster/$id}');
      APICacheDBModel cacheDBModel =
          new APICacheDBModel(key: 'indicator$id', syncData: response.body);
      await APICacheManager().addCacheData(cacheDBModel);
      if (response.statusCode == 200) {
        Map<String, dynamic> jsonResponse = json.decode(response.body);
        List<dynamic> data = jsonResponse["data"];
        return data
            .map((checkBoxState) => new CheckBoxState.fromJson(checkBoxState))
            .toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } else {
      print("Cache hit");
      var cachedData = await APICacheManager().getCacheData('indicator$id');
      Map<String, dynamic> jsonResponse = json.decode(cachedData.syncData);
      List<dynamic> data = jsonResponse["data"];
      return data
          .map((checkBoxState) => new CheckBoxState.fromJson(checkBoxState))
          .toList();
    }
  }
}

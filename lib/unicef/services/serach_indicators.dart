import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:http/http.dart';
import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/models/Indicators.dart';
import 'package:unicef/unicef/models/chart.dart';

class SearchIndicator {
  Api? _api;

  SearchIndicator() {
    _api = Api();
  }

  Future<List<Indicator>>? getSearch({required String name}) async {
    var isCacheExist =
        await APICacheManager().isAPICacheKeyExist(name.toString());

    if (!isCacheExist) {
      print("Api hit");

      final Response response = await _api!.httpGet('indicator/search/$name');
      if (response.statusCode == 200) {
        List jsonResponse = json.decode(response.body);
        return jsonResponse
            .map((checkBoxState) => new Indicator.fromJson(checkBoxState))
            .toList();
      } else {
        throw Exception('Unexpected error occured!');
      }
    } else {
      print("Cache hit");
      var cachedData = await APICacheManager().getCacheData(name);
      Map<String, dynamic> jsonResponse = json.decode(cachedData.syncData);
      List<dynamic> data = jsonResponse["data"];
      return data
          .map((checkBoxState) => new Indicator.fromJson(checkBoxState))
          .toList();
    }
  }

  Future<Chart>? getIndividual({required int id}) async {
    final Response response = await _api!.httpGet('indicator/$id');

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      var jsonResponses = new Chart.fromJson(jsonResponse);
      return jsonResponses;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}

import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:excel/excel.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart';
import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/models/chart.dart';
import 'package:unicef/unicef/repository/repository.dart';

class Chart2Service {
  Api? _api;
  Repository? _repository;

  Chart2Service() {
    _api = Api();
    _repository = Repository();
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
        print(cacheDBModel);
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

  List da = [];
  Future<List<Chart>>? fetchNewCharts(List<int> ids) async {
    // List<Chart> res =
    //     await _repository!.getDataByIds('charts', "indicator_id", ids);

    ids.forEach((element) async {
      String data = "charts" + element.toString();
      // var box = Hive.box(data);
      // print(box);
      // var name = box.get('data');
      // da.add(name);
      var cachedData = await APICacheManager().getCacheData(data);

      // List jsonResponse = json.decode(cachedData.syncData);
      da.add(json.decode(cachedData.syncData));
    });

    return da.map((chart) => new Chart.fromJson(chart)).toList();

    // return da.map((chart) => new Chart.fromJson(chart)).toList();
  }

  saveChartHive() async {
    final res = await _api!.httpGet('indicators/charts');

    List decodedJson = json.decode(res.body);

    decodedJson.forEach((element) async {
      String data = "charts" + element['id'].toString();
      // await Hive.openBox(data);
      // var box = Hive.box(data);
      // box.put('data', element);

      APICacheDBModel cacheDBModel =
          new APICacheDBModel(key: data, syncData: element);

      await APICacheManager().addCacheData(cacheDBModel);
    });
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

  saveCharts() async {
    final res = await _api!.httpGet('charts');

    List decodedJson = json.decode(res.body);

    decodedJson.forEach((element) async {
      await _repository!.save('charts', {
        'id': element['id'],
        "indicator_id": element['indicator_id'],
        "label": element['label'],
        "np": element['np'],
        "p1": element['p1'],
        "p2": element['p2'],
        "p3": element['np'],
        "p4": element['p4'],
        "p5": element['p5'],
        "p6": element['p6'],
        "p7": element['p7'],
        "chart_type": element['indicator']['chart_type'],
        "name": element['indicator']['name'],
        "description": element['indicator']['description'],
      });
    });
  }
}


    // "CREATE TABLE charts(id INTEGER PRIMARY KEY,indicator_id INTEGER,label TEXT,
    // np DOUBLE,p1 DOUBLE,p2 DOUBLE,p3 DOUBLE,p4 DOUBLE,p5 DOUBLE,p6 DOUBLE,p7 DOUBLE,chart_type TEXT,name TEXT,description TEXT)",
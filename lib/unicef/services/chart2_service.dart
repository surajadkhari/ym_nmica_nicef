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

  Future<List<Chart>>? fetchNewCharts(List<int> ids) async {
    List dasss = [];

    for (var i = 0; i < ids.length; i++) {
      String data = "charts" + ids[i].toString();

      var cachedData = await APICacheManager().getCacheData(data);

      final jsonResponse = json.decode(cachedData.syncData);

      dasss.add(jsonResponse);
    }

    var xaa = dasss.map((chart) => new Chart.fromJson(chart)).toList();

    return xaa;

    // return da.map((chart) => new Chart.fromJson(chart)).toList();
  }

  saveChartHive() async {
    final res = await _api!.httpGet('indicators/charts');

    List decodedJson = json.decode(res.body);

    decodedJson.forEach((element) async {
      String data = "charts" + element['id'].toString();
      List xx = [];
      List tt = element['charts'];

      tt.forEach((element) {
        var label = element['label'];
        var Nepal = element['Nepal'];
        var Province1 = element['Province 1'];
        var Province2 = element['Province 2'];
        var Bagmati = element['Bagmati'];
        var Gandaki = element['Gandaki'];
        var Lumbini = element['Lumbini'];
        var Karnali = element['Karnali'];
        var Sudurpashchim = element['Sudurpashchim'];

        String cc =
            '{"label":"$label","Nepal":"$Nepal","Province 1":"$Province1" ,"Province 2":"$Province2","Bagmati":"$Bagmati","Gandaki":"$Gandaki","Lumbini":"$Lumbini","Karnali":"$Karnali","Sudurpashchim":"$Sudurpashchim"}';
        xx.add(cc);
      });

      var id = element["id"];
      var indicatorClusterId = element["indicator_cluster_id"];
      var indicatorCode = element["indicator_code"];
      var chartType = element['chart_type'];
      var name = element['name'];
      var description = element['description'];
      var module = element['module'];
      var status = element['status'];
      var displayOrder = element['display_order'];
      var charts = xx;
      String d =
          '{"id":$id,"indicator_cluster_id":$indicatorClusterId,"indicator_code":"$indicatorCode","chart_type":"$chartType","name":"$name","description":"$description","module":"$module","status":"$status","display_order":$displayOrder,"charts":$charts}';

      APICacheDBModel cacheDBModel =
          new APICacheDBModel(key: data, syncData: d);

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
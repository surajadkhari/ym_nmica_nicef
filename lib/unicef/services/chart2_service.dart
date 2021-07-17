import 'dart:convert';

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

    print("up..........................");
    Response response = await _api!.httpPost('indicator/charts', data);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      var mapped =
          jsonResponse.map((chart) => new Chart.fromJson(chart)).toList();
      print("Mapped: $mapped");
      return mapped;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}

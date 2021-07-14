import 'dart:convert';

import 'package:http/http.dart';
import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/widgets/CheckBoxState.dart';

class IndicatorServices {
  Api? _api;

  IndicatorServices() {
    _api = Api();
  }

  Future<List<CheckBoxState>>? fetchCheckBoxState() async {
    Response response = await _api!.httpGet('indicator-cluster/1');
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse["data"];
      print(data);
      return data
          .map((checkBoxState) => new CheckBoxState.fromJson(checkBoxState))
          .toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}

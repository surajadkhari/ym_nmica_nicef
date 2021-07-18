import 'dart:convert';

import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/widgets/CheckBoxState.dart';

class SearchIndicator {
  Api? _api;

  SearchIndicator() {
    _api = Api();
  }

  Future<List<CheckBoxState>>? getSearch(String name) async {
    final response = await _api!.httpGet('/indicator/search/$name');
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = json.decode(response.body);
      List<dynamic> data = jsonResponse as List;
      return data
          .map((checkBoxState) => new CheckBoxState.fromJson(checkBoxState))
          .toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}

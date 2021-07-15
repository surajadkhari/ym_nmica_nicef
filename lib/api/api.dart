import 'dart:convert';

import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl = 'http://teamym.com/projects/unicef/public/api';

  // ignore: type_annotate_public_apis

  httpGet(dynamic api) async {
    // ignore: prefer_interpolation_to_compose_strings
    return await http.get(Uri.parse(_baseUrl + '/' + api), headers: {
      "Content-type": "application/json",
      "Accept": "application/json",
    });
  }

  httpPost(dynamic api, Map<String, dynamic> data) async {
    // ignore: prefer_interpolation_to_compose_strings
    var resopones = await http.post(Uri.parse(_baseUrl + '/' + api),
        body: json.encode(data),
        headers: {
          "Content-type": "application/json",
          "Accept": "application/json",
        });
    return resopones;
  }
}

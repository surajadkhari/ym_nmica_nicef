import 'package:http/http.dart' as http;

class Api {
  final String _baseUrl = 'https://60e2ca9a9103bd0017b47567.mockapi.io/api';

  // ignore: type_annotate_public_apis

  httpGet(String api) async {
    // ignore: prefer_interpolation_to_compose_strings
    return await http.get(Uri.parse(_baseUrl + '/' + api), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
  }
}

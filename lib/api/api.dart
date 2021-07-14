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
}

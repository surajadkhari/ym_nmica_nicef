import 'package:http/http.dart' as http;

class Api {
  String _baseUrl = 'http://localhost:3000';

  httpGet(String api) async {
    return await http.get(Uri.parse(_baseUrl + '/' + api));
  }
}

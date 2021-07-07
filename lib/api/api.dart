import 'package:http/http.dart' as http;

class Api {
  String _baseUrl = 'http://192.168.0.104:3000';

  httpGet(String api) async {
    return await http.get(Uri.parse(_baseUrl + '/' + api), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
  }
}

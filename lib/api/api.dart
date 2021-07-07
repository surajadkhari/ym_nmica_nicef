import 'package:http/http.dart' as http;

class Api {
  String _baseUrl = 'https://jsonplaceholder.typicode.com';

  httpGet(String api) async {
    return await http.get(Uri.parse(_baseUrl + '/' + api), headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
    });
  }
}

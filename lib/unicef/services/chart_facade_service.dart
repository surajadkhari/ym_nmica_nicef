import 'package:unicef/api/api.dart';

class ChartFacadeService {
  Api? _api;

  ChartFacadeService() {
    _api = Api();
  }
  fetchCharts(List<int> ids) async {
    Map<String, dynamic> idFromIndicator = {"ids": ids};
    return await _api!.httpPost('indicator/charts', idFromIndicator);
    // print(response.body);
    // if (response.statusCode == 200) {
    //   final decodedJson = jsonDecode(response.body) as Map;
    //   var fetchedCharts = decodedJson['charts'] as Map;
    //   print(decodedJson['charts']);
    //   for (final chart in fetchedCharts.keys) {
    //     final value = decodedJson['charts'];
    //     print('$chart, $value');
    //   }
    //   // return fetchedCharts.;
    // } else {
    //   throw Exception('Unexpected error occured!');
    // }
  }
}

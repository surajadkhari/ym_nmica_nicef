import 'package:unicef/api/api.dart';

class AllIndicatorService {
  Api? _api;

  AllIndicatorService() {
    _api = Api();
  }

  getAllIndicators() async {
    return await _api!.httpGet('indicators');
  }

  getAllCharts() async {
    return await _api!.httpGet('indicators/charts');
  }
}

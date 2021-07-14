import 'package:unicef/api/api.dart';

class ClusterService {
  Api? _api;

  ClusterService() {
    _api = Api();
  }

  getClusters() async {
    return await _api!.httpGet('indicator-cluster');
  }
}

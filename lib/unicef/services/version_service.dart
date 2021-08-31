import 'package:unicef/api/api.dart';

class VersionService {
  Api? _api;

  VersionService() {
    _api = Api();
  }

  getVersion() async {
    return await _api!.httpGet('version');
  }
}

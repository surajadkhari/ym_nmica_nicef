import 'package:unicef/api/api.dart';

class InfomationService {
  Api? _api;

  InfomationService() {
    _api = Api();
  }

  getIntroduction() async {
    return await _api!.httpGet('introduction');
  }
   getSurvey() async {
    return await _api!.httpGet('survey');
  }
   getDemography() async {
    return await _api!.httpGet('demography');
  }
}

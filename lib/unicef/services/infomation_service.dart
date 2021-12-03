import 'dart:convert';

import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/repository/repository.dart';

class InfomationService {
  Api? _api;
  Repository? _repository;

  InfomationService() {
    _api = Api();
    _repository = Repository();
  }

  Future saveIntroduction() async {
    final res = await _api!.httpGet('introduction');

    var decodedJson = json.decode(res.body)['introduction'];

    await _repository!.save('introduction', {"introduction": decodedJson});
  }

// New

  Future saveDescriptions() async {
    final res = await _api!.httpGet('descriptions');

    List decodedJson = json.decode(res.body);

    print(decodedJson);
    decodedJson.forEach((element) async {
      await _repository!.save('descriptions', {
        'id': element['id'],
        "title": element['title'],
        "description": element['description'],
        "color": element['color'],
      });
    });
  }

  Future saveTerms() async {
    final res = await _api!.httpGet('terms-and-conditions');

    var decodedJson = json.decode(res.body)['introduction'];
    await _repository!.save('terms', {"terms": decodedJson});
  }

  Future savePolicy() async {
    final res = await _api!.httpGet('terms-and-conditions');

    var decodedJson = json.decode(res.body)['introduction'];
    await _repository!.save('policy', {"policy": decodedJson});
  }

  Future saveSurvey() async {
    final res = await _api!.httpGet('survey');

    var decodedJson = json.decode(res.body)['introduction'];
    await _repository!.save('survey', {"survey": decodedJson});
  }

  Future saveDemography() async {
    final res = await _api!.httpGet('demography');

    var decodedJson = json.decode(res.body)['introduction'];
    await _repository!.save('demography', {"demography": decodedJson});
  }

  Future getIntroduction() async {
    var res = await _repository!.getData('introduction');

    return res[0]!['introduction'];
  }

  Future getTerms() async {
    var res = await _repository!.getData('terms');

    return res[0]!['terms'];
  }

  Future getPolicy() async {
    var res = await _repository!.getData('policy');

    return res[0]!['policy'];
  }

  Future getSurvey() async {
    var res = await _repository!.getData('survey');

    return res[0]!['survey'];
  }

  Future getDemography() async {
    var res = await _repository!.getData('demography');

    return res[0]!['demography'];
  }

  Future getDescriptions() async {
    var res = await _repository!.getData('descriptions');
    print(res);
    return res;
  }
}

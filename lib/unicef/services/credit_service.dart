import 'dart:convert';

import 'package:http/http.dart';
import 'package:unicef/api/api.dart';
import 'package:unicef/unicef/repository/repository.dart';

class CreditService {
  Api? _api;
  Repository? _repository;

  CreditService() {
    _api = Api();
    _repository = Repository();
  }

  Future saveCredits() async {
    final res = await _api!.httpGet('credits');

    var section = json.decode(res.body)['section'];
    var title = json.decode(res.body)['title'];
    var description = json.decode(res.body)['description'];
    var address = json.decode(res.body)['address'];
    var phone_number = json.decode(res.body)['phone_number'];
    var email = json.decode(res.body)['email'];
    var website = json.decode(res.body)['website'];

    await _repository!.save('credits', {
      "section": section,
      'title': title,
      'description': description,
      'address': address,
      'phone_number': phone_number,
      'email': email,
      'website': website,
    });
  }

  Future getCredits() async {
    var res = await _repository!.getData('credits');

    return res[0]!;
  }
}

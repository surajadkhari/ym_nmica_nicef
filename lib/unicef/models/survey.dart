// To parse this JSON data, do
//
//     final introduction = introductionFromJson(jsonString);

import 'dart:convert';

Survey surveyFromJson(String str) => Survey.fromJson(json.decode(str));

String surveyToJson(Survey data) => json.encode(data.toJson());

class Survey {
  final String? survey;
  Survey({
    this.survey,
  });

  factory Survey.fromJson(Map<String, dynamic> json) => Survey(
        survey: json["introduction"],
      );

  Map<String, dynamic> toJson() => {
        "survey": survey,
      };
}

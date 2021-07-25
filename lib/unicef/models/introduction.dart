// To parse this JSON data, do
//
//     final introduction = introductionFromJson(jsonString);

import 'dart:convert';

Introduction introductionFromJson(String str) =>
    Introduction.fromJson(json.decode(str));

String introductionToJson(Introduction data) => json.encode(data.toJson());

class Introduction {
  final String? introduction;
  Introduction({
    this.introduction,
  });

  factory Introduction.fromJson(Map<String, dynamic> json) => Introduction(
        introduction: json["introduction"],
      );

  Map<String, dynamic> toJson() => {
        "introduction": introduction,
      };
}

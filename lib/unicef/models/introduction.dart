// // To parse this JSON data, do
// //
// //     final introduction = introductionFromJson(jsonString);

// import 'dart:convert';

// Introduction introductionFromJson(String str) =>
//     Introduction.fromJson(json.decode(str));

// String introductionToJson(Introduction data) => json.encode(data.toJson());

// class Introduction {
//   final String? introduction;
//   Introduction({
//     this.introduction,
//   });

//   factory Introduction.fromJson(Map<String, dynamic> json) => Introduction(
//         introduction: json["introduction"],
//       );

//   Map<String, dynamic> toJson() => {
//         "introduction": introduction,
//       };
// }

import 'dart:convert';

List<Introduction> introductionFromJson(String str) => List<Introduction>.from(
    json.decode(str).map((x) => Introduction.fromJson(x)));

String introductionToJson(List<Introduction> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Introduction {
  Introduction({
    this.id,
    this.title,
    this.description,
    this.color,
  });

  int? id;
  String? title;
  String? description;
  String? color;

  factory Introduction.fromJson(Map<String, dynamic> json) => Introduction(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "color": color,
      };
}

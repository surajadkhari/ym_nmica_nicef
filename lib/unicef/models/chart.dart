import 'dart:convert';

List<Chart> chartFromJson(String str) =>
    List<Chart>.from(json.decode(str).map((x) => Chart.fromJson(x)));

String chartToJson(List<Chart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chart {
  Chart({
    this.id,
    this.indicatorClusterId,
    this.indicatorCode,
    this.chartType,
    this.name,
    this.description,
    this.module,
    this.status,
    this.displayOrder,
    this.charts,
  });

  int? id;
  int? indicatorClusterId;
  String? indicatorCode;
  String? chartType;
  String? name;
  String? description;
  String? module;
  String? status;
  int? displayOrder;
  List<ChartElement>? charts;

  factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        id: json["id"],
        indicatorClusterId: json["indicator_cluster_id"],
        indicatorCode: json["indicator_code"],
        chartType: json["chart_type"],
        name: json["name"],
        description: json["description"],
        module: json["module"],
        status: json["status"],
        displayOrder: json["display_order"],
        charts: List<ChartElement>.from(
            json["charts"].map((x) => ChartElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "indicator_cluster_id": indicatorClusterId,
        "indicator_code": indicatorCode,
        "chart_type": chartType,
        "name": name,
        "description": description,
        "module": module,
        "status": status,
        "display_order": displayOrder,
        "charts": List<dynamic>.from(
          charts!.map(
            (x) => x.toJson(),
          ),
        ),
      };
}

class ChartElement {
  ChartElement({
    this.label,
    this.nepal,
    this.province1,
    this.province2,
    this.bagmati,
    this.gandaki,
    this.lumbini,
    this.karnali,
    this.sudurpashchim,
  });

  String? label;
  String? nepal;
  String? province1;
  String? province2;
  String? bagmati;
  String? gandaki;
  String? lumbini;
  String? karnali;
  String? sudurpashchim;

  factory ChartElement.fromJson(Map<String, dynamic> json) => ChartElement(
        label: json["label"],
        nepal: json["Nepal"],
        province1: json["Province 1"],
        province2: json["Province 2"],
        bagmati: json["Bagmati"],
        gandaki: json["Gandaki"],
        lumbini: json["Lumbini"],
        karnali: json["Karnali"],
        sudurpashchim: json["Sudurpashchim"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "Nepal": nepal,
        "Province 1": province1,
        "Province 2": province2,
        "Bagmati": bagmati,
        "Gandaki": gandaki,
        "Lumbini": lumbini,
        "Karnali": karnali,
        "Sudurpashchim": sudurpashchim,
      };
}

// To parse this JSON data, do
//
//     final chart = chartFromJson(jsonString);

// import 'dart:convert';

// List<Chart> chartFromJson(String str) =>
//     List<Chart>.from(json.decode(str).map((x) => Chart.fromJson(x)));

// String chartToJson(List<Chart> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Chart {
//   Chart({
//     this.id,
//     this.indicatorId,
//     this.label,
//     this.np,
//     this.p1,
//     this.p2,
//     this.p3,
//     this.p4,
//     this.p5,
//     this.p6,
//     this.p7,
//     this.chartType,
//     this.name,
//   });

//   int? id;
//   int? indicatorId;
//   String? label;
//   double? np;
//   double? p1;
//   double? p2;
//   double? p3;
//   double? p4;
//   double? p5;
//   double? p6;
//   double? p7;
//   String? chartType;
//   String? name;

//   factory Chart.fromJson(Map<String, dynamic> json) => Chart(
//         id: json["id"],
//         indicatorId: json["indicator_id"],
//         label: json["label"],
//         np: json["np"].toDouble(),
//         p1: json["p1"].toDouble(),
//         p2: json["p2"].toDouble(),
//         p3: json["p3"].toDouble(),
//         p4: json["p4"].toDouble(),
//         p5: json["p5"].toDouble(),
//         p6: json["p6"].toDouble(),
//         p7: json["p7"].toDouble(),
//         chartType: json["chart_type"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "indicator_id": indicatorId,
//         "label": label,
//         "np": np,
//         "p1": p1,
//         "p2": p2,
//         "p3": p3,
//         "p4": p4,
//         "p5": p5,
//         "p6": p6,
//         "p7": p7,
//         "chart_type": chartType,
//         "name": name,
//       };
// }

// To parse this JSON data, do
//
//     final chart = chartFromJson(jsonString);

// import 'dart:convert';

// Chart chartFromJson(String str) => Chart.fromJson(json.decode(str));

// String chartToJson(Chart data) => json.encode(data.toJson());

// class Chart {
//   Chart({
//     this.id,
//     this.indicatorClusterId,
//     this.indicatorCode,
//     this.chartType,
//     this.name,
//     this.module,
//     this.status,
//     this.displayOrder,
//     this.charts,
//     this.description,
//   });

//   int? id;
//   int? indicatorClusterId;
//   String? indicatorCode;
//   String? chartType;
//   String? name;
//   String? module;
//   String? status;
//   int? displayOrder;
//   String? description;
//   List<ChartElement>? charts;

//   factory Chart.fromJson(Map<String, dynamic> json) => Chart(
//         id: json["id"],
//         indicatorClusterId: json["indicator_cluster_id"],
//         indicatorCode: json["indicator_code"],
//         chartType: json["chart_type"],
//         name: json["name"],
//         module: json["module"],
//         status: json["status"],
//         displayOrder: json["display_order"],
//         charts: List<ChartElement>.from(
//             json["charts"].map((x) => ChartElement.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "indicator_cluster_id": indicatorClusterId,
//         "indicator_code": indicatorCode,
//         "chart_type": chartType,
//         "name": name,
//         "module": module,
//         "status": status,
//         "display_order": displayOrder,
//         "charts": List<dynamic>.from(charts!.map((x) => x.toJson())),
//       };
// }

// class ChartElement {
//   ChartElement({
//     this.label,
//     this.nepal,
//     this.province1,
//     this.province2,
//     this.bagmati,
//     this.gandaki,
//     this.lumbini,
//     this.karnali,
//     this.sudurpashchim,
//   });

//   String? label;
//   double? nepal;
//   int? province1;
//   double? province2;
//   double? bagmati;
//   int? gandaki;
//   double? lumbini;
//   double? karnali;
//   double? sudurpashchim;

//   factory ChartElement.fromJson(Map<String, dynamic> json) => ChartElement(
//         label: json["label"],
//         nepal: json["Nepal"].toDouble(),
//         province1: json["Province 1"],
//         province2: json["Province 2"].toDouble(),
//         bagmati: json["Bagmati"].toDouble(),
//         gandaki: json["Gandaki"],
//         lumbini: json["Lumbini"].toDouble(),
//         karnali: json["Karnali"].toDouble(),
//         sudurpashchim: json["Sudurpashchim"].toDouble(),
//       );

//   Map<String, dynamic> toJson() => {
//         "label": label,
//         "Nepal": nepal,
//         "Province 1": province1,
//         "Province 2": province2,
//         "Bagmati": bagmati,
//         "Gandaki": gandaki,
//         "Lumbini": lumbini,
//         "Karnali": karnali,
//         "Sudurpashchim": sudurpashchim,
//       };
// }

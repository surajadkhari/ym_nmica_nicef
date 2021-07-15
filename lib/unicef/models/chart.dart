import 'dart:convert';

List<Chart> chartFromJson(String str) =>
    List<Chart>.from(json.decode(str).map((x) => Chart.fromJson(x)));

String chartToJson(List<Chart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chart {
  Chart({
    required this.id,
    required this.indicatorClusterId,
    required this.indicatorCode,
    required this.chartType,
    required this.name,
    required this.description,
    required this.module,
    required this.charts,
  });

  int? id;
  int? indicatorClusterId;
  String? indicatorCode;
  ChartType? chartType;
  String? name;
  String? description;
  String? module;
  Map<String, ChartValue> charts;

  factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        id: json["id"],
        indicatorClusterId: json["indicator_cluster_id"],
        indicatorCode: json["indicator_code"],
        chartType: chartTypeValues.map[json["chart_type"]],
        name: json["name"],
        description: json["description"],
        module: json["module"],
        charts: Map.from(json["charts"]).map(
            (k, v) => MapEntry<String, ChartValue>(k, ChartValue.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "indicator_cluster_id": indicatorClusterId,
        "indicator_code": indicatorCode,
        "chart_type": chartTypeValues.reverse![chartType],
        "name": name,
        "description": description,
        "module": module,
        "charts": Map.from(charts)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

enum ChartType { LINE_GRAPH, BAR_GRAPH }

final chartTypeValues = EnumValues(
    {"bar_graph": ChartType.BAR_GRAPH, "line_graph": ChartType.LINE_GRAPH});

class ChartValue {
  ChartValue({
    required this.nepal,
    required this.province1,
    required this.province2,
    required this.bagmati,
    required this.gandaki,
    required this.lumbini,
    required this.karnali,
    required this.sudurpashchim,
  });

  String nepal;
  String province1;
  String province2;
  String bagmati;
  String gandaki;
  String lumbini;
  String karnali;
  String sudurpashchim;

  factory ChartValue.fromJson(Map<String, dynamic> json) => ChartValue(
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

enum Status { ACTIVE }

final statusValues = EnumValues({"active": Status.ACTIVE});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    return reverseMap;
  }
}

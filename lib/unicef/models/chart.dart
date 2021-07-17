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
        "charts": List<dynamic>.from(charts!.map((x) => x.toJson())),
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

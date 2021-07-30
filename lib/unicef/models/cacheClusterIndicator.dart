class IndicatorForCache {
  int? id;
  String? name;
  List<Indicators>? indicators;
  bool? value;

  IndicatorForCache({this.id, this.name, this.indicators, this.value = false});

  IndicatorForCache.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name '];
    if (json['indicators'] != null) {
      indicators = <Indicators>[];
      json['indicators'].forEach((v) {
        indicators!.add(new Indicators.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name '] = this.name;
    if (this.indicators != null) {
      data['indicators'] = this.indicators!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Indicators {
  int? id;
  String? name;
  bool? value;

  Indicators({this.id, this.name, this.value = false});

  Indicators.fromJson(Map<String, dynamic> json) {
    id = json['id '];
    name = json['name '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id '] = this.id;
    data['name '] = this.name;
    return data;
  }
}

class Indicator {
  int? id;
  String? name;

  Indicator({this.id, this.name});

  factory Indicator.fromJson(Map<String, dynamic> json) {
    return Indicator(
      id: json['id'],
      name: json['name'],
    );
  }
}

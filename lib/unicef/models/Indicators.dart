class Indicator {
  int? id;
  String? name;

  Indicator({this.id, this.name});

  factory Indicator.fromJson(Map<String, dynamic> json) {
    var id = json['id'];
    var name = json['name'];
    return Indicator(
      id: id,
      name: name,
    );
  }
}

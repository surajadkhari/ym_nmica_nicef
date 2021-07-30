class CachIindicator {
  int? id;
  String? name;
  bool? value;

  CachIindicator({required this.id, required this.name, this.value = false});

  CachIindicator.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

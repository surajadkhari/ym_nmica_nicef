class Version {
  String? name;
  String? number;
  String? description;
  String? release_date;

  Version({
    this.name,
    this.number,
    this.description,
    this.release_date,
  });

  Version.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    number = json['number'];
    description = json['description'];
    release_date = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['number'] = this.number;
    data['description'] = this.description;
    data['release_date'] = this.release_date;
    return data;
  }
}

class Cluster {
  int? id;
  String? name;
  String? image;

  Cluster({this.id, this.name});

  Cluster.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    name = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

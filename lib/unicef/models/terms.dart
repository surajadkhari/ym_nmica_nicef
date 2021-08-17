class Terms {
  String? introduction;

  Terms({this.introduction});

  Terms.fromJson(Map<String, dynamic> json) {
    introduction = json['introduction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['introduction'] = this.introduction;
    return data;
  }
}

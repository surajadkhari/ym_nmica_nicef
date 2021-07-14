class CheckBoxState {
  final int? id;
  final String? name;
  bool? value;

  CheckBoxState({this.id, this.name, this.value = false});

  factory CheckBoxState.fromJson(Map<String, dynamic> json) {
    return CheckBoxState(
      id: json['id'],
      name: json['name'],
    );
  }
}

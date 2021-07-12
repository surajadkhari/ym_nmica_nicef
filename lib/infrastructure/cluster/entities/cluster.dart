import 'package:equatable/equatable.dart';

class Cluster extends Equatable {
  const Cluster({
    required this.id,
    required this.title,
  });

  final String? id;
  final String? title;

  factory Cluster.fromJson(Map<String, String> json) {
    return Cluster(
      id: json['id'],
      title: json['title'],
    );
  }

  @override
  List<Object> get props => <String>[id!, title!];
}

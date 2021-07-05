import 'package:unicef/cluster/domain/entities/cluster.dart';

class ClusterModel extends Cluster {
  ClusterModel({required String id, required String title})
      : super(id: id, title: title);

  factory ClusterModel.fromJson(Map<String, dynamic> json) {
    return ClusterModel(
      id: json['id'],
      title: json['title'],
    );
  }
}

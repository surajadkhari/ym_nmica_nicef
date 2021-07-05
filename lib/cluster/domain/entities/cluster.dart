import 'package:equatable/equatable.dart';

class Cluster extends Equatable {
  Cluster({
    required this.id,
    required this.title,
  });

  final String? id;
  final String? title;

  @override
  List<Object> get props => <String>[id!, title!];
}

import 'package:dependencies/equatable/equatable.dart';

class UserParams extends Equatable {
  final int? id;
  final String name;
  final String? job;

  const UserParams({this.id, required this.name, this.job});

  @override
  List<Object?> get props => [id, name, job];
}

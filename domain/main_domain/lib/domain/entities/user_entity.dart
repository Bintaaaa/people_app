import 'package:dependencies/equatable/equatable.dart';

class UserEntity extends Equatable {
  final dynamic id;
  final String email;
  final String name;
  final String avatar;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar,
  });

  @override
  List<Object?> get props => [id, email, name, avatar];
}

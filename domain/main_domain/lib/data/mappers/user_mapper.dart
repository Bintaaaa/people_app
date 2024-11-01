import 'package:main_domain/data/models/list_user_model_dto.dart';
import 'package:main_domain/data/models/login_model_dto.dart';
import 'package:main_domain/data/models/user_model_dto.dart';
import 'package:main_domain/domain/entities/login_entity.dart';
import 'package:main_domain/domain/entities/user_entity.dart';

class UserMapper {
  const UserMapper();

  List<UserEntity> mapListUserModelToEntity(ListUserModelDTO data) {
    List<UserEntity> users = [];
    final listData = data.data ?? [];
    for (var item in listData) {
      users.add(
        UserEntity(
          id: item.id ?? 0,
          email: item.email ?? "",
          name: item.name ?? "",
          avatar: item.avatar ?? "",
        ),
      );
    }
    return users;
  }

  UserEntity mapUserModelToEntity(UserModelDTO data) =>
      UserEntity(id: data.id ?? 0, email: data.email ?? "", name: data.name ?? "", avatar: data.avatar ?? "");

  LoginEntity mapLoginModelToEntity(LoginModelDto data) => LoginEntity(token: data.token ?? "");
}

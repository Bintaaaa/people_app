import 'package:common/core/constans/constan_values.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:main_domain/data/models/list_user_model_dto.dart';
import 'package:main_domain/data/models/login_model_dto.dart';

abstract class UserRemoteDatasource {
  Future<ListUserModelDTO> fetchUsers();
  Future<LoginModelDto> login({required String email, required String password});
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final Dio dio;

  const UserRemoteDatasourceImpl({required this.dio});
  @override
  Future<ListUserModelDTO> fetchUsers() async {
    try {
      final response = await dio.get(ConstansValues.apiConstans.users);
      return ListUserModelDTO.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<LoginModelDto> login({required String email, required String password}) async {
    try {
      final response = await dio.post(
        ConstansValues.apiConstans.login,
        data: {
          "email": email,
          "password": password,
        },
      );
      return LoginModelDto.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }
}

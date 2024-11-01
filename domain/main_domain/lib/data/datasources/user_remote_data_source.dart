import 'package:common/core/constans/constan_values.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:main_domain/data/models/list_user_model_dto.dart';
import 'package:main_domain/data/models/login_model_dto.dart';
import 'package:main_domain/data/models/user_model_dto.dart';

abstract class UserRemoteDatasource {
  Future<ListUserModelDTO> fetchUsers();
  Future<LoginModelDto> login({required String email, required String password});
  Future<UserModelDTO> createUser({required String name, required String job});
  Future<UserModelDTO> updateUser({required int id, required String name, required String job});
  Future<bool> deleteUser({required int id});
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final Dio dio;

  const UserRemoteDatasourceImpl({required this.dio});
  @override
  Future<ListUserModelDTO> fetchUsers() async {
    try {
      final response = await dio.get(ConstansValues.apiConstans.users, queryParameters: {
        "page": 1,
        "per_page": 100,
      });
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

  @override
  Future<UserModelDTO> createUser({required String name, required String job}) async {
    try {
      final response = await dio.post(
        ConstansValues.apiConstans.users,
        data: {
          "name": name,
          "job": job,
        },
      );
      return UserModelDTO.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<UserModelDTO> updateUser({required int id, required String name, required String job}) async {
    try {
      final response = await dio.put(
        "${ConstansValues.apiConstans.users}/$id",
        data: {
          "name": name,
          "job": job,
        },
      );
      return UserModelDTO.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<bool> deleteUser({required int id}) async {
    try {
      await dio.delete(
        "${ConstansValues.apiConstans.users}/$id",
      );
      return true;
    } catch (_) {
      rethrow;
    }
  }
}

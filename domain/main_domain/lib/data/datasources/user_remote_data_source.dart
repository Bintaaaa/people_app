import 'package:common/core/constans/constan_values.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:main_domain/data/models/list_user_model_dto.dart';

abstract class UserRemoteDatasource {
  Future<ListUserModelDTO> fetchUsers();
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final Dio dio;

  const UserRemoteDatasourceImpl({required this.dio});
  @override
  Future<ListUserModelDTO> fetchUsers() async {
    try {
      final response = await dio.get(ConstansValues.apiConstans.users, queryParameters: {"page": 1});
      return ListUserModelDTO.fromJson(response.data);
    } catch (_) {
      rethrow;
    }
  }
}

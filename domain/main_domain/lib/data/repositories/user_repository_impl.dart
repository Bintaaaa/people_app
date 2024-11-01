import 'package:common/error/dio_error_handler.dart';
import 'package:common/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:main_domain/data/datasources/user_remote_data_source.dart';
import 'package:main_domain/data/mappers/user_mapper.dart';
import 'package:main_domain/domain/entities/login_entity.dart';
import 'package:main_domain/domain/entities/user_entity.dart';
import 'package:main_domain/domain/repositories/user_respository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDatasource datasource;
  final UserMapper mapper;

  const UserRepositoryImpl({required this.datasource, required this.mapper});
  @override
  Future<Either<FailureResponse, List<UserEntity>>> fetchUsers() async {
    try {
      final response = await datasource.fetchUsers();
      return Right(
        mapper.mapListUserModelToEntity(
          response,
        ),
      );
    } on DioException catch (error) {
      return DioErrorHandler.handle(error);
    }
  }

  @override
  Future<Either<FailureResponse, LoginEntity>> login({required String email, required String password}) async {
    try {
      final response = await datasource.login(
        email: email,
        password: password,
      );
      return Right(
        mapper.mapLoginModelToEntity(
          response,
        ),
      );
    } on DioException catch (error) {
      return DioErrorHandler.handle(error);
    }
  }

  @override
  Future<Either<FailureResponse, UserEntity>> createUser({required String name, required String job}) async {
    try {
      final response = await datasource.createUser(
        name: name,
        job: job,
      );
      return Right(
        mapper.mapUserModelToEntity(
          response,
        ),
      );
    } on DioException catch (error) {
      return DioErrorHandler.handle(error);
    }
  }

  @override
  Future<Either<FailureResponse, bool>> deleteUser({required int id}) async {
    try {
      final response = await datasource.deleteUser(
        id: id,
      );
      return Right(
        response,
      );
    } on DioException catch (error) {
      return DioErrorHandler.handle(error);
    }
  }

  @override
  Future<Either<FailureResponse, UserEntity>> updateUser(
      {required int id, required String name, required String job}) async {
    try {
      final response = await datasource.updateUser(
        id: id,
        name: name,
        job: job,
      );
      return Right(
        mapper.mapUserModelToEntity(
          response,
        ),
      );
    } on DioException catch (error) {
      return DioErrorHandler.handle(error);
    }
  }
}

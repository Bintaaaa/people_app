import 'package:common/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:main_domain/domain/entities/login_entity.dart';
import 'package:main_domain/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<FailureResponse, List<UserEntity>>> fetchUsers();
  Future<Either<FailureResponse, LoginEntity>> login({required String email, required String password});
}

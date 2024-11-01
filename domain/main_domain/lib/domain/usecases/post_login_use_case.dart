import 'package:common/error/failure_response.dart';
import 'package:common/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:main_domain/domain/entities/login_entity.dart';
import 'package:main_domain/domain/params/login_params.dart';
import 'package:main_domain/domain/repositories/user_respository.dart';

class PostLoginUseCase extends UseCase<LoginEntity, LoginParams> {
  final UserRepository repository;

  const PostLoginUseCase({required this.repository});
  @override
  Future<Either<FailureResponse, LoginEntity>> call(LoginParams params) async => await repository.login(
        email: params.email,
        password: params.password,
      );
}

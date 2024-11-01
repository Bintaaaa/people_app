import 'package:common/error/failure_response.dart';
import 'package:common/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:main_domain/domain/entities/user_entity.dart';
import 'package:main_domain/domain/params/user_params.dart';
import 'package:main_domain/domain/repositories/user_respository.dart';

class UpdateUserUseCase extends UseCase<UserEntity, UserParams> {
  final UserRepository repository;

  const UpdateUserUseCase({required this.repository});
  @override
  Future<Either<FailureResponse, UserEntity>> call(UserParams params) async => await repository.updateUser(
        id: params.id!,
        name: params.name,
        job: params.job!,
      );
}

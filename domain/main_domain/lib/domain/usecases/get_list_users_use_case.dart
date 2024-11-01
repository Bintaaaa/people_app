import 'package:common/error/failure_response.dart';
import 'package:common/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:main_domain/domain/entities/user_entity.dart';
import 'package:main_domain/domain/repositories/user_respository.dart';

class GetListUsersUseCase extends UseCase<List<UserEntity>, NoParams> {
  final UserRepository repository;

  const GetListUsersUseCase({required this.repository});
  @override
  Future<Either<FailureResponse, List<UserEntity>>> call(NoParams params) async => await repository.fetchUsers();
}

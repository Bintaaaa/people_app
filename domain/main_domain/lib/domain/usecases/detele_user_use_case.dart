import 'package:common/error/failure_response.dart';
import 'package:common/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:main_domain/domain/repositories/user_respository.dart';

class DeleteUserUseCase extends UseCase<bool, int> {
  final UserRepository repository;

  const DeleteUserUseCase({required this.repository});
  @override
  Future<Either<FailureResponse, bool>> call(int params) async => await repository.deleteUser(
        id: params,
      );
}

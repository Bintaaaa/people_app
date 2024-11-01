import 'package:common/error/failure_response.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:main_domain/domain/entities/user_entity.dart';
import 'package:main_domain/domain/params/user_params.dart';
import 'package:main_domain/domain/repositories/user_respository.dart';
import 'package:main_domain/domain/usecases/post_user_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_user_use_case_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late PostUserUseCase useCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = PostUserUseCase(repository: mockUserRepository);
  });

  const userParams = UserParams(name: 'John Doe', job: 'Developer');
  const userEntity =
      UserEntity(id: 1, name: 'John Doe', email: 'test@gmail.com', avatar: 'https://reqres.in/img/faces/1-image.jpg');

  test('should return UserEntity when createUser is successful', () async {
    when(mockUserRepository.createUser(name: userParams.name, job: userParams.job))
        .thenAnswer((_) async => const Right(userEntity));

    final result = await useCase(userParams);

    expect(result, const Right(userEntity));
    verify(mockUserRepository.createUser(name: userParams.name, job: userParams.job)).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });

  test('should return FailureResponse when createUser fails', () async {
    const failure = FailureResponse(errorMessage: 'Failed to create user');
    when(mockUserRepository.createUser(name: userParams.name, job: userParams.job))
        .thenAnswer((_) async => const Left(failure));

    final result = await useCase(userParams);

    expect(result, const Left(failure));
    verify(mockUserRepository.createUser(name: userParams.name, job: userParams.job)).called(1);
    verifyNoMoreInteractions(mockUserRepository);
  });
}

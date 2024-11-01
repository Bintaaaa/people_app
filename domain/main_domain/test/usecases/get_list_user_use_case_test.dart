import 'package:common/error/failure_response.dart';
import 'package:common/use_case/use_case.dart';
import 'package:dependencies/dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:main_domain/domain/entities/user_entity.dart';
import 'package:main_domain/domain/repositories/user_respository.dart';
import 'package:main_domain/domain/usecases/get_list_users_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_list_user_use_case_test.mocks.dart';

@GenerateMocks([UserRepository])
void main() {
  late GetListUsersUseCase useCase;
  late MockUserRepository mockUserRepository;

  setUp(() {
    mockUserRepository = MockUserRepository();
    useCase = GetListUsersUseCase(repository: mockUserRepository);
  });

  final List<UserEntity> tUsers = [
    const UserEntity(
        id: 1, name: "User 1", email: "user1@example.com", avatar: 'https://reqres.in/img/faces/1-image.jpg'),
    const UserEntity(
        id: 2, name: "User 2", email: "user2@example.com", avatar: 'https://reqres.in/img/faces/2-image.jpg'),
  ];

  test('should return list of users from the repository', () async {
    when(mockUserRepository.fetchUsers()).thenAnswer((_) async => Right(tUsers));

    final result = await useCase(const NoParams());

    expect(result, Right(tUsers));
    verify(mockUserRepository.fetchUsers());
    verifyNoMoreInteractions(mockUserRepository);
  });

  test('should return FailureResponse when repository fails', () async {
    const failureResponse = FailureResponse(errorMessage: 'Failed to fetch users');
    when(mockUserRepository.fetchUsers()).thenAnswer((_) async => const Left(failureResponse));

    final result = await useCase(const NoParams());

    expect(result, const Left(failureResponse));
    verify(mockUserRepository.fetchUsers());
    verifyNoMoreInteractions(mockUserRepository);
  });
}

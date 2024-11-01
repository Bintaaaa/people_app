import 'package:dependencies/get_it/get_it.dart';
import 'package:main_domain/data/datasources/user_remote_data_source.dart';
import 'package:main_domain/data/mappers/user_mapper.dart';
import 'package:main_domain/data/repositories/user_repository_impl.dart';
import 'package:main_domain/domain/repositories/user_respository.dart';
import 'package:main_domain/domain/usecases/get_list_users_use_case.dart';

class DomainInjection {
  DomainInjection() {
    _dataSource();
    _mapper();
    _repository();
    _useCase();
  }

  _dataSource() {
    sl.registerLazySingleton<UserRemoteDatasource>(() => UserRemoteDatasourceImpl(dio: sl()));
  }

  _repository() {
    sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        datasource: sl(),
        mapper: sl(),
      ),
    );
  }

  _mapper() {
    sl.registerLazySingleton<UserMapper>(
      () => const UserMapper(),
    );
  }

  _useCase() {
    sl.registerLazySingleton<GetListUsersUseCase>(
      () => GetListUsersUseCase(
        repository: sl(),
      ),
    );
  }
}

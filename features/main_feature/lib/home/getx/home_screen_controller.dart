import 'package:common/state/view_data_state.dart';
import 'package:common/use_case/use_case.dart';
import 'package:dependencies/get/get.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:main_domain/domain/usecases/get_list_users_use_case.dart';

class HomeScreenController extends GetxController {
  final GetListUsersUseCase useCase = sl<GetListUsersUseCase>();
  var userState = ViewData.initial().obs;

  @override
  void onInit() {
    super.onInit();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    userState.value = ViewData.loading();
    final result = await useCase.call(const NoParams());
    result.fold(
      (failure) {
        userState.value = ViewData.error(
          message: failure.errorMessage,
          failureResponse: failure,
        );
      },
      (data) {
        userState.value = ViewData.loaded(data: data);
      },
    );
  }
}

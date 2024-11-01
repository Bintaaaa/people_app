import 'package:common/core/constans/constan_values.dart';
import 'package:common/core/constans/routes_constans.dart';
import 'package:common/extension/value_check_extension.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/get/get.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:main_domain/domain/params/user_params.dart';
import 'package:main_domain/domain/usecases/detele_user_use_case.dart';
import 'package:main_domain/domain/usecases/post_user_use_case.dart';
import 'package:main_domain/domain/usecases/update_user_use_case.dart';

class UserScreenController extends GetxController {
  final nameController = TextEditingController();
  final jobController = TextEditingController();

  final PostUserUseCase postUseCase = sl<PostUserUseCase>();
  final UpdateUserUseCase updateUseCase = sl<UpdateUserUseCase>();
  final DeleteUserUseCase deleteUseCase = sl<DeleteUserUseCase>();

  var userState = ViewData.initial().obs;
  var deleteState = ViewData.initial().obs;
  var isDisable = true.obs;
  var isUpdate = false.obs;

  late UserParams? userParams;

  @override
  void onInit() {
    super.onInit();
    userParams = Get.arguments;
    if (userParams.isNotNull()) {
      nameController.text = userParams!.name;
      isUpdate.value = true;
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    jobController.dispose();
  }

  Future<void> createUser() async {
    userState.value = ViewData.loading();
    final result = await postUseCase.call(
      UserParams(
        name: nameController.text,
        job: jobController.text,
      ),
    );
    result.fold(
      (failure) {
        userState.value = ViewData.error(
          message: failure.errorMessage,
          failureResponse: failure,
        );
        Get.snackbar(
          "Gagal Membuat User",
          failure.errorMessage,
          backgroundColor: ConstansValues.colors.red,
        );
      },
      (data) {
        Get.snackbar(
          "Berhasil Membuat User",
          "Terimakasih sudah menggunakan fitur ini",
          backgroundColor: ConstansValues.colors.green,
        );
        userState.value = ViewData.loaded(
          data: data,
        );
        Get.offAllNamed(RoutesConstans.homeScreen);
      },
    );
  }

  Future<void> updateUser() async {
    userState.value = ViewData.loading();
    final result = await updateUseCase.call(
      UserParams(
        id: userParams?.id,
        name: nameController.text,
        job: jobController.text,
      ),
    );
    result.fold(
      (failure) {
        userState.value = ViewData.error(
          message: failure.errorMessage,
          failureResponse: failure,
        );
        Get.snackbar(
          "Gagal Memperbaharui User",
          failure.errorMessage,
          backgroundColor: ConstansValues.colors.red,
        );
      },
      (data) {
        userState.value = ViewData.loaded(
          data: data,
        );
        Get.snackbar(
          "Berhasil Memperbaharui User",
          "Terimakasih sudah menggunakan fitur ini",
          backgroundColor: ConstansValues.colors.green,
        );
        Get.offAllNamed(RoutesConstans.homeScreen);
      },
    );
  }

  Future<void> deleteUser() async {
    deleteState.value = ViewData.loading();
    final result = await deleteUseCase.call(userParams!.id!);
    result.fold(
      (failure) {
        deleteState.value = ViewData.error(
          message: failure.errorMessage,
          failureResponse: failure,
        );
        Get.snackbar(
          "Gagal Hapus User",
          failure.errorMessage,
          backgroundColor: ConstansValues.colors.red,
        );
      },
      (data) {
        deleteState.value = ViewData.loaded(
          data: data,
        );
        Get.snackbar(
          "Berhasil Hapus User",
          "Terimakasih sudah menggunakan fitur ini",
          backgroundColor: ConstansValues.colors.green,
        );
        Get.offAllNamed(RoutesConstans.homeScreen);
      },
    );
  }

  checkData() {
    if (nameController.text.isNotEmpty && jobController.text.isNotEmpty) {
      isDisable.value = false;
    } else {
      isDisable.value = true;
    }
  }
}

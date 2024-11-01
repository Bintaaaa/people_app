import 'package:common/core/constans/constan_values.dart';
import 'package:common/core/constans/routes_constans.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/get/get.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:main_domain/domain/params/login_params.dart';
import 'package:main_domain/domain/usecases/post_login_use_case.dart';

class LoginScreenController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final PostLoginUseCase useCase = sl<PostLoginUseCase>();
  var loginState = ViewData.initial().obs;
  var isDisable = true.obs;

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> login() async {
    loginState.value = ViewData.loading();
    final result = await useCase.call(
      LoginParams(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    result.fold(
      (failure) {
        loginState.value = ViewData.error(
          message: failure.errorMessage,
          failureResponse: failure,
        );
        Get.snackbar(
          "Gagal Login",
          failure.errorMessage,
          backgroundColor: ConstansValues.colors.red,
        );
      },
      (data) {
        loginState.value = ViewData.loaded(
          data: data,
        );
        Get.snackbar(
          "Login Sukses",
          "Selamat menikmati fitur ini",
          backgroundColor: ConstansValues.colors.green,
        );
        Get.offAllNamed(RoutesConstans.homeScreen);
      },
    );
  }

  checkData() {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isDisable.value = false;
    } else {
      isDisable.value = true;
    }
  }
}

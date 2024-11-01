import 'package:common/components/button/button_component.dart';
import 'package:common/components/text_field_component/text_field_component.dart';
import 'package:common/components/text_style/text_tyle_constants.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:dependencies/get/get.dart';
import 'package:flutter/material.dart';
import 'package:main_feature/authentication/getx/login_screen_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginScreenController controller = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: TextStyleConstants.pageTitles,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(16.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldComponent.rounded(
                controller: controller.emailController,
                hintText: "bijan@example.com",
                title: "Email",
                onChange: (value) {
                  controller.checkData();
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFieldComponent.rounded(
                controller: controller.passwordController,
                obscureText: true,
                hintText: "xxxxxx",
                title: "Password",
                onChange: (value) {
                  controller.checkData();
                },
              ),
              const Spacer(),
              Obx(
                () => ButtonComponent.primary(
                  title: "Masuk",
                  isLoading: controller.loginState.value.status.isLoading,
                  isDisable: controller.isDisable.value,
                  onPress: () {
                    controller.login();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

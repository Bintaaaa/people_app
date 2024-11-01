import 'package:common/components/button/button_component.dart';
import 'package:common/components/text_field_component/text_field_component.dart';
import 'package:common/components/text_style/text_tyle_constants.dart';
import 'package:common/state/view_data_state.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:dependencies/get/get.dart';
import 'package:flutter/material.dart';
import 'package:main_feature/users/getx/user_screen_controller.dart';

enum UserScreenMode { create, update }

extension UserScreenExtension on UserScreenMode {
  bool get isCreate => this == UserScreenMode.create;
  bool get isUpdate => this == UserScreenMode.update;
}

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final UserScreenController controller = Get.put(UserScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _title(),
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
                controller: controller.nameController,
                hintText: "Ericson",
                title: "Nama",
                onChange: (value) {
                  controller.checkData();
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              TextFieldComponent.rounded(
                controller: controller.jobController,
                hintText: "Software engineer",
                title: "Pekerjaan",
                onChange: (value) {
                  controller.checkData();
                },
              ),
              const Spacer(),
              Obx(
                () => ButtonComponent.primary(
                  title: _title(),
                  isLoading: controller.userState.value.status.isLoading,
                  isDisable: controller.isDisable.value,
                  onPress: () {
                    _methodCall();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  UserScreenMode _mode() {
    if (controller.isUpdate.value) {
      return UserScreenMode.update;
    } else {
      return UserScreenMode.create;
    }
  }

  _title() {
    if (_mode().isCreate) return "Buat User";
    if (_mode().isUpdate) return "Update User";
  }

  _methodCall() {
    if (_mode().isCreate) controller.createUser();
    if (_mode().isUpdate) controller.updateUser();
  }
}

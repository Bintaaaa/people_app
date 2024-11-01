import 'dart:developer';

import 'package:dependencies/get/get.dart';
import 'package:main_feature/home/home_screen.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initial();
  }

  Future<void> initial() async {
    log("ea nih masuk 1");
    await Future.delayed(
      const Duration(seconds: 2),
    );
    log("ea nih masuk 2");
    Get.to(
      HomeScreen(),
    );
    log("ea nih masuk 3");
  }
}

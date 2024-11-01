import 'package:common/core/constans/routes_constans.dart';
import 'package:dependencies/get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    initial();
  }

  Future<void> initial() async {
    await Future.delayed(
      const Duration(seconds: 2),
    );
    Get.offNamed(RoutesConstans.loginScreen);
  }
}

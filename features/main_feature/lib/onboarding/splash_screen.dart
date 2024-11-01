import 'package:common/components/text_style/text_tyle_constants.dart';
import 'package:dependencies/get/get.dart';
import 'package:flutter/material.dart';
import 'package:main_feature/onboarding/getx/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      body: Center(
        child: Text(
          "Hallo Selamat Datang",
          style: TextStyleConstants.pageTitles,
        ),
      ),
    );
  }
}

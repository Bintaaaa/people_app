import 'package:common/core/constans/routes_constans.dart';
import 'package:dependencies/get/get.dart';
import 'package:main_feature/home/home_screen.dart';
import 'package:main_feature/onboarding/splash_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
    name: RoutesConstans.splashScreen,
    page: () => const SplashScreen(),
  ),
  GetPage(
    name: RoutesConstans.homeScreen,
    page: () => HomeScreen(),
  ),
];

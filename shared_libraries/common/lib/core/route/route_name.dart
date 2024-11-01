import 'package:common/core/constans/routes_constans.dart';
import 'package:dependencies/get/get.dart';
import 'package:main_feature/authentication/login_screen.dart';
import 'package:main_feature/home/home_screen.dart';
import 'package:main_feature/onboarding/splash_screen.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: RoutesConstans.splashScreen, page: () => const SplashScreen(), children: [
    GetPage(
      name: RoutesConstans.homeScreen,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: RoutesConstans.loginScreen,
      page: () => LoginScreen(),
    ),
  ]),
];

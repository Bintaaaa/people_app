import 'package:common/core/constans/routes_constans.dart';
import 'package:common/core/route/route_name.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
import 'package:dependencies/get/get.dart';
import 'package:flutter/material.dart';
import 'package:people_app/injections/injections.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injections();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => GetMaterialApp(
        title: 'Teknikal Test - Bijan',
        theme: ThemeData(
          fontFamily: 'JakartaSans',
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(
              0xffF2BED1,
            ),
          ),
          useMaterial3: true,
        ),
        initialRoute: RoutesConstans.splashScreen,
        getPages: routes,
      ),
    );
  }
}

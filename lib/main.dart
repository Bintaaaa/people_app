import 'package:common/route/router_configuration.dart';
import 'package:dependencies/flutter_screenutil/flutter_screenutil.dart';
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
      builder: (_, child) => MaterialApp.router(
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
        backButtonDispatcher: RootBackButtonDispatcher(),
        routeInformationProvider: routerConfiguration.routeInformationProvider,
        routeInformationParser: routerConfiguration.routeInformationParser,
        routerDelegate: routerConfiguration.routerDelegate,
      ),
    );
  }
}

import 'package:dependencies/go_router/go_router.dart';
import 'package:flutter/material.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
String? initialRoute;
final routerConfiguration = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: initialRoute ?? "/",
  debugLogDiagnostics: true,
  routes: [],
);

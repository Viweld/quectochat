import 'package:flutter/material.dart';
import 'package:quectochat/presentation/navigation/auth_controller/auth_controller.dart';
import 'package:quectochat/presentation/screens/login_screen/login_screen.dart';

import '../../screens/registration_screen/registration_screen.dart';
import '../../screens/splash_screen/splash_screen.dart';

class RootRoutes {
  static const String routeSplash = '/';
  static const String routeAuthController = 'routeAuthController/';
  static const String routeLogin = 'routeLogin/';
  static const String routeRegistration = 'routeRegistration/';

  // ---------------------------------------------------------------------------
  static Map<String, WidgetBuilder> getRouteBuilders() {
    return {
      RootRoutes.routeSplash: (_) => const SplashScreen(),
      RootRoutes.routeAuthController: (_) => const AuthController(),
      RootRoutes.routeLogin: (_) => const LoginScreen(),
      RootRoutes.routeRegistration: (_) => const RegistrationScreen(),
    };
  }
}

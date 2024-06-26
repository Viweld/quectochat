import 'package:flutter/material.dart';

import '../../screens/login_screen/login_screen.dart';
import '../../screens/registration_screen/registration_screen.dart';

class RootRoutes {
  static const String routeLogin = 'routeLogin/';
  static const String routeRegistration = 'routeRegistration/';

  // ---------------------------------------------------------------------------
  static Map<String, WidgetBuilder> getRouteBuilders() {
    return {
      RootRoutes.routeLogin: (_) => const LoginScreen(),
      RootRoutes.routeRegistration: (_) => const RegistrationScreen(),
    };
  }
}

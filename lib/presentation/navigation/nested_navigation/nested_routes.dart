import 'package:flutter/material.dart';

import '../../screens/home_screen/home_screen.dart';

class NestedRoutes {
  static const String routeRoot = '/';

  static const String routeHome = 'routeHome/';

  // ---------------------------------------------------------------------------
  static Map<String, WidgetBuilder> getRouteBuilders() {
    return {
      NestedRoutes.routeHome: (_) => const HomeScreen(),
    };
  }
}

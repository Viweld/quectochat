import 'package:flutter/material.dart';

import '../../screens/home_screen/home_screen.dart';

class NestedNavigatorRoutes {
  static const String routeRoot = '/';

  static const String routeHome = 'routeHome/';

  // ---------------------------------------------------------------------------
  static Map<String, WidgetBuilder> prepareRouteBuilders() {
    return {
      NestedNavigatorRoutes.routeHome: (_) => const HomeScreen(),
    };
  }
}

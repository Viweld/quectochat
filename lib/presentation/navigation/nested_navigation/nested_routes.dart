import 'package:flutter/material.dart';

import '../../screens/chat_screen/chat_screen.dart';
import '../../screens/home_screen/home_screen.dart';

class NestedRoutes {
  static const String routeRoot = '/';

  static const String routeHome = 'routeHome/';
  static const String routeChat = 'routeChat/';

  // ---------------------------------------------------------------------------
  static Map<String, WidgetBuilder> getRouteBuilders() {
    return {
      NestedRoutes.routeHome: (_) => const HomeScreen(),
      NestedRoutes.routeChat: (_) => const ChatScreen(),
    };
  }
}

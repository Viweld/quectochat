import 'package:flutter/material.dart';

import 'nested_routes.dart';

class NestedNavigator extends StatelessWidget {
  NestedNavigator({
    required this.tabNavigatorKey,
    required this.initialRoute,
    super.key,
  }) {
    _routeBuilders = NestedRoutes.getRouteBuilders();
  }

  final GlobalKey<NavigatorState> tabNavigatorKey;
  final String initialRoute;
  late final Map<String, WidgetBuilder> _routeBuilders;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: tabNavigatorKey,
      observers: [HeroController()],
      initialRoute: NestedRoutes.routeRoot,
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) => _routeBuilders[
              routeSettings.name == NestedRoutes.routeRoot
                  ? initialRoute
                  : routeSettings.name]!(context),
        );
      },
    );
  }
}

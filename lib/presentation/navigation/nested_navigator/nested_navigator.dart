import 'package:flutter/material.dart';

import 'nested_navigator_routes.dart';

class NestedNavigator extends StatelessWidget {
  NestedNavigator({
    required this.tabNavigatorKey,
    required this.initialRoute,
    super.key,
  }) {
    _routeBuilders = NestedNavigatorRoutes.prepareRouteBuilders();
  }

  final GlobalKey<NavigatorState> tabNavigatorKey;
  final String initialRoute;
  late final Map<String, WidgetBuilder> _routeBuilders;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: tabNavigatorKey,
      observers: [HeroController()],
      initialRoute: NestedNavigatorRoutes.routeRoot,
      onGenerateRoute: (routeSettings) {
        return PageRouteBuilder(
          settings: routeSettings,
          pageBuilder: (context, _, __) => _routeBuilders[
              routeSettings.name == NestedNavigatorRoutes.routeRoot
                  ? initialRoute
                  : routeSettings.name]!(context),
        );
      },
    );
  }
}

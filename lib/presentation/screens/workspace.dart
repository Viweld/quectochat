import 'package:flutter/material.dart';
import 'package:quectochat/presentation/navigation/nested_navigator/nested_navigator.dart';
import 'package:quectochat/presentation/navigation/nested_navigator/nested_navigator_routes.dart';

class Workspace extends StatefulWidget {
  const Workspace({super.key});

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  final _globalKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return NestedNavigator(
      tabNavigatorKey: _globalKey,
      initialRoute: NestedNavigatorRoutes.routeHome,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quectochat/presentation/navigation/nested_navigation/nested_navigator.dart';
import 'package:quectochat/presentation/navigation/nested_navigation/nested_routes.dart';

class Workspace extends StatefulWidget {
  const Workspace({super.key});

  @override
  State<Workspace> createState() => _WorkspaceState();
}

class _WorkspaceState extends State<Workspace> {
  final _globalKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: _onPopInvoked,
      child: NestedNavigator(
        tabNavigatorKey: _globalKey,
        initialRoute: NestedRoutes.routeHome,
      ),
    );
  }

  void _onPopInvoked(didPop, result) {
    if (didPop) return;
    if (_globalKey.currentState?.canPop() ?? false) {
      // если путь назад возможен, то переходим на домашний экран
      _globalKey.currentState?.pop();
    } else {
      // иначе закрываем приложение
      SystemNavigator.pop();
    }
  }
}

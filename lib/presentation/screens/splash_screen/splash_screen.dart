import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';

import '../../navigation/root_navigation/root_routes.dart';
import 'bloc/splash_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.depGen().buildSplashBloc(),
      child: BlocListener<SplashBloc, SplashState>(
        listenWhen: (_, state) => state.maybeMap(
          initializationCompleted: (_) => true,
          orElse: () => false,
        ),
        listener: (context, state) => state.mapOrNull(
          initializationCompleted: (_) => _initializationCompleted(context),
        ),
        child: const SizedBox(),
      ),
    );
  }

  void _initializationCompleted(BuildContext context) {
    // 1. Прячем нативный splash
    FlutterNativeSplash.remove();

    // 2. Подставляем вместо splash контроллер авторизации
    Navigator.pushReplacementNamed(
      context,
      RootRoutes.routeAuthController,
    );
  }
}

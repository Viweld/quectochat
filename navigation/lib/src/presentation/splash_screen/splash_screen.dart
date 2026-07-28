import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:navigation/src/presentation/splash_screen/bloc/splash_bloc.dart';
import 'package:navigation/src/presentation/splash_screen/splash_content.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppNavigator navigator = appLocator<AppNavigator>();

    return BlocProvider<SplashBloc>(
      create: (BuildContext context) => appLocator<SplashBloc>(),
      child: BlocConsumer<SplashBloc, SplashState>(
        listenWhen: (SplashState previous, SplashState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, SplashState state) async {
          final SplashEffect? effect = state.effect;
          if (effect == null) return;

          await effect.when(
            navigateLogin: () => _navigateAfterInit(context, navigator.navigateLogin),
            navigateHome: () => _navigateAfterInit(context, navigator.navigateHome),
          );

          if (!context.mounted) return;
          context.read<SplashBloc>().add(const SplashEvent.effectHandled());
        },
        builder: (BuildContext context, SplashState state) => const SplashContent(),
      ),
    );
  }

  Future<void> _navigateAfterInit(BuildContext context, Future<void> Function() navigate) async {
    final List<String> precacheImages = <String>[Images.logo];
    for (final String image in precacheImages) {
      await precacheImage(Image.asset(image).image, context);
    }

    FlutterNativeSplash.remove();

    if (!context.mounted) return;
    await navigate();
  }
}

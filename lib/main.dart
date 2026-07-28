import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:navigation/navigation.dart';
import 'package:quectochat/di/app_di.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

Future<void> main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await initializeFirebaseApp();
  installFirebaseMessagingBackgroundHandler();
  installCrashlyticsHandlers();
  await initializeSupabaseApp();

  await configureDependencies();

  runApp(const DynamicTheme(child: LocaleProvider(child: Application())));
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = appLocator<AppRouter>();
    final AuthStatusReevaluateListenable reevaluateListenable =
        appLocator<AuthStatusReevaluateListenable>();

    return MaterialApp.router(
      title: 'Quecto chat',
      theme: DynamicTheme.themeOf(context),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: LocaleProvider.of(context)!.locale,
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter.config(
        navigatorObservers: () => <NavigatorObserver>[appRouter.routeObserver],
        reevaluateListenable: reevaluateListenable,
      ),
      builder: (BuildContext context, Widget? child) {
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: context.palette.white,
            statusBarIconBrightness: context.palette.statusBarIconBrightness,
            statusBarBrightness: context.palette.statusBarBrightness,
          ),
          child: AppToastListener(child: child ?? const SizedBox.shrink()),
        );
      },
    );
  }
}

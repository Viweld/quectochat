import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:navigation/navigation.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:quectochat/di/app_di.dart';
import 'package:quectochat/foreground_tracking_coordinator.dart';
import 'package:quectochat/push_token_coordinator.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await initializeFirebaseApp();
  installFirebaseMessagingBackgroundHandler();
  await configureFirebaseMessagingPresentation();
  installCrashlyticsHandlers();
  await initializeSupabaseApp();

  await configureDependencies();

  PushTokenCoordinator(
    authenticationStatePort: appLocator<AuthenticationStatePort>(),
    pushNotificationPort: appLocator<PushNotificationPort>(),
  ).start();

  ForegroundTrackingCoordinator(
    authenticationStatePort: appLocator<AuthenticationStatePort>(),
    chatDeliveryAckPort: appLocator<ChatDeliveryAckPort>(),
    presencePort: appLocator<PresencePort>(),
    badgeSyncPort: appLocator<BadgeSyncPort>(),
  ).start();

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
            statusBarColor: context.colors.background.main,
            statusBarIconBrightness: context.colors.statusBarIconBrightness,
            statusBarBrightness: context.colors.statusBarBrightness,
          ),
          child: AppToastListener(child: child ?? const SizedBox.shrink()),
        );
      },
    );
  }
}

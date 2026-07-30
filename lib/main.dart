import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:infrastructure/infrastructure.dart';
import 'package:navigation/navigation.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:quectochat/di/app_di.dart';
import 'package:quectochat/foreground_tracking_coordinator.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await initializeFirebaseApp();
  installFirebaseMessagingBackgroundHandler();
  installCrashlyticsHandlers();
  await initializeSupabaseApp();

  await configureDependencies();
  await _registerPushToken();

  ForegroundTrackingCoordinator(
    authenticationStatePort: appLocator<AuthenticationStatePort>(),
    chatDeliveryAckPort: appLocator<ChatDeliveryAckPort>(),
    presencePort: appLocator<PresencePort>(),
  ).start();

  runApp(const DynamicTheme(child: LocaleProvider(child: Application())));
}

Future<void> _registerPushToken() async {
  if (!Platform.isAndroid && !Platform.isIOS) return;

  try {
    final FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission();
    final String? token = await messaging.getToken();
    if (token == null || token.isEmpty) return;

    final PushNotificationPort pushPort = appLocator<PushNotificationPort>();
    final String platform = Platform.isIOS ? 'ios' : 'android';

    await pushPort.registerDeviceToken(token: token, platform: platform);
    messaging.onTokenRefresh.listen((String refreshed) {
      unawaited(pushPort.registerDeviceToken(token: refreshed, platform: platform));
    });
  } on Object catch (error, stackTrace) {
    log('Failed to register FCM token', error: error, stackTrace: stackTrace);
  }
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

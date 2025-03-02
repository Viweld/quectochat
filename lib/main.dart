import 'dart:async';
import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/navigation/root_navigation/root_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'domain/environment/builders.dep_gen.dart';
import 'domain/environment/environment.dart';
import 'firebase_options.dart';
import 'l10n/locale_provider.dart';
import 'presentation/theme/dynamic_theme.dart';

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // удерживаем отображение нативного splashScreen:
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // инициализируем Firebase:
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // подключаем обработчик сообщений, приходящих когда приложение не используется:
  FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);

  // устанавливаем обработчики ошибок:
  _addExceptionsHandlers();

  runApp(
    DepProvider(
      environment: (await Environment().prepare()).lock(),
      child: const DynamicTheme(
        child: LocaleProvider(
          child: Application(),
        ),
      ),
    ),
  );
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// ПРИЛОЖЕНИЕ
class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quecto chat',
      theme: DynamicTheme.themeOf(context),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: LocaleProvider.of(context)!.locale,
      initialRoute: RootRoutes.routeSplash,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (routeSettings) => MaterialPageRoute(
        settings: routeSettings,
        builder: (context) => AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: context.palette.white,
            statusBarIconBrightness: context.palette.statusBarIconBrightness,
            statusBarBrightness: context.palette.statusBarBrightness,
          ),
          child: RootRoutes.getRouteBuilders()[routeSettings.name]!(context),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Добавляет обработчики исключений
void _addExceptionsHandlers() {
  // Handle Flutter framework errors
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    FirebaseCrashlytics.instance.recordFlutterFatalError(details);
  };

  // A callback that is invoked when an unhandled error occurs in the root isolate.
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
/// Верхнеуровневая функция-обработчик
@pragma('vm:entry-point')
Future<void> _onBackgroundMessage(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // TODO(Vadim): #unimplemented обработчик пушей, пришедших пока приложение было неактивно
  // NotificationsManager.instance.parseRemoteNotification(
  //   message,
  //   MessageType.background,
  // );
}

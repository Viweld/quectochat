import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quectochat/presentation/navigation/root_navigation/root_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'domain/environment/builders.dep_gen.dart';
import 'domain/environment/environment.dart';
import 'l10n/locale_provider.dart';
import 'presentation/theme/dynamic_theme.dart';

/// Параметры подключения Firebase
const FirebaseOptions _firebaseOptions = FirebaseOptions(
  apiKey: 'AIzaSyAtQQ1JYca7U3oVHdBCmXcCIPyTua86YWw',
  appId: '1:450239422144:android:bed778b376cfaa0e309725',
  messagingSenderId: '450239422144',
  projectId: 'quectochat',
  storageBucket: 'quectochat.appspot.com',
);

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
void main() {
  unawaited(
    runZonedGuarded(
      () async {
        final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
        FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

        await Firebase.initializeApp(options: _firebaseOptions);

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
      },
      (e, s) => debugPrint('>>> ERROR:\n$e\n>>> STACKTRACE:\n$s'),
    ),
  );
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
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
      onGenerateRoute: (routeSettings) {
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (context) =>
              RootRoutes.getRouteBuilders()[routeSettings.name]!(context),
        );
      },
    );
  }
}

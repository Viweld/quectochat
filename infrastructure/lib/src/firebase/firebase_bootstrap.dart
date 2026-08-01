import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:app_badge_plus/app_badge_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

import 'package:infrastructure/src/firebase/firebase_options.dart';

/// Initializes Firebase with platform options.
Future<void> initializeFirebaseApp() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}

/// Registers Crashlytics handlers for Flutter and platform errors.
void installCrashlyticsHandlers() {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    if (_isExpectedTransportFailure(details.exception) ||
        _isKnownRealtimePresenceGlitch(details.exception, details.stack)) {
      return;
    }
    FirebaseCrashlytics.instance.recordFlutterFatalError(details);
  };

  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    if (_isExpectedTransportFailure(error) || _isKnownRealtimePresenceGlitch(error, stack)) {
      log(
        'Suppressed known realtime presence glitch',
        name: 'Crashlytics',
        error: error,
        stackTrace: stack,
      );
      return true;
    }
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
}

bool _isExpectedTransportFailure(Object error) {
  final String text = error.toString().toLowerCase();
  return text.contains('socketexception') ||
      text.contains('failed host lookup') ||
      text.contains('no address associated with hostname') ||
      text.contains('network is unreachable') ||
      text.contains('connection refused') ||
      text.contains('connection timed out') ||
      text.contains('clientexception with socketexception');
}

/// Known realtime_client cast crash on presence sync when `phx_ref` is missing.
bool _isKnownRealtimePresenceGlitch(Object error, StackTrace? stack) {
  final String message = error.toString();
  if (!message.contains("type 'Null' is not a subtype of type 'String'")) {
    return false;
  }
  final String stackText = stack?.toString() ?? '';
  return stackText.contains('RealtimePresence') ||
      stackText.contains('realtime_presence.dart') ||
      stackText.contains('presenceState');
}

/// Registers the background FCM handler.
void installFirebaseMessagingBackgroundHandler() {
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
}

/// Configures how FCM presents notifications while the app is in foreground.
Future<void> configureFirebaseMessagingPresentation() async {
  if (!Platform.isIOS) return;

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(badge: true);
}

/// Top-level background message handler (must be a top-level function).
@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  if (!Platform.isAndroid) return;

  final String? rawUnreadCount = message.data['unreadCount'];
  if (rawUnreadCount == null || rawUnreadCount.isEmpty) return;

  final int? unreadCount = int.tryParse(rawUnreadCount);
  if (unreadCount == null) return;

  try {
    final bool isSupported = await AppBadgePlus.isSupported();
    if (!isSupported) return;
    await AppBadgePlus.updateBadge(unreadCount);
  } on Object catch (error, stackTrace) {
    log(
      'Failed to update Android badge from background push',
      name: 'firebaseMessagingBackgroundHandler',
      error: error,
      stackTrace: stackTrace,
    );
  }
}

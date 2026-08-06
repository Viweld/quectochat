import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/widgets.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

/// Opens the chat screen for push notifications when the user taps them.
///
/// Edge Function `send-push` sends `data.fromId` plus sender names.
/// On cold-start we wait for auth to become authorized, then navigate.
final class PushNotificationTapCoordinator {
  PushNotificationTapCoordinator({
    required AuthenticationStatePort authenticationStatePort,
    required AppNavigator appNavigator,
  }) : _authenticationStatePort = authenticationStatePort,
       _appNavigator = appNavigator;

  final AuthenticationStatePort _authenticationStatePort;
  final AppNavigator _appNavigator;

  StreamSubscription<AuthStatus>? _authSubscription;
  StreamSubscription<RemoteMessage>? _onMessageOpenedAppSubscription;

  RemoteMessage? _pendingMessage;
  bool _navigationInProgress = false;
  String? _lastHandledKey;

  void start() {
    _authSubscription = _authenticationStatePort.authStatusStream.listen((AuthStatus status) {
      if (status == AuthStatus.authorized) {
        unawaited(_tryNavigateIfReady());
      }
    });

    unawaited(_handleInitialMessage());
    _onMessageOpenedAppSubscription = FirebaseMessaging.onMessageOpenedApp.listen(
      _onMessageOpenedApp,
    );
  }

  Future<void> dispose() async {
    await _authSubscription?.cancel();
    _authSubscription = null;
    await _onMessageOpenedAppSubscription?.cancel();
    _onMessageOpenedAppSubscription = null;
  }

  Future<void> _handleInitialMessage() async {
    final RemoteMessage? initial = await FirebaseMessaging.instance.getInitialMessage();
    if (initial == null) return;
    _setPendingAndTryNavigate(initial);
  }

  void _onMessageOpenedApp(RemoteMessage message) {
    _setPendingAndTryNavigate(message);
  }

  void _setPendingAndTryNavigate(RemoteMessage message) {
    final String key = _messageKey(message);
    if (_lastHandledKey != null && _lastHandledKey == key) return;
    _lastHandledKey = key;

    _pendingMessage = message;
    unawaited(_tryNavigateIfReady());
  }

  Future<void> _tryNavigateIfReady() async {
    if (_navigationInProgress) return;
    if (_pendingMessage == null) return;
    if (_authenticationStatePort.authStatus != AuthStatus.authorized) return;

    final RemoteMessage message = _pendingMessage!;
    _pendingMessage = null;
    _navigationInProgress = true;

    final Map<String, dynamic> data = message.data;
    final String? interlocutorId = data['fromId']?.toString();
    final String? fromDisplayNameRaw = data['fromDisplayName']?.toString();

    final String displayName = (fromDisplayNameRaw == null || fromDisplayNameRaw.trim().isEmpty)
        ? 'QuectoChat'
        : fromDisplayNameRaw.trim();

    if (interlocutorId == null || interlocutorId.isEmpty) {
      _navigationInProgress = false;
      return;
    }

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      try {
        await _appNavigator.navigateChat(interlocutorId: interlocutorId, displayName: displayName);
      } on Object catch (error, stackTrace) {
        logInfrastructureFailure(
          'Failed to navigate to chat from push tap',
          name: 'PushNotificationTapCoordinator',
          error: error,
          stackTrace: stackTrace,
        );
      } finally {
        _navigationInProgress = false;
      }
    });
  }

  String _messageKey(RemoteMessage message) {
    if (message.messageId != null) return message.messageId!;
    final String fromId = message.data['fromId']?.toString() ?? '';
    final int sentTime = message.sentTime?.millisecondsSinceEpoch ?? 0;
    return '${fromId}_$sentTime';
  }
}

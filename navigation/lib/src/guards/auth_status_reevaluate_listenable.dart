import 'dart:async';

import 'package:auto_route/annotations.dart' show AutoRouterConfig;
import 'package:auto_route/auto_route.dart' show AutoRouterConfig;
import 'package:flutter/foundation.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart' show AutoRouterConfig;

/// Notifies [AutoRouterConfig] to re-run guards when auth status changes.
final class AuthStatusReevaluateListenable extends ChangeNotifier {
  AuthStatusReevaluateListenable(AuthenticationStatePort authenticationStatePort) {
    _subscription = authenticationStatePort.authStatusStream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<Object?> _subscription;

  @override
  void dispose() {
    unawaited(_subscription.cancel());
    super.dispose();
  }
}

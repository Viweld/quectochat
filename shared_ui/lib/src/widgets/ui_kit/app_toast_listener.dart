import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';

import 'package:shared_ui/src/extensions/context_extensions.dart';
import 'package:shared_ui/src/widgets/ui_kit/app_toast.dart';

/// Listens to [AppToastBus] and shows [AppToast] for infrastructure errors.
final class AppToastListener extends StatefulWidget {
  const AppToastListener({super.key, required this.child});

  final Widget child;

  @override
  State<AppToastListener> createState() => _AppToastListenerState();
}

final class _AppToastListenerState extends State<AppToastListener> {
  StreamSubscription<AppToastEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    if (appLocator.isRegistered<AppToastBus>()) {
      _subscription = appLocator<AppToastBus>().stream.listen(_onToast);
    }
  }

  @override
  void dispose() {
    unawaited(_subscription?.cancel());
    super.dispose();
  }

  void _onToast(AppToastEvent event) {
    if (!mounted) return;
    final String text = switch (event) {
      ErrorToastEvent(:final String? message, :final AppToastErrorKind errorKind) =>
        message ?? _resolveErrorText(context, errorKind),
      SuccessToastEvent(:final String? message) => message ?? '',
      WarningToastEvent(:final String? message) => message ?? '',
      InfoToastEvent(:final String? message) => message ?? '',
    };
    if (text.isEmpty) return;

    switch (event) {
      case ErrorToastEvent():
        AppToast.showError(context, text: text);
      case SuccessToastEvent():
      case WarningToastEvent():
      case InfoToastEvent():
        AppToast.showInfo(context, text: text);
    }
  }

  String _resolveErrorText(BuildContext context, AppToastErrorKind kind) {
    final AppLocalizations texts = context.texts;
    return switch (kind) {
      AppToastErrorKind.network => texts.toastNetworkError,
      AppToastErrorKind.server => texts.toastServerError,
      AppToastErrorKind.auth => texts.toastAuthError,
      AppToastErrorKind.unexpected => texts.toastUnexpectedError,
      AppToastErrorKind.backendMessage || AppToastErrorKind.generic => texts.toastGenericError,
    };
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

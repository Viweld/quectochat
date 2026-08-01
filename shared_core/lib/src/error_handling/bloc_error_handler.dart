import 'package:injectable/injectable.dart';
import 'package:shared_core/src/error_handling/error_handling_policy.dart';
import 'package:shared_core/src/error_handling/error_presentation.dart';
import 'package:shared_core/src/error_handling/error_reporter.dart';
import 'package:shared_core/src/error_handling/transport_error_classifier.dart';
import 'package:shared_core/src/events/app_toast_bus.dart';
import 'package:shared_core/src/events/app_toast_events.dart';
import 'package:shared_core/src/exceptions/api_exception.dart';

/// Centralized handler for infrastructure errors in BLoCs.
@lazySingleton
final class BlocErrorHandler {
  BlocErrorHandler(this._toastBus, this._policy, this._reporter);

  final AppToastBus _toastBus;
  final ErrorHandlingPolicy _policy;
  final ErrorReporter _reporter;

  /// Handles [error] and returns a presentation directive for the caller.
  ErrorPresentation handle(
    Object error, {
    StackTrace? stackTrace,
    bool isSilent = false,
    bool? forceRethrow,
    Map<String, Object?>? reportContext,
  }) {
    if (_shouldReport(error)) {
      _reporter.recordNonFatal(error, stackTrace ?? StackTrace.current, context: reportContext);
    }

    final bool shouldRethrow = forceRethrow ?? _policy.shouldRethrow(error);
    final ErrorPresentation presentation = _resolvePresentation(
      error,
      shouldRethrow: shouldRethrow,
    );

    if (!isSilent && presentation.kind == ErrorPresentationKind.toast) {
      _fireToast(error, presentation);
    }

    return presentation;
  }

  bool _shouldReport(Object error) {
    if (error is! ApiException) return false;
    // Expected offline / timeout noise must not fill crash dashboards.
    if (error is NetworkException) return false;
    if (classifyTransportError(error) != TransportErrorKind.other) return false;
    return true;
  }

  ErrorPresentation _resolvePresentation(Object error, {required bool shouldRethrow}) {
    if (error is! ApiException) {
      return ErrorPresentation(
        kind: ErrorPresentationKind.toast,
        toastKind: _toastKindForUnknown(error),
        shouldRethrow: shouldRethrow,
      );
    }

    final ErrorPresentationKind kind = _policy.presentationKind(error);
    final AppToastErrorKind toastKind = _policy.toastKind(error);
    final String? transitMessage = switch (error) {
      UnexpectedApiException(:final String? userMessage) => userMessage,
      AuthException(:final String? userMessage) => userMessage,
      _ => null,
    };

    return ErrorPresentation(
      kind: kind,
      toastKind: toastKind,
      transitMessage: transitMessage,
      shouldRethrow: shouldRethrow,
    );
  }

  AppToastErrorKind _toastKindForUnknown(Object error) {
    return switch (classifyTransportError(error)) {
      TransportErrorKind.network => AppToastErrorKind.network,
      TransportErrorKind.server => AppToastErrorKind.server,
      TransportErrorKind.other => AppToastErrorKind.generic,
    };
  }

  void _fireToast(Object error, ErrorPresentation presentation) {
    if (!_policy.shouldShowToast(error) && error is ApiException) return;

    final String? message = presentation.toastKind == AppToastErrorKind.backendMessage
        ? presentation.transitMessage
        : null;

    _toastBus.fire(AppToastEvent.error(message, presentation.toastKind));
  }
}

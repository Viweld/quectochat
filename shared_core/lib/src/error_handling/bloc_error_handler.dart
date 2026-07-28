import 'package:injectable/injectable.dart';

import '../events/app_toast_bus.dart';
import '../events/app_toast_events.dart';
import '../exceptions/api_exception.dart';
import 'error_handling_policy.dart';
import 'error_presentation.dart';
import 'error_reporter.dart';

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
    if (error is ApiException) {
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

  ErrorPresentation _resolvePresentation(Object error, {required bool shouldRethrow}) {
    if (error is! ApiException) {
      return ErrorPresentation(kind: ErrorPresentationKind.toast, shouldRethrow: shouldRethrow);
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

  void _fireToast(Object error, ErrorPresentation presentation) {
    if (!_policy.shouldShowToast(error) && error is ApiException) return;

    final String? message = presentation.toastKind == AppToastErrorKind.backendMessage
        ? presentation.transitMessage
        : null;

    _toastBus.fire(AppToastEvent.error(message, presentation.toastKind));
  }
}

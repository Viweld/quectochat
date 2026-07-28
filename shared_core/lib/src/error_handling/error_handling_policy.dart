import 'package:shared_core/src/error_handling/error_presentation.dart';
import 'package:shared_core/src/exceptions/api_exception.dart';

/// Defines how infrastructure errors are surfaced and whether they rethrow.
final class ErrorHandlingPolicy {
  const ErrorHandlingPolicy({
    this.showToastForNetwork = true,
    this.showToastForServer = true,
    this.showToastForAuth = false,
    this.showToastForUnexpected = true,
    this.rethrowForNetwork = false,
    this.rethrowForServer = false,
    this.rethrowForAuth = false,
    this.rethrowForUnexpected = true,
  });

  final bool showToastForNetwork;
  final bool showToastForServer;
  final bool showToastForAuth;
  final bool showToastForUnexpected;

  final bool rethrowForNetwork;
  final bool rethrowForServer;
  final bool rethrowForAuth;
  final bool rethrowForUnexpected;

  bool shouldShowToast(Object error) => switch (error) {
    NetworkException() => showToastForNetwork,
    ServerException() => showToastForServer,
    AuthException() => showToastForAuth,
    UnexpectedApiException() => showToastForUnexpected,
    _ => showToastForUnexpected,
  };

  bool shouldRethrow(Object error) => switch (error) {
    NetworkException() => rethrowForNetwork,
    ServerException() => rethrowForServer,
    AuthException() => rethrowForAuth,
    UnexpectedApiException() => rethrowForUnexpected,
    _ => rethrowForUnexpected,
  };

  ErrorPresentationKind presentationKind(Object error) => switch (error) {
    AuthException() => ErrorPresentationKind.silent,
    _ => ErrorPresentationKind.toast,
  };

  AppToastErrorKind toastKind(Object error) => switch (error) {
    NetworkException() => AppToastErrorKind.network,
    ServerException() => AppToastErrorKind.server,
    AuthException() => AppToastErrorKind.auth,
    UnexpectedApiException(:final String? userMessage) when userMessage != null =>
      AppToastErrorKind.backendMessage,
    UnexpectedApiException() => AppToastErrorKind.unexpected,
    _ => AppToastErrorKind.generic,
  };
}

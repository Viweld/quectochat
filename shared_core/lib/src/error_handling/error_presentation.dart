import 'package:flutter/foundation.dart';
import 'package:shared_core/src/error_handling/bloc_error_handler.dart';

/// How infrastructure errors should be surfaced in UI.
enum ErrorPresentationKind { toast, inline, silent, retry }

/// Toast category for localized fallback when no backend message is available.
enum AppToastErrorKind { generic, network, server, auth, unexpected, backendMessage }

/// Directive returned by [BlocErrorHandler] after handling an infrastructure error.
@immutable
final class ErrorPresentation {
  const ErrorPresentation({
    required this.kind,
    this.toastKind = AppToastErrorKind.generic,
    this.transitMessage,
    this.shouldRethrow = false,
  });

  final ErrorPresentationKind kind;
  final AppToastErrorKind toastKind;
  final String? transitMessage;
  final bool shouldRethrow;

  static const ErrorPresentation silent = ErrorPresentation(kind: ErrorPresentationKind.silent);
}

/// Structured inline error for BLoC state — UI localizes by [kind].
@immutable
final class AppErrorViewModel {
  const AppErrorViewModel({required this.kind, this.transitMessage});

  final AppErrorKind kind;
  final String? transitMessage;
}

/// Inline error identifiers — mapped to localized strings in UI.
enum AppErrorKind {
  invalidCredential,
  userNotFound,
  wrongPassword,
  weakPassword,
  emailAlreadyUsed,
  validation,
  generic,
}

import 'dart:developer';

import 'package:shared_core/src/error_handling/transport_error_classifier.dart';

/// Logs [message]; omits stack noise for expected offline / unreachable backend errors.
void logInfrastructureFailure(
  String message, {
  required String name,
  required Object error,
  StackTrace? stackTrace,
}) {
  if (classifyTransportError(error) != TransportErrorKind.other) {
    log('$message (backend unreachable)', name: name);
    return;
  }
  log(message, name: name, error: error, stackTrace: stackTrace);
}

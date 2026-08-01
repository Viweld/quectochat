import 'dart:async';

import 'package:shared_core/src/exceptions/api_exception.dart';

/// Coarse transport failure category for user-facing messaging.
enum TransportErrorKind {
  /// No usable network path (DNS, offline, broken socket).
  network,

  /// Remote service unreachable or not responding (timeout, 5xx, refused).
  server,

  /// Not a transport failure (or cannot be classified).
  other,
}

/// Classifies [error] (and optional [message]) into a [TransportErrorKind].
TransportErrorKind classifyTransportError(Object error, {String? message}) {
  if (error is NetworkException) {
    return switch (error.kind) {
      NetworkExceptionKind.offline => TransportErrorKind.network,
      NetworkExceptionKind.timeout => TransportErrorKind.server,
      NetworkExceptionKind.unknown => TransportErrorKind.network,
    };
  }

  if (error is TimeoutException) {
    return TransportErrorKind.server;
  }

  final Object? cause = switch (error) {
    ServerException(:final Object? cause) => cause,
    AuthException(:final Object? cause) => cause,
    UnexpectedApiException(:final Object? cause) => cause,
    _ => null,
  };
  if (cause != null && !identical(cause, error)) {
    final TransportErrorKind fromCause = classifyTransportError(cause);
    if (fromCause != TransportErrorKind.other) {
      return fromCause;
    }
  }

  return classifyTransportFailureText(_combinedFailureText(error, message));
}

/// Classifies a free-form failure text (e.g. wrapped Supabase AuthException.message).
TransportErrorKind classifyTransportFailureText(String text) {
  final String normalized = text.toLowerCase();
  if (normalized.isEmpty) {
    return TransportErrorKind.other;
  }

  if (_dnsOfflineMarkers.any(normalized.contains)) {
    return TransportErrorKind.network;
  }
  if (_serverMarkers.any(normalized.contains)) {
    return TransportErrorKind.server;
  }
  if (_genericNetworkMarkers.any(normalized.contains)) {
    return TransportErrorKind.network;
  }
  return TransportErrorKind.other;
}

String _combinedFailureText(Object error, String? message) {
  final StringBuffer buffer = StringBuffer();
  if (message != null && message.isNotEmpty) {
    buffer.write(message);
    buffer.write(' ');
  }
  buffer.write(error.toString());
  return buffer.toString();
}

const List<String> _dnsOfflineMarkers = <String>[
  'failed host lookup',
  'no address associated with hostname',
  'network is unreachable',
  'network_unreachable',
  'nodename nor servname',
  'name or service not known',
  'errno = 7',
  'errno = 8',
  'errno = 51',
  'errno = 65',
  'os error: network',
];

const List<String> _serverMarkers = <String>[
  'timed out',
  'timeout',
  'connection refused',
  'connection timed out',
  'gateway timeout',
  'bad gateway',
  'service unavailable',
  'http status 502',
  'http status 503',
  'http status 504',
  'status code: 502',
  'status code: 503',
  'status code: 504',
];

const List<String> _genericNetworkMarkers = <String>[
  'socketexception',
  'connection closed',
  'connection reset',
  'software caused connection abort',
  'broken pipe',
];

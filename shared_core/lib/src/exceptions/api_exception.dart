import 'package:shared_core/src/exceptions/request_context.dart';

/// Base sealed exception for infrastructure / transport errors.
sealed class ApiException implements Exception {
  RequestContext get context;
}

/// Network / connectivity failure when no usable response is available.
final class NetworkException extends ApiException {
  NetworkException({required this.kind, required this.context, this.cause});

  final NetworkExceptionKind kind;
  @override
  final RequestContext context;
  final Object? cause;

  @override
  String toString() => 'NetworkException($kind, $context)';
}

enum NetworkExceptionKind { offline, timeout, unknown }

/// Remote service failure (Firebase / backend).
final class ServerException extends ApiException {
  ServerException({required this.context, this.cause});

  @override
  final RequestContext context;
  final Object? cause;

  @override
  String toString() => 'ServerException($context)';
}

/// Authentication / authorization failure at the transport layer.
final class AuthException extends ApiException {
  AuthException({required this.context, this.code, this.userMessage, this.cause});

  @override
  final RequestContext context;
  final String? code;
  final String? userMessage;
  final Object? cause;

  @override
  String toString() => 'AuthException(code: $code, $context)';
}

/// Fallback for unclassified infrastructure errors.
final class UnexpectedApiException extends ApiException {
  UnexpectedApiException({required this.context, this.userMessage, this.cause});

  @override
  final RequestContext context;
  final String? userMessage;
  final Object? cause;

  @override
  String toString() => 'UnexpectedApiException($context)';
}

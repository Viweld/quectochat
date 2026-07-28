import 'dart:developer' as developer;

import 'package:injectable/injectable.dart';

import 'error_reporter.dart';

/// Default reporter: logs via [developer.log]. Replace with Crashlytics in production.
@LazySingleton(as: ErrorReporter)
final class LoggingErrorReporter implements ErrorReporter {
  const LoggingErrorReporter();

  @override
  void recordNonFatal(Object error, StackTrace stackTrace, {Map<String, Object?>? context}) {
    developer.log('Non-fatal error', name: 'ErrorReporter', error: error, stackTrace: stackTrace);
  }

  @override
  void recordFatal(Object error, StackTrace stackTrace, {Map<String, Object?>? context}) {
    developer.log('Fatal error', name: 'ErrorReporter', error: error, stackTrace: stackTrace);
  }
}

/// Silent reporter for tests or when reporting is disabled.
final class NoOpErrorReporter implements ErrorReporter {
  const NoOpErrorReporter();

  @override
  void recordNonFatal(Object error, StackTrace stackTrace, {Map<String, Object?>? context}) {}

  @override
  void recordFatal(Object error, StackTrace stackTrace, {Map<String, Object?>? context}) {}
}

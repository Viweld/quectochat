/// Abstraction over crash/analytics reporting backends (Crashlytics, Sentry, etc.).
abstract interface class ErrorReporter {
  void recordNonFatal(Object error, StackTrace stackTrace, {Map<String, Object?>? context});

  void recordFatal(Object error, StackTrace stackTrace, {Map<String, Object?>? context});
}

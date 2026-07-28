import 'package:injectable/injectable.dart';

import 'error_handling_policy.dart';

@module
abstract class ErrorHandlingModule {
  @lazySingleton
  ErrorHandlingPolicy errorHandlingPolicy() => const ErrorHandlingPolicy();
}

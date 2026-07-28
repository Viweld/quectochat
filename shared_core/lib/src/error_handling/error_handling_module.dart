import 'package:injectable/injectable.dart';

import 'package:shared_core/src/error_handling/error_handling_policy.dart';

@module
abstract class ErrorHandlingModule {
  @lazySingleton
  ErrorHandlingPolicy errorHandlingPolicy() => const ErrorHandlingPolicy();
}

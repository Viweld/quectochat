// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_core/src/error_handling/bloc_error_handler.dart' as _i989;
import 'package:shared_core/src/error_handling/error_handling_module.dart' as _i769;
import 'package:shared_core/src/error_handling/error_handling_policy.dart' as _i1029;
import 'package:shared_core/src/error_handling/error_reporter.dart' as _i602;
import 'package:shared_core/src/error_handling/logging_error_reporter.dart' as _i457;
import 'package:shared_core/src/events/app_toast_bus.dart' as _i1041;

class SharedCorePackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final errorHandlingModule = _$ErrorHandlingModule();
    gh.lazySingleton<_i1029.ErrorHandlingPolicy>(() => errorHandlingModule.errorHandlingPolicy());
    gh.lazySingleton<_i1041.AppToastBus>(() => _i1041.AppToastBus(), dispose: (i) => i.dispose());
    gh.lazySingleton<_i602.ErrorReporter>(() => const _i457.LoggingErrorReporter());
    gh.lazySingleton<_i989.BlocErrorHandler>(
      () => _i989.BlocErrorHandler(
        gh<_i1041.AppToastBus>(),
        gh<_i1029.ErrorHandlingPolicy>(),
        gh<_i602.ErrorReporter>(),
      ),
    );
  }
}

class _$ErrorHandlingModule extends _i769.ErrorHandlingModule {}

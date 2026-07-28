/// Shared kernel — locator, localization, error handling, utilities.
library;

export 'package:auto_route/auto_route.dart';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:get_it/get_it.dart';
export 'package:injectable/injectable.dart';

export 'src/di/configure_dependencies.module.dart';
export 'src/di/locator.dart';
export 'src/error_handling/bloc_error_handler.dart';
export 'src/error_handling/error_handling_policy.dart';
export 'src/error_handling/error_presentation.dart';
export 'src/error_handling/error_reporter.dart';
export 'src/error_handling/logging_error_reporter.dart';
export 'src/events/app_toast_bus.dart';
export 'src/events/app_toast_events.dart';
export 'src/exceptions/api_exception.dart';
export 'src/exceptions/request_context.dart';
export 'src/extensions/iterable_extensions.dart';
export 'src/l10n/app_localizations.dart';
export 'src/locale_provider.dart';
export 'src/utils/debouncer.dart';
export 'src/utils/id_tools.dart';

import 'package:flutter/foundation.dart';

import 'package:shared_core/src/error_handling/error_presentation.dart';

@immutable
sealed class AppToastEvent {
  const AppToastEvent._([this.message]);

  final String? message;

  const factory AppToastEvent.error([String? message, AppToastErrorKind errorKind]) =
      ErrorToastEvent;

  const factory AppToastEvent.success([String? message]) = SuccessToastEvent;

  const factory AppToastEvent.warning([String? message]) = WarningToastEvent;

  const factory AppToastEvent.info([String? message]) = InfoToastEvent;
}

final class ErrorToastEvent extends AppToastEvent {
  const ErrorToastEvent([super.message, this.errorKind = AppToastErrorKind.generic]) : super._();

  final AppToastErrorKind errorKind;
}

final class SuccessToastEvent extends AppToastEvent {
  const SuccessToastEvent([super.message]) : super._();
}

final class WarningToastEvent extends AppToastEvent {
  const WarningToastEvent([super.message]) : super._();
}

final class InfoToastEvent extends AppToastEvent {
  const InfoToastEvent([super.message]) : super._();
}

part of 'registration_bloc.dart';

@freezed
sealed class RegistrationEffect with _$RegistrationEffect {
  const factory RegistrationEffect.showError(AppErrorKind kind) = _ShowError;
}

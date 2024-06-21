part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  /// ВНУТРЕНЕЕ событие "изменился статус аутентификации"
  const factory AuthEvent.onAuthStatusChanged(
    AuthStatus val,
  ) = _EventOnAuthStatusChanged;
}

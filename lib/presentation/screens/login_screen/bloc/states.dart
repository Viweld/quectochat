part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  /// основное состояние вью
  const factory LoginState.view({
    required String data,
  }) = _StateView;
}

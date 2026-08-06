part of 'invite_code_bloc.dart';

@freezed
abstract class InviteCodeState with _$InviteCodeState {
  const factory InviteCodeState({
    @Default('') String code,
    @Default(false) bool isLoading,
    AppErrorViewModel? inlineError,
    InviteCodeEffect? effect,
  }) = _InviteCodeState;
}

extension InviteCodeStateX on InviteCodeState {
  bool get isCodeComplete => code.length == 8;
}

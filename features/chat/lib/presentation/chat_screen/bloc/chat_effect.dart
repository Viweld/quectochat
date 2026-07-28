part of 'chat_bloc.dart';

@freezed
sealed class ChatEffect with _$ChatEffect {
  const factory ChatEffect.showError({required AppErrorKind kind, String? transitMessage}) =
      _ShowError;
}

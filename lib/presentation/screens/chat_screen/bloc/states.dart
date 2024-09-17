part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  /// основное состояние вью
  const factory ChatState.view() = _StateView;

  /// состояние ошибки для отображения тоаста
  const factory ChatState.requestError({
    String? errorText,
  }) = _StateRequestError;
}

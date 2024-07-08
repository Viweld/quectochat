part of 'chat_bloc.dart';

@freezed
class ChatState with _$ChatState {
  /// ожидание инициализации экрана
  const factory ChatState.pending() = _StatePending;

  /// основное состояние вью
  const factory ChatState.view({
    @Default('') String typedMessage,
    @Default([]) Iterable<ChatMessage> messages,
  }) = _StateView;

  /// состояние ошибки для отображения тоаста
  const factory ChatState.requestError({
    String? errorText,
  }) = _StateRequestError;
}

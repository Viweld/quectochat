part of 'typing_view_bloc.dart';

@freezed
abstract class TypingViewState with _$TypingViewState {
  const factory TypingViewState({
    required String interlocutorId,
    @Default('') String typedMessage,
    @Default(false) bool isSending,
    TypingViewEffect? effect,
  }) = _TypingViewState;
}

part of 'typing_view_bloc.dart';

@freezed
class TypingViewState with _$TypingViewState {
  /// основное состояние вью
  const factory TypingViewState.view({
    @Default('') String typedMessage,
  }) = _StateView;
}

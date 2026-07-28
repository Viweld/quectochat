part of 'typing_view_bloc.dart';

@freezed
sealed class TypingViewEffect with _$TypingViewEffect {
  const factory TypingViewEffect.showError(AppErrorKind kind) = _ShowError;
}

part of 'typing_view_bloc.dart';

@freezed
sealed class TypingViewEvent with _$TypingViewEvent {
  const factory TypingViewEvent.onMessageChanged(String val) = _EventOnMessageChanged;

  const factory TypingViewEvent.onSendTapped({required String text}) = _EventOnSendTapped;

  const factory TypingViewEvent.onImagePicked({required String filePath}) = _EventOnImagePicked;
}

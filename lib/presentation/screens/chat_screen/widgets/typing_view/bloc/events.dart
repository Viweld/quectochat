part of 'typing_view_bloc.dart';

@freezed
class TypingViewEvent with _$TypingViewEvent {
  /// ВНЕШНЕЕ событие "изменен текст в поле написания сообщения"
  const factory TypingViewEvent.onMessageChanged(
    String val,
  ) = _EventOnMessageChanged;

  /// ВНЕШНЕЕ событие "нажата кнопка отправить"
  const factory TypingViewEvent.onSendTapped() = _EventOnSendTapped;
}

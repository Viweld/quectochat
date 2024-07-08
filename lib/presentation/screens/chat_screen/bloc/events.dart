part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  /// ВНУТРЕННЕЕ событие "запрос на инициализацию"
  const factory ChatEvent.onInitializationRequested() =
      _EventOnInitializationRequested;

  /// ВНУТРЕННЕЕ событие "обновилось состояние"
  const factory ChatEvent.onStateChanged() = _EventOnStateChanged;

  /// ВНЕШНЕЕ событие "изменен текст в поле написания сообщения"
  const factory ChatEvent.onMessageChanged(
    String val,
  ) = _EventOnMessageChanged;

  /// ВНЕШНЕЕ событие "нажата кнопка отправить"
  const factory ChatEvent.onSendTapped() = _EventOnSendTapped;
}

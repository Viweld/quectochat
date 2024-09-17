part of 'chat_bloc.dart';

@freezed
class ChatEvent with _$ChatEvent {
  /// ВНУТРЕННЕЕ событие "запрос на инициализацию"
  const factory ChatEvent.onInitializationRequested() =
      _EventOnInitializationRequested;

  /// ВНУТРЕННЕЕ событие "произошла ошибка в репозитории чата"
  const factory ChatEvent.onErrorReceived({String? message}) =
      _EventOnErrorReceived;
}

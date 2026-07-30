part of 'chat_bloc.dart';

@freezed
sealed class ChatEvent with _$ChatEvent {
  /// ВНУТРЕННЕЕ событие "запрос на инициализацию"
  const factory ChatEvent.onInitializationRequested() = _EventOnInitializationRequested;

  /// ВНУТРЕННЕЕ событие "произошла ошибка в репозитории чата"
  const factory ChatEvent.onErrorReceived({required ChatRepositoryError error}) =
      _EventOnErrorReceived;

  /// ВНУТРЕННЕЕ событие пересчёта статуса собеседника
  const factory ChatEvent.onStatusRecomputeRequested() = _EventOnStatusRecomputeRequested;

  /// Сброс обработанного UI-эффекта
  const factory ChatEvent.effectHandled() = _EffectHandled;
}

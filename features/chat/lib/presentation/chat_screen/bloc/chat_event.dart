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

  /// Приложение ушло в фон — разрешить пуши для этого чата.
  const factory ChatEvent.onAppPaused() = _EventOnAppPaused;

  /// Приложение снова на переднем плане — снова подавлять пуши.
  const factory ChatEvent.onAppResumed() = _EventOnAppResumed;

  /// Сброс обработанного UI-эффекта
  const factory ChatEvent.effectHandled() = _EffectHandled;
}

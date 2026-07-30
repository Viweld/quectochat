part of 'reading_view_bloc.dart';

@freezed
sealed class ReadingViewEvent with _$ReadingViewEvent {
  const factory ReadingViewEvent.onInitializationRequested() = _EventOnInitializationRequested;

  const factory ReadingViewEvent.onNextPageRequested() = _EventOnNextPageRequested;

  const factory ReadingViewEvent.onMessagesUpdated({required List<Message> messages}) =
      _EventOnMessagesUpdated;
}

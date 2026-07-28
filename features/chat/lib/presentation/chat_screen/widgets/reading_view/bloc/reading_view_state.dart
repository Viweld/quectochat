part of 'reading_view_bloc.dart';

@freezed
abstract class ReadingViewState with _$ReadingViewState {
  const factory ReadingViewState({
    @Default([]) Iterable<Message> messages,
    @Default(true) bool isPending,
    ReadingViewEffect? effect,
  }) = _ReadingViewState;
}

part of 'reading_view_bloc.dart';

@freezed
abstract class ReadingViewState with _$ReadingViewState {
  const factory ReadingViewState({
    required String interlocutorId,
    @Default(<Message>[]) List<Message> messages,
    @Default(true) bool isPending,
    @Default(false) bool isNextLoading,
    @Default(true) bool hasNext,
  }) = _ReadingViewState;
}

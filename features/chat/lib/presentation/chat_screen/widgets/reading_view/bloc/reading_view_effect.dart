part of 'reading_view_bloc.dart';

@freezed
sealed class ReadingViewEffect with _$ReadingViewEffect {
  const factory ReadingViewEffect.showError(AppErrorKind kind) = _ShowError;
}

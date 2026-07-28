part of 'home_bloc.dart';

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) Iterable<Interlocutor> interlocutors,
    @Default(true) bool hasNext,
    @Default(true) bool isFirstLoading,
    @Default(false) bool isNextLoading,
    @Default(false) bool isLogoutLoading,
    @Default(false) bool isSearchMode,
    @Default('') String searchText,
    @Default(0) int searchId,
    HomeEffect? effect,
  }) = _HomeState;
}

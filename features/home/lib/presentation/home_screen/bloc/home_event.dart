part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.onInitializationRequested() = _EventOnInitializationRequested;

  const factory HomeEvent.onFetchRequested() = _EventOnFetchRequested;

  const factory HomeEvent.onSearchRequested() = _EventOnSearchRequested;

  const factory HomeEvent.onSearchFieldClearTapped() = _EventOnSearchFieldClearTapped;

  const factory HomeEvent.onNextPageRequested() = _EventOnNextPageRequested;

  const factory HomeEvent.onSearchTextChanged(String val) = _EventOnSearchTextChanged;

  const factory HomeEvent.onLogoutTapped() = _EventOnLogoutTapped;

  const factory HomeEvent.onInterlocutorsStreamUpdated({required Set<Interlocutor> updated}) =
      _EventOnInterlocutorsStreamUpdated;
}

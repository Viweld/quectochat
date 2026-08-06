part of 'nested_contacts_bloc.dart';

@freezed
abstract class NestedContactsState with _$NestedContactsState {
  const factory NestedContactsState({
    required String anchorUserId,
    required String anchorDisplayName,
    required bool isFriendsOfRelative,
    @Default(<Interlocutor>[]) List<Interlocutor> contacts,
    @Default(false) bool isLoading,
    AppErrorViewModel? loadError,
  }) = _NestedContactsState;
}

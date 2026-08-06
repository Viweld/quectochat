part of 'nested_contacts_bloc.dart';

@freezed
sealed class NestedContactsEvent with _$NestedContactsEvent {
  const factory NestedContactsEvent.init() = NestedContactsInit;

  const factory NestedContactsEvent.retryRequested() = NestedContactsRetryRequested;
}

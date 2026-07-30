part of 'chat_bloc.dart';

@freezed
abstract class ChatState with _$ChatState {
  const factory ChatState({
    required String interlocutorId,
    InterlocutorStatus? interlocutorStatus,
    ChatEffect? effect,
  }) = _ChatState;
}

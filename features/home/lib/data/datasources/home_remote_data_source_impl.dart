import 'dart:async';

import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../dto/interlocutor_dto.dart';
import '../dto/message_preview_dto.dart';
import '../dto/user_dto.dart';
import 'home_remote_data_source.dart';
import 'table_keys.dart';

@LazySingleton(as: HomeRemoteDataSource)
final class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl() : _client = Supabase.instance.client;

  final SupabaseClient _client;

  static const _interlocutorsPaginationLimit = 20;

  String get _currentUserId => _client.auth.currentUser?.id ?? '';

  @override
  Future<Paginated<InterlocutorDto>> getInterlocutors({String? lastInterlocutorId}) async {
    const limit = _interlocutorsPaginationLimit;

    final List<dynamic> conversationRows = await _client.rpc(
      TableKeys.getConversations,
      params: <String, Object?>{'p_limit': limit + 1, 'p_offset': 0},
    );

    final List<InterlocutorDto> withMessages = conversationRows
        .cast<Map<String, dynamic>>()
        .where((row) => (row['partner_id'] as String) != _currentUserId)
        .map(_mapConversationRow)
        .toList();

    final Set<String> interlocutorIdsWithMessages = withMessages
        .map((dto) => dto.user.userId)
        .toSet();

    var profilesQuery = _client
        .from(TableKeys.profiles)
        .select()
        .neq(TableKeys.profileId, _currentUserId)
        .order(TableKeys.profileFirstName)
        .limit(limit + 1);

    if (lastInterlocutorId != null) {
      final Map<String, dynamic>? cursor = await _client
          .from(TableKeys.profiles)
          .select()
          .eq(TableKeys.profileId, lastInterlocutorId)
          .maybeSingle();
      final String? cursorName = cursor?[TableKeys.profileFirstName] as String?;
      if (cursorName != null) {
        profilesQuery = _client
            .from(TableKeys.profiles)
            .select()
            .neq(TableKeys.profileId, _currentUserId)
            .gt(TableKeys.profileFirstName, cursorName)
            .order(TableKeys.profileFirstName)
            .limit(limit + 1);
      }
    }

    final List<Map<String, dynamic>> profileRows = await profilesQuery;
    final List<InterlocutorDto> withoutMessages = profileRows
        .where((row) => !interlocutorIdsWithMessages.contains(row[TableKeys.profileId]))
        .map((row) => InterlocutorDto(user: UserDto.fromJson(row)))
        .toList();

    final List<InterlocutorDto> sortedUsers = <InterlocutorDto>[
      ...withMessages,
      ...withoutMessages,
    ];
    final bool hasNext = sortedUsers.length > limit;

    return Paginated<InterlocutorDto>(
      hasNext: hasNext,
      result: hasNext ? sortedUsers.sublist(0, limit) : sortedUsers,
    );
  }

  @override
  Future<Iterable<InterlocutorDto>> searchInterlocutors({required String searchText}) async {
    final String pattern = '%$searchText%';
    final List<Map<String, dynamic>> rows = await _client
        .from(TableKeys.profiles)
        .select()
        .neq(TableKeys.profileId, _currentUserId)
        .or(
          '${TableKeys.profileFirstName}.ilike.$pattern,'
          '${TableKeys.profileLastName}.ilike.$pattern',
        );

    return rows.map((row) => InterlocutorDto(user: UserDto.fromJson(row)));
  }

  @override
  Stream<Set<InterlocutorDto>> getActualInterlocutors() {
    final StreamController<Set<InterlocutorDto>> controller =
        StreamController<Set<InterlocutorDto>>.broadcast();
    RealtimeChannel? channel;

    Future<void> refresh() async {
      if (controller.isClosed) return;
      final List<dynamic> rows = await _client.rpc(
        TableKeys.getConversations,
        params: <String, Object?>{'p_limit': 100, 'p_offset': 0},
      );
      final Set<InterlocutorDto> interlocutors = rows
          .cast<Map<String, dynamic>>()
          .where((row) => (row['partner_id'] as String) != _currentUserId)
          .map(_mapConversationRow)
          .toSet();
      if (!controller.isClosed) {
        controller.add(interlocutors);
      }
    }

    unawaited(refresh());

    channel = _client
        .channel('home-messages-$_currentUserId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: TableKeys.messages,
          callback: (_) {
            unawaited(refresh());
          },
        )
        .subscribe();

    controller.onCancel = () async {
      await channel?.unsubscribe();
      await controller.close();
    };

    return controller.stream;
  }

  @override
  Future<void> clearChat({required String interlocutorId}) async {
    final String chatId = DeterministicId.fromParts([_currentUserId, interlocutorId]);
    await _client.from(TableKeys.messages).delete().eq(TableKeys.messageChatId, chatId);
  }

  InterlocutorDto _mapConversationRow(Map<String, dynamic> row) {
    return InterlocutorDto(
      user: UserDto(
        userId: row['partner_id'] as String,
        firstName: row['first_name'] as String,
        lastName: row['last_name'] as String,
      ),
      lastMessage: MessagePreviewDto.fromJson(row),
    );
  }
}

import 'dart:async';

import 'package:home/data/datasources/home_remote_data_source.dart';
import 'package:home/data/datasources/table_keys.dart';
import 'package:home/data/dto/interlocutor_dto.dart';
import 'package:home/data/dto/message_preview_dto.dart';
import 'package:home/data/dto/user_dto.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

@LazySingleton(as: HomeRemoteDataSource)
final class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  HomeRemoteDataSourceImpl() : _client = Supabase.instance.client;

  final SupabaseClient _client;

  static const int _interlocutorsPaginationLimit = 20;
  static const int _directoryRealtimeLimit = 100;

  String get _currentUserId => _client.auth.currentUser?.id ?? '';

  @override
  Future<Paginated<InterlocutorDto>> getInterlocutors({String? lastInterlocutorId}) async {
    final List<InterlocutorDto> sortedUsers = await _loadDirectory(
      limit: _interlocutorsPaginationLimit,
      lastInterlocutorId: lastInterlocutorId,
    );
    final bool hasNext = sortedUsers.length > _interlocutorsPaginationLimit;

    return Paginated<InterlocutorDto>(
      hasNext: hasNext,
      result: hasNext ? sortedUsers.sublist(0, _interlocutorsPaginationLimit) : sortedUsers,
    );
  }

  @override
  Future<Iterable<InterlocutorDto>> searchInterlocutors({required String searchText}) async {
    try {
      final String pattern = '%$searchText%';
      final List<Map<String, dynamic>> rows = await _client
          .from(TableKeys.profiles)
          .select()
          .neq(TableKeys.profileId, _currentUserId)
          .or(
            '${TableKeys.profileFirstName}.ilike.$pattern,'
            '${TableKeys.profileLastName}.ilike.$pattern',
          );

      return rows.map((Map<String, dynamic> row) => InterlocutorDto(user: UserDto.fromJson(row)));
    } on Object catch (cause, stackTrace) {
      Error.throwWithStackTrace(
        _mapTransportException(cause, operation: 'home.searchInterlocutors'),
        stackTrace,
      );
    }
  }

  @override
  Stream<Set<InterlocutorDto>> getActualInterlocutors() {
    final StreamController<Set<InterlocutorDto>> controller =
        StreamController<Set<InterlocutorDto>>.broadcast();
    RealtimeChannel? channel;

    Future<void> refresh() async {
      if (controller.isClosed) return;
      try {
        final List<InterlocutorDto> directory = await _loadDirectory(
          limit: _directoryRealtimeLimit,
        );
        if (!controller.isClosed) {
          controller.add(directory.toSet());
        }
      } on Object catch (error, stackTrace) {
        logInfrastructureFailure(
          'Failed to refresh home directory',
          name: 'HomeRemoteDataSource',
          error: error,
          stackTrace: stackTrace,
        );
      }
    }

    unawaited(refresh());

    channel = _client
        .channel('home-directory-$_currentUserId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: TableKeys.messages,
          callback: (_) {
            unawaited(refresh());
          },
        )
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: TableKeys.profiles,
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
    try {
      final String chatId = DeterministicId.fromParts(<String>[_currentUserId, interlocutorId]);
      await _client.from(TableKeys.messages).delete().eq(TableKeys.messageChatId, chatId);
    } on Object catch (cause, stackTrace) {
      Error.throwWithStackTrace(
        _mapTransportException(cause, operation: 'home.clearChat'),
        stackTrace,
      );
    }
  }

  /// Conversations with last message first, then remaining profiles (no chat yet).
  Future<List<InterlocutorDto>> _loadDirectory({
    required int limit,
    String? lastInterlocutorId,
  }) async {
    try {
      return await _loadDirectoryUnsafe(limit: limit, lastInterlocutorId: lastInterlocutorId);
    } on Object catch (cause, stackTrace) {
      Error.throwWithStackTrace(
        _mapTransportException(cause, operation: 'home.loadDirectory'),
        stackTrace,
      );
    }
  }

  Future<List<InterlocutorDto>> _loadDirectoryUnsafe({
    required int limit,
    String? lastInterlocutorId,
  }) async {
    final List<dynamic> conversationRows = await _client.rpc(
      TableKeys.getConversations,
      params: <String, Object?>{'p_limit': limit + 1, 'p_offset': 0},
    );

    final List<InterlocutorDto> withMessages = conversationRows
        .cast<Map<String, dynamic>>()
        .where((Map<String, dynamic> row) => (row['partner_id'] as String) != _currentUserId)
        .map(_mapConversationRow)
        .toList();

    final Set<String> interlocutorIdsWithMessages = withMessages
        .map((InterlocutorDto dto) => dto.user.userId)
        .toSet();

    PostgrestTransformBuilder<PostgrestList> profilesQuery = _client
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
        .where(
          (Map<String, dynamic> row) =>
              !interlocutorIdsWithMessages.contains(row[TableKeys.profileId]),
        )
        .map((Map<String, dynamic> row) => InterlocutorDto(user: UserDto.fromJson(row)))
        .toList();

    return <InterlocutorDto>[...withMessages, ...withoutMessages];
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

  ApiException _mapTransportException(Object cause, {required String operation}) {
    final RequestContext context = RequestContext(operation: operation);
    return switch (classifyTransportError(cause)) {
      TransportErrorKind.network => NetworkException(
        kind: NetworkExceptionKind.offline,
        context: context,
        cause: cause,
      ),
      TransportErrorKind.server => ServerException(context: context, cause: cause),
      TransportErrorKind.other => ServerException(context: context, cause: cause),
    };
  }
}

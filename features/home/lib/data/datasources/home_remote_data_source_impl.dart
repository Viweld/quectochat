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

  static const int _directoryRealtimeLimit = 100;

  String get _currentUserId => _client.auth.currentUser?.id ?? '';

  @override
  Future<Paginated<InterlocutorDto>> getInterlocutors({String? lastInterlocutorId}) async {
    final List<InterlocutorDto> feed = await _loadHomeFeed();
    // Home feed is a closed circle — no classic pagination cursor yet.
    return Paginated<InterlocutorDto>(hasNext: false, result: feed);
  }

  @override
  Future<UserDto?> getCurrentUser() async {
    final String userId = _currentUserId;
    if (userId.isEmpty) return null;

    try {
      final List<dynamic> rows = await _client.rpc(TableKeys.getCurrentUserProfile);
      if (rows.isEmpty) return null;
      return UserDto.fromJson(Map<String, dynamic>.from(rows.first as Map<dynamic, dynamic>));
    } on Object catch (cause, stackTrace) {
      Error.throwWithStackTrace(
        _mapTransportException(cause, operation: 'home.getCurrentUser'),
        stackTrace,
      );
    }
  }

  @override
  Future<Iterable<InterlocutorDto>> searchInterlocutors({required String searchText}) async {
    try {
      final List<InterlocutorDto> feed = await _loadHomeFeed();
      final String needle = searchText.trim().toLowerCase();
      if (needle.isEmpty) return feed;
      return feed.where(
        (InterlocutorDto dto) => dto.user.displayName.toLowerCase().contains(needle),
      );
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
        final List<InterlocutorDto> directory = await _loadHomeFeed();
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
  Future<List<InterlocutorDto>> getNestedContacts({required String anchorUserId}) async {
    try {
      final List<dynamic> rows = await _client.rpc(
        TableKeys.getNestedContacts,
        params: <String, Object?>{'p_anchor_user_id': anchorUserId},
      );
      return rows
          .cast<Map<String, dynamic>>()
          .map(_mapNestedRow)
          .take(_directoryRealtimeLimit)
          .toList();
    } on Object catch (cause, stackTrace) {
      Error.throwWithStackTrace(
        _mapTransportException(cause, operation: 'home.getNestedContacts'),
        stackTrace,
      );
    }
  }

  Future<List<InterlocutorDto>> _loadHomeFeed() async {
    try {
      final List<dynamic> rows = await _client.rpc(TableKeys.getHomeFeed);
      return rows.cast<Map<String, dynamic>>().map(_mapHomeFeedRow).toList();
    } on Object catch (cause, stackTrace) {
      Error.throwWithStackTrace(
        _mapTransportException(cause, operation: 'home.loadHomeFeed'),
        stackTrace,
      );
    }
  }

  InterlocutorDto _mapHomeFeedRow(Map<String, dynamic> row) {
    return InterlocutorDto(
      user: UserDto(userId: row['user_id'] as String, displayName: row['display_name'] as String),
      section: row['section'] as String? ?? 'contacts',
      isPinned: row['is_pinned'] as bool? ?? false,
      nestedUnreadContactCount: (row['nested_unread_contact_count'] as num?)?.toInt() ?? 0,
      lastMessage: row['last_created_at'] == null
          ? null
          : MessagePreviewDto(
              content: row['last_content'] as String? ?? '',
              type: row['last_type'] as String? ?? 'text',
              createdAt: DateTime.parse(row['last_created_at'] as String),
              fromId: row['last_from_id'] as String? ?? '',
            ),
    );
  }

  InterlocutorDto _mapNestedRow(Map<String, dynamic> row) {
    return InterlocutorDto(
      user: UserDto(userId: row['user_id'] as String, displayName: row['display_name'] as String),
      lastMessage: row['last_created_at'] == null
          ? null
          : MessagePreviewDto(
              content: row['last_content'] as String? ?? '',
              type: row['last_type'] as String? ?? 'text',
              createdAt: DateTime.parse(row['last_created_at'] as String),
              fromId: row['last_from_id'] as String? ?? '',
            ),
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

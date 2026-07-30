import 'dart:async';
import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

/// Tracks the signed-in user on a shared online roster and exposes peer presence.
final class PresenceService {
  PresenceService({SupabaseClient? client}) : _client = client ?? Supabase.instance.client;

  final SupabaseClient _client;

  final StreamController<Set<String>> _onlineUserIdsController =
      StreamController<Set<String>>.broadcast();

  RealtimeChannel? _presenceChannel;
  Set<String> _latestOnlineUserIds = <String>{};
  bool _hasSynced = false;

  String get _currentUserId => _client.auth.currentUser?.id ?? '';

  /// Emits the cached roster only after the first successful sync, then live updates.
  Stream<Set<String>> get onlineUserIdsStream async* {
    if (_hasSynced) {
      yield Set<String>.of(_latestOnlineUserIds);
    }
    yield* _onlineUserIdsController.stream;
  }

  Future<void> startTracking() async {
    final String userId = _currentUserId;
    if (userId.isEmpty) {
      log('Skip presence start: no signed-in user', name: 'PresenceService');
      return;
    }
    if (_presenceChannel != null) return;

    final RealtimeChannel channel = _client.channel(
      'online-users',
      opts: RealtimeChannelConfig(key: userId, enabled: true),
    );

    channel
      ..onPresenceSync((_) {
        _emitOnlineUserIds(channel);
      })
      ..onPresenceJoin((_) {
        _emitOnlineUserIds(channel);
      })
      ..onPresenceLeave((_) {
        _emitOnlineUserIds(channel);
      });

    channel.subscribe((RealtimeSubscribeStatus status, Object? error) async {
      if (status == RealtimeSubscribeStatus.subscribed) {
        try {
          await channel.track(<String, Object?>{
            'user_id': userId,
            'online_at': DateTime.now().toUtc().toIso8601String(),
          });
          _emitOnlineUserIds(channel);
        } on Object catch (trackError, stackTrace) {
          log(
            'Failed to track presence',
            name: 'PresenceService',
            error: trackError,
            stackTrace: stackTrace,
          );
        }
      } else if (error != null) {
        log('Presence channel subscribe failed', name: 'PresenceService', error: error);
        // Allow a later startTracking retry.
        if (identical(_presenceChannel, channel)) {
          _presenceChannel = null;
        }
      }
    });

    _presenceChannel = channel;
  }

  Future<void> stopTracking() async {
    final RealtimeChannel? channel = _presenceChannel;
    _presenceChannel = null;
    if (channel == null) return;

    try {
      await channel.untrack();
    } on Object catch (error, stackTrace) {
      log(
        'Failed to untrack presence',
        name: 'PresenceService',
        error: error,
        stackTrace: stackTrace,
      );
    }

    try {
      await _client.removeChannel(channel);
    } on Object catch (error, stackTrace) {
      log(
        'Failed to remove presence channel',
        name: 'PresenceService',
        error: error,
        stackTrace: stackTrace,
      );
    }

    await _persistLastSeenAt();
  }

  Stream<DateTime?> watchLastSeenAt(String userId) {
    return _client.from('profiles').stream(primaryKey: <String>['id']).eq('id', userId).map((
      List<Map<String, dynamic>> rows,
    ) {
      if (rows.isEmpty) return null;
      final Object? raw = rows.first['last_seen_at'];
      if (raw is! String) return null;
      return DateTime.tryParse(raw)?.toUtc();
    });
  }

  Future<void> dispose() async {
    await stopTracking();
    await _onlineUserIdsController.close();
  }

  void _emitOnlineUserIds(RealtimeChannel channel) {
    if (_onlineUserIdsController.isClosed) return;

    final Set<String> ids = <String>{};
    for (final SinglePresenceState state in channel.presenceState()) {
      if (state.key.isNotEmpty) {
        ids.add(state.key);
      }
      for (final Presence presence in state.presences) {
        final Object? payloadUserId = presence.payload['user_id'];
        if (payloadUserId is String && payloadUserId.isNotEmpty) {
          ids.add(payloadUserId);
        }
      }
    }

    _hasSynced = true;
    _latestOnlineUserIds = ids;
    log('Presence roster updated: ${ids.length} online', name: 'PresenceService');
    _onlineUserIdsController.add(ids);
  }

  Future<void> _persistLastSeenAt() async {
    final String userId = _currentUserId;
    if (userId.isEmpty) return;

    try {
      await _client
          .from('profiles')
          .update(<String, Object?>{'last_seen_at': DateTime.now().toUtc().toIso8601String()})
          .eq('id', userId);
    } on Object catch (error, stackTrace) {
      log(
        'Failed to persist last_seen_at',
        name: 'PresenceService',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }
}

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
  final Set<RealtimeChannel> _channelsBeingRemoved = <RealtimeChannel>{};
  Set<String> _latestOnlineUserIds = <String>{};
  bool _hasSynced = false;
  bool _didLogSubscribeOffline = false;
  bool _isStarting = false;

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
    if (_presenceChannel != null || _isStarting) return;

    _isStarting = true;
    try {
      await _subscribePresence(userId: userId);
    } finally {
      _isStarting = false;
    }
  }

  Future<void> stopTracking() async {
    final RealtimeChannel? channel = _presenceChannel;
    _presenceChannel = null;
    if (channel == null) {
      await _persistLastSeenAt();
      return;
    }

    try {
      await channel.untrack();
    } on Object catch (error, stackTrace) {
      _logNonTransportFailure('Failed to untrack presence', error: error, stackTrace: stackTrace);
    }

    await _removeChannelSafely(channel);
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

  Future<void> _subscribePresence({required String userId}) async {
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

    _presenceChannel = channel;

    channel.subscribe((RealtimeSubscribeStatus status, Object? error) async {
      if (status == RealtimeSubscribeStatus.subscribed) {
        _didLogSubscribeOffline = false;
        try {
          await channel.track(<String, dynamic>{
            'user_id': userId,
            'online_at': DateTime.now().toUtc().toIso8601String(),
          });
          _emitOnlineUserIds(channel);
        } on Object catch (trackError, stackTrace) {
          _logNonTransportFailure(
            'Failed to track presence',
            error: trackError,
            stackTrace: stackTrace,
          );
        }
        return;
      }

      // Drop the broken channel completely — leaving a zombie causes corrupt presence
      // sync (null phx_ref) after reconnect from offline.
      if (identical(_presenceChannel, channel)) {
        _presenceChannel = null;
      }
      if (error != null) {
        _logSubscribeFailure(error);
      }

      // `closed` is emitted by unsubscribe/removeChannel itself. Calling remove again
      // re-enters this callback and overflows the stack.
      if (status == RealtimeSubscribeStatus.closed) {
        return;
      }

      await _removeChannelSafely(channel);
    });
  }

  void _emitOnlineUserIds(RealtimeChannel channel) {
    if (_onlineUserIdsController.isClosed) return;
    if (!identical(_presenceChannel, channel)) return;

    final Set<String> ids = <String>{};
    try {
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
    } on Object catch (error, stackTrace) {
      _logNonTransportFailure(
        'Failed to read presence state',
        error: error,
        stackTrace: stackTrace,
      );
      return;
    }

    _hasSynced = true;
    _latestOnlineUserIds = ids;
    log('Presence roster updated: ${ids.length} online', name: 'PresenceService');
    _onlineUserIdsController.add(ids);
  }

  Future<void> _removeChannelSafely(RealtimeChannel channel) async {
    if (!_channelsBeingRemoved.add(channel)) {
      return;
    }

    try {
      await _client.removeChannel(channel);
    } on Object catch (error, stackTrace) {
      _logNonTransportFailure(
        'Failed to remove presence channel',
        error: error,
        stackTrace: stackTrace,
      );
    } finally {
      _channelsBeingRemoved.remove(channel);
    }
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
      if (_isLikelyOffline(error)) {
        log('Skip last_seen_at persist (backend unreachable)', name: 'PresenceService');
        return;
      }
      log(
        'Failed to persist last_seen_at',
        name: 'PresenceService',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  void _logSubscribeFailure(Object error) {
    if (_isLikelyOffline(error)) {
      if (_didLogSubscribeOffline) return;
      _didLogSubscribeOffline = true;
      log('Presence channel subscribe failed (backend unreachable)', name: 'PresenceService');
      return;
    }
    _didLogSubscribeOffline = false;
    log('Presence channel subscribe failed', name: 'PresenceService', error: error);
  }

  void _logNonTransportFailure(String message, {required Object error, StackTrace? stackTrace}) {
    if (_isLikelyOffline(error)) {
      log('$message (backend unreachable)', name: 'PresenceService');
      return;
    }
    log(message, name: 'PresenceService', error: error, stackTrace: stackTrace);
  }

  bool _isLikelyOffline(Object error) {
    final String text = error.toString().toLowerCase();
    return text.contains('socketexception') ||
        text.contains('failed host lookup') ||
        text.contains('no address associated with hostname') ||
        text.contains('connection refused') ||
        text.contains('clientexception with socketexception');
  }
}

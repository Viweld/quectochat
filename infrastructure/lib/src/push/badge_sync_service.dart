import 'dart:async';
import 'dart:developer';

import 'package:app_badge_plus/app_badge_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Keeps the launcher badge in sync with unread inbound messages.
final class BadgeSyncService {
  BadgeSyncService({SupabaseClient? client}) : _client = client ?? Supabase.instance.client;

  final SupabaseClient _client;

  RealtimeChannel? _messagesChannel;
  bool _isTracking = false;

  String get _currentUserId => _client.auth.currentUser?.id ?? '';

  Future<void> startTracking() async {
    if (_currentUserId.isEmpty) {
      log('Skip badge sync start: no signed-in user', name: 'BadgeSyncService');
      return;
    }
    if (_isTracking) {
      await _refreshBadge();
      return;
    }

    _isTracking = true;
    await _refreshBadge();

    _messagesChannel = _client
        .channel('badge-unread-$_currentUserId')
        .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'messages',
          filter: PostgresChangeFilter(
            type: PostgresChangeFilterType.eq,
            column: 'to_id',
            value: _currentUserId,
          ),
          callback: (_) {
            unawaited(_refreshBadge());
          },
        )
        .subscribe();
  }

  Future<void> stopTracking() async {
    _isTracking = false;
    final RealtimeChannel? channel = _messagesChannel;
    _messagesChannel = null;
    if (channel == null) return;

    try {
      await _client.removeChannel(channel);
    } on Object catch (error, stackTrace) {
      log(
        'Failed to remove badge channel',
        name: 'BadgeSyncService',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _refreshBadge() async {
    if (_currentUserId.isEmpty) return;

    try {
      final int count = await _fetchUnreadCount();
      final bool isSupported = await AppBadgePlus.isSupported();
      if (!isSupported) return;
      await AppBadgePlus.updateBadge(count);
    } on Object catch (error, stackTrace) {
      final String text = error.toString().toLowerCase();
      if (text.contains('socketexception') || text.contains('failed host lookup')) {
        log('Failed to refresh badge (backend unreachable)', name: 'BadgeSyncService');
        return;
      }
      log(
        'Failed to refresh badge',
        name: 'BadgeSyncService',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<int> _fetchUnreadCount() async {
    return _client.from('messages').count().eq('to_id', _currentUserId).isFilter('read_at', null);
  }
}

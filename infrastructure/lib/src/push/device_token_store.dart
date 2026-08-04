import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Persists FCM device tokens in Supabase `device_tokens` and locally.
///
/// On register, any other tokens for the same user are removed. QuectoChat
/// currently treats one signed-in installation per account as the push target;
/// a reinstall (cleared prefs) would otherwise leave orphan FCM rows forever.
final class DeviceTokenStore {
  final SupabaseClient _client;

  DeviceTokenStore({SupabaseClient? client}) : _client = client ?? Supabase.instance.client;

  static const String _localTokenKey = 'fcm_last_device_token';

  Future<void> upsert({required String token, required String platform}) async {
    final String? userId = _client.auth.currentUser?.id;
    if (userId == null || userId.isEmpty) return;

    await _deleteOtherTokens(userId: userId, keepToken: token);

    await _client.from('device_tokens').upsert(<String, Object?>{
      'user_id': userId,
      'token': token,
      'platform': platform,
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    }, onConflict: 'user_id,token');

    await _writeLocalToken(token);
  }

  Future<void> delete({required String token}) async {
    final String? userId = _client.auth.currentUser?.id;
    if (userId == null || userId.isEmpty) return;

    await _deleteRemote(userId: userId, token: token);

    final String? local = await _readLocalToken();
    if (local == token) {
      await _clearLocalToken();
    }
  }

  /// Deletes the last known installation token (and optional [fallbackToken]).
  Future<void> unregisterCurrentDevice({String? fallbackToken}) async {
    final String? userId = _client.auth.currentUser?.id;
    if (userId == null || userId.isEmpty) return;

    final String? local = await _readLocalToken();
    final Set<String> tokens = <String>{
      if (local != null && local.isNotEmpty) local,
      if (fallbackToken != null && fallbackToken.isNotEmpty) fallbackToken,
    };

    if (tokens.isEmpty) {
      // Prefs were cleared / first logout after upgrade: drop all rows for safety.
      await _deleteAllForUser(userId);
    } else {
      for (final String token in tokens) {
        await _deleteRemote(userId: userId, token: token);
      }
    }
    await _clearLocalToken();
  }

  Future<void> _deleteOtherTokens({required String userId, required String keepToken}) async {
    try {
      await _client.from('device_tokens').delete().eq('user_id', userId).neq('token', keepToken);
    } on Object catch (error, stackTrace) {
      log(
        'Failed to delete stale device tokens',
        name: 'DeviceTokenStore',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _deleteAllForUser(String userId) async {
    try {
      await _client.from('device_tokens').delete().eq('user_id', userId);
    } on Object catch (error, stackTrace) {
      log(
        'Failed to delete all device tokens for user',
        name: 'DeviceTokenStore',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> _deleteRemote({required String userId, required String token}) async {
    try {
      await _client.from('device_tokens').delete().eq('user_id', userId).eq('token', token);
    } on Object catch (error, stackTrace) {
      log(
        'Failed to delete device token',
        name: 'DeviceTokenStore',
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<String?> _readLocalToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_localTokenKey);
  }

  Future<void> _writeLocalToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localTokenKey, token);
  }

  Future<void> _clearLocalToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_localTokenKey);
  }
}

import 'package:supabase_flutter/supabase_flutter.dart';

/// Persists FCM device tokens in Supabase `device_tokens`.
final class DeviceTokenStore {
  DeviceTokenStore({SupabaseClient? client}) : _client = client ?? Supabase.instance.client;

  final SupabaseClient _client;

  Future<void> upsert({required String token, required String platform}) async {
    final String? userId = _client.auth.currentUser?.id;
    if (userId == null || userId.isEmpty) return;

    await _client.from('device_tokens').upsert(<String, Object?>{
      'user_id': userId,
      'token': token,
      'platform': platform,
      'updated_at': DateTime.now().toUtc().toIso8601String(),
    }, onConflict: 'user_id,token');
  }

  Future<void> delete({required String token}) async {
    final String? userId = _client.auth.currentUser?.id;
    if (userId == null || userId.isEmpty) return;

    await _client.from('device_tokens').delete().eq('user_id', userId).eq('token', token);
  }
}

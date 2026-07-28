import 'package:supabase_flutter/supabase_flutter.dart';

/// Bootstrap Supabase with compile-time URL / anon key.
Future<void> initializeSupabaseApp() async {
  // Compile-time dart-defines are the intended config source for this app.
  // ignore: do_not_use_environment
  const String url = String.fromEnvironment('SUPABASE_URL');
  // ignore: do_not_use_environment
  const String anonKey = String.fromEnvironment('SUPABASE_ANON_KEY');

  if (url.isEmpty || anonKey.isEmpty) {
    throw StateError(
      'Missing SUPABASE_URL / SUPABASE_ANON_KEY. '
      'Pass them via --dart-define or --dart-define-from-file.',
    );
  }

  await Supabase.initialize(url: url, publishableKey: anonKey);
}

/// Shared Supabase client after [initializeSupabaseApp].
SupabaseClient get supabaseClient => Supabase.instance.client;

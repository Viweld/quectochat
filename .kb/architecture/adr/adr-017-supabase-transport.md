# ADR-017: Supabase Auth + Postgres как transport (supersedes ADR-015)

**Статус:** Принято  
**Дата:** 2026-07-28  
**Supersedes:** ADR-015

## Контекст

Firebase Auth + Firestore были tightly coupled в feature datasources. Нужны free-tier realtime и минимальный blast radius при смене транспорта.

## Решение

- **Auth / DB / Realtime:** Supabase (`supabase_flutter`) в `*_remote_data_source_impl.dart`.
- **Схема:** `supabase/migrations/` — `profiles`, `messages`, `device_tokens`, RLS, RPC `get_conversations`.
- **Контракты datasource** не меняются — domain/BLoC не знают про Supabase.
- **Bootstrap:** `initializeSupabaseApp()` в `infrastructure/` (`SUPABASE_URL` / `SUPABASE_ANON_KEY` через `--dart-define`).
- DTO: `fromJson` / `toJson`, `timestamptz` → `DateTime`.

## Последствия

- `firebase_auth` / `cloud_firestore` удалены из features.
- Firebase остаётся только для FCM + Crashlytics (ADR-018).

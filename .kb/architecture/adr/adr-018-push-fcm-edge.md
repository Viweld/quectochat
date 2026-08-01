# ADR-018: Push через FCM + Supabase Edge Function

**Статус:** Принято  
**Дата:** 2026-07-28  
**Обновлено:** 2026-07-31

## Контекст

Supabase не предоставляет собственный APNs/FCM транспорт. Нужны пуши о новых сообщениях при свёрнутом/выключенном приложении.

## Решение

- Клиент регистрирует FCM token через `PushNotificationPort` → таблица `device_tokens` (только при `AuthStatus.authorized`).
- При logout токен удаляется **до** `signOut` (пока RLS-сессия валидна).
- Открытый чат пишет heartbeat в `active_chats`; Edge Function подавляет пуш, если получатель смотрит этот чат.
- Postgres trigger `notify_new_message` (pg_net) → Edge Function `send-push` → FCM HTTP v1.
- Badge: `aps.badge` на iOS из Edge Function; на Android — `app_badge_plus` + foreground sync через `BadgeSyncPort`.
- Firebase в проекте остаётся **только** как transport уведомлений (+ Crashlytics).

## Последствия

- `firebase_messaging` + `google-services` остаются в Android.
- Нужны vault-секреты `push_webhook_secret` / `send_push_url` и Edge secrets `FCM_SERVICE_ACCOUNT_JSON` / `PUSH_WEBHOOK_SECRET`.
- iOS требует APNs key в Firebase Console и `GoogleService-Info.plist`.

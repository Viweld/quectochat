# ADR-018: Push через FCM + Supabase Edge Function

**Статус:** Принято  
**Дата:** 2026-07-28

## Контекст

Supabase не предоставляет собственный APNs/FCM транспорт. Нужны пуши о новых сообщениях при свёрнутом/выключенном приложении.

## Решение

- Клиент регистрирует FCM token через `PushNotificationPort` → таблица `device_tokens`.
- Postgres Database Webhook / Edge Function `send-push` читает tokens и отправляет через FCM HTTP v1.
- Firebase в проекте остаётся **только** как transport уведомлений (+ Crashlytics).

## Последствия

- `firebase_messaging` + `google-services` остаются в Android.
- Полная доставка FCM в Edge Function — follow-up (сейчас stub с логами).

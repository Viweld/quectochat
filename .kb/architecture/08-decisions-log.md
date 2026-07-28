# Журнал архитектурных решений

Фиксирует принятые решения по спорным пунктам планирования. Статус: `accepted` | `proposed` | `deferred` | `superseded`.

| ID | Решение | Статус | Дата |
|----|---------|--------|------|
| D14 | Micro-modular Feature-First: vertical slices, `shared_*`, strict DAG | accepted | 2026-07-09 |
| D15 | QuectoChat Feature-First workspace | accepted | 2026-07-28 |
| D16 | Единый `AppRouter` (auto_route), flat stack, Auth/Guest guards | accepted | 2026-07-28 |
| D17 | Supabase Auth + Postgres + Realtime как transport | accepted | 2026-07-28 |
| D18 | Push: FCM + Edge Function `send-push`, порт `PushNotificationPort` | accepted | 2026-07-28 |

### D16 — детализация

- ADR-016 supersedes ADR-013.
- `AppRouter implements AppNavigator`; splash → login/home; chat typed args.

### D17 — детализация

- ADR-017 supersedes ADR-015.
- Миграции в `supabase/migrations/`; datasource contracts неизменны.

### D18 — детализация

- ADR-018; Firebase только messaging + crashlytics.

## Открытые вопросы

| ID | Вопрос | Статус |
|----|--------|--------|
| Q1 | Presence: расширить Home/Chat repo или отдельный feature | open |
| Q2 | Полная FCM HTTP v1 отправка в Edge Function (service account) | open |
| Q3 | Deep links `/chat/:userId` | open |

## Реализация в коде

| Решение | Где в коде |
|---------|------------|
| D14 | `workspace_graph_config.yaml`; `shared_*`; `lib/di/app_di.dart` |
| D15 | `features/auth`, `home`, `chat` |
| D16 | `navigation/lib/src/app_router/`; ADR-016 |
| D17 | `features/*/data/datasources/*_impl.dart`; `supabase/migrations/` |
| D18 | `lib/di/push_port_adapters.dart`; `supabase/functions/send-push/` |

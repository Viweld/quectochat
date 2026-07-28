# AGENTS.md — QuectoChat (Feature-First Flutter workspace)

Инструкции для Cursor-агента в приложении QuectoChat.

## Контекст

- Архитектура: Clean Architecture, micro-modular workspace (strict DAG, см. `flutter-architecture.mdc`, ADR-011)
- Навигация: `auto_route` — `AppRouter` в `navigation/` (ADR-016); splash → login/home → chat
- Features: `features/auth`, `features/home`, `features/chat`
- `shared_domain/` — только кросс-фичевые типы (`AuthStatus`, `Interlocutor`, `MessageContentType`, `Paginated`, `Outcome`)
- Transport: Supabase Auth + Postgres + Realtime в `features/*/lib/data/` (ADR-017); bootstrap в `infrastructure/`
- Firebase остаётся только для FCM + Crashlytics (ADR-018)
- Cross-feature — ports в `navigation_api` + адаптеры в `lib/di/`
- Entry: `lib/main.dart`; Composition Root: `lib/di/app_di.dart`

## Перед задачей

1. `.cursor/rules/00-index.mdc` — какие правила подключать
2. `workspace_graph_config.yaml` — DAG-инварианты
3. Не переписывать архитектуру — расширять vertical slices

## Generated-файлы

Коммитить в git (как в эталоне vipitalia):

- `*.freezed.dart`, `*.gr.dart`, `*.config.dart`, `*.module.dart`
- `shared_core/lib/src/l10n/app_localizations*.dart`

Не коммитить: `.fvm/flutter_sdk`, `dart_defines.json` (только `dart_defines.example.json`).

## Команды (FVM)

```bash
fvm use 3.44.2
fvm flutter pub get
fvm dart run build_runner build
fvm flutter analyze
fvm dart run tool/check_workspace_graph.dart
# Скопировать dart_defines.example.json → dart_defines.json и заполнить ключи
fvm flutter run --dart-define-from-file=dart_defines.json
```

После правок `.dart`:

```bash
fvm dart format -l 100 <paths>
```

Кодоген в micro-packages (auth / home / chat / navigation / infrastructure) и в корне (`lib/di`):

```bash
cd features/auth && fvm dart run build_runner build
# аналогично для home, chat, navigation, infrastructure
cd ../.. && fvm dart run build_runner build
```

SQL-миграции: `supabase/migrations/` (применить в Supabase SQL editor или CLI).

## Именование экранов

- Папка: `<screen>_screen/` (например `login_screen/`)
- Файлы: `login_screen.dart`, `bloc/login_bloc.dart`
- Подробнее: `flutter-feature-widgets-structure.mdc`

## Workspace-пакеты

```
shared_core, shared_ui, shared_domain
infrastructure, navigation_api, navigation
features/auth, features/home, features/chat
lib/  (app: entrypoints + Composition Root)
```

## Ports (`navigation_api`)

| Port | Назначение |
|------|------------|
| `AppNavigator` | Навигация без знания конкретного роутера |
| `AuthenticationStatePort` | Статус auth + stream (guards) |
| `SplashAuthenticationPort` | `checkAuth` для splash |
| `AuthSessionPort` | `logOut` для home и др. |
| `CurrentUserPort` | `currentUserId` для mappers |
| `PushNotificationPort` | регистрация FCM token |

Wiring — в `lib/di/auth_port_adapters.dart` и `lib/di/push_port_adapters.dart`.

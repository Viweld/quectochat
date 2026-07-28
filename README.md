![QuectoChat](https://github.com/Viweld/quectochat/assets/60778769/ea253ac1-49ca-444e-9fc6-39e07a84c0f9)

# QuectoChat

Мобильный мессенджер: список собеседников, переписка в реальном времени, регистрация и вход.

## Архитектура

Clean Architecture + Feature-First workspace (строгий DAG пакетов).

```
lib/                 entrypoint + Composition Root (DI)
features/auth|home|chat   vertical slices (domain / data / presentation)
navigation/          AppRouter, splash, AuthGuard / GuestGuard
navigation_api/      порты (AppNavigator, auth/session/push)
shared_domain/       кросс-фичевые типы
shared_core/         BLoC helpers, l10n, error handling, appLocator
shared_ui/           тема, UI-kit
infrastructure/      bootstrap Supabase / Firebase (FCM, Crashlytics)
supabase/            SQL-миграции, Edge Function send-push
```

Слои: UI (`Screen` + `Content`) → BLoC → Repository → DataSource.  
Кросс-фича — только через порты в `navigation_api`, wiring в `lib/di/`.

## Технологии

| Область | Стек |
|--------|------|
| UI | Flutter **3.44.2** (FVM), Material 3 |
| State | `flutter_bloc` + `bloc_concurrency` |
| DI | `injectable` + `get_it` |
| Routing | `auto_route` |
| Models | `freezed`, DTO |
| Backend | **Supabase** Auth + Postgres + Realtime |
| Push / crash | **Firebase** Messaging + Crashlytics |
| Workspace | Dart workspace + Melos |

## Развёртывание и сборка

### Требования

- [FVM](https://fvm.app/) и Flutter `3.44.2`
- Android Studio / Xcode (для платформенных сборок)
- Проект Supabase + применённые миграции из `supabase/migrations/`
- Firebase-проект (FCM / Crashlytics; `google-services.json` / `GoogleService-Info.plist`)

### Локальный запуск

```bash
fvm use 3.44.2
fvm flutter pub get

# Секреты приложения
cp dart_defines.example.json dart_defines.json
# Заполнить SUPABASE_URL и SUPABASE_ANON_KEY

fvm flutter run --dart-define-from-file=dart_defines.json
```

Кодоген (после изменения annotated-кода), по пакетам:

```bash
cd features/auth && fvm dart run build_runner build --delete-conflicting-outputs
# аналогично: features/home, features/chat, navigation, infrastructure
cd ../.. && fvm dart run build_runner build --delete-conflicting-outputs
```

Проверки:

```bash
fvm flutter analyze
fvm dart run tool/check_workspace_graph.dart
fvm flutter test shared_core/test features/auth/test features/home/test features/chat/test navigation/test test
```

### Release-сборки

```bash
# Android
fvm flutter build apk --release --dart-define-from-file=dart_defines.json
# или: fvm flutter build appbundle --release --dart-define-from-file=dart_defines.json

# iOS (без подписи)
fvm flutter build ios --release --no-codesign --dart-define-from-file=dart_defines.json
```

CI (`.github/workflows/flutter.yml`): на PR — format / analyze / graph / tests; release APK/iOS — на push в `main` с secrets `SUPABASE_URL` и `SUPABASE_ANON_KEY`.

### Supabase

1. Создать проект в [Supabase](https://supabase.com/).
2. Применить SQL из `supabase/migrations/` по порядку (SQL Editor или CLI), включая `*_grant_api_roles.sql`.
3. URL и anon/publishable key → `dart_defines.json`.
4. **Auth без писем** (email только как логин):
   - **Authentication → Providers → Email** → **Confirm email = OFF** → Save.
   - После `signUp` сразу выдаётся session; вход — email + password.
   - Если видите `over_email_send_rate_limit` — confirm ещё включён или лимит не сбросился; выключите confirm и подождите несколько минут.
5. Опционально: задеплоить `supabase/functions/send-push` для push по webhook.

Документация архитектуры: `.kb/architecture/`. Правила агента: `AGENTS.md`.

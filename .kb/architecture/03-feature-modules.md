# Feature-модули

Карта feature-пакетов и экранов. **Канон кода:** `.cursor/rules/flutter-architecture.mdc`, ADR в `architecture/adr/`.

## Текущий workspace

```
shared_core, shared_ui, shared_domain
infrastructure, navigation_api, navigation
features/auth, features/home, features/chat
lib/  (Composition Root)
```

Глобальных `domain/`, `data/`, `features/common/` **нет**.

| Пакет | Содержимое |
|-------|------------|
| `features/auth` | login, registration — vertical slice |
| `features/home` | список собеседников, поиск, logout — vertical slice |
| `features/chat` | экран чата (reading/typing) — vertical slice |
| `navigation` | splash, auth shell (`AuthNode` + `Workspace`), nested routes |
| `navigation_api` | `AppNavigator`, auth ports |
| `infrastructure` | Firebase bootstrap (без business API) |

Cross-feature wiring — `lib/di/*_port_adapters.dart`. Splash/shell — в `navigation`, не отдельные feature-пакеты.

## Принципы разбиения (ADR-12)

1. **Один bounded context = один feature-пакет** с `domain/`, `data/`, `presentation/`.
2. **Один экран = папка `<screen>_screen/`** в `presentation/` (канон `flutter-feature-widgets-structure.mdc`).
3. **Эталон vertical slice** — `features/auth`. **Эталон экрана** — `navigation/.../splash_screen/`.
4. **Фичи не импортируют друг друга** — ports + DI + `navigation_api`.
5. **Новый workspace-пакет** — только bounded context или shared (`shared_*`, `navigation*`, `infrastructure`).

## Детализация существующих пакетов

### `features/auth`

| Экран | Путь |
|-------|------|
| Login | `lib/presentation/login_screen/` |
| Registration | `lib/presentation/registration_screen/` |

### `features/home`

| Экран | Путь |
|-------|------|
| Home | `lib/presentation/home_screen/` |

### `features/chat`

| Экран | Путь |
|-------|------|
| Chat | `lib/presentation/chat_screen/` |

### `navigation`

| Экран | Путь |
|-------|------|
| Splash | `lib/src/presentation/splash_screen/` |
| Auth shell | `lib/src/presentation/auth_node/` |
| Workspace | `lib/src/presentation/workspace.dart` |

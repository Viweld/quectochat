# Архитектурное видение

> Укрупнённый план QuectoChat. Согласован с **Feature-First micro-modular** архитектурой (ADR в `adr/`, канон — `.cursor/rules/flutter-architecture.mdc`).
>
> Незнакомые термины — [00-glossary-simple.md](00-glossary-simple.md).

## Цель приложения

**Кроссплатформенное Flutter-приложение для обмена сообщениями** (iOS, Android): регистрация и вход, список собеседников, переписка в реальном времени через Firebase (Auth + Firestore).

**Платформа:** телефон — основной сценарий; вёрстка адаптивная.

## Архитектурные принципы

1. **Слои не смешиваются** — BLoC без `BuildContext`; transport-модели только в `feature/data/`; UI без бизнес-логики в виджетах.
2. **`shared_domain`** — только кросс-фичевые типы 2+ feature (ADR-9): `AuthStatus`, `Interlocutor`, `MessageContentType`, `Paginated`.
3. **Feature = bounded context** — `domain/`, `data/`, `presentation/` внутри `features/<name>/`.
4. **Repository pattern** — BLoC зависит от контрактов; маппинг Firestore → Domain в Repository.
5. **Cross-feature** — ports в `navigation_api` + адаптеры в `lib/di/`, не import feature→feature.
6. **Навигация** — через `AppNavigator` (ADR-013); `Navigator` только внутри `AppNavigatorImpl`.
7. **Ошибки** — `BlocErrorHandler` + `Outcome<S, F>`.
8. **DAG** — `tool/check_workspace_graph.dart` (`strict: true`).

## Топология workspace

```
shared_core/     BLoC helpers, localization, appLocator
shared_ui/       Дизайн-система, темы, виджеты
shared_domain/   Кросс-фичевые доменные типы
infrastructure/  Firebase bootstrap, SDK-обёртки
navigation_api/  AppNavigator, auth ports
navigation/      Splash, AuthNode, Workspace, маршруты
features/auth/   Login, Registration
features/home/   Список собеседников
features/chat/   Экран переписки
lib/             Entrypoints + Composition Root (app_di.dart)
```

## Что уже есть в коде

| Компонент | Состояние |
|-----------|-----------|
| `AuthRepository` | Firebase Auth: login, registration, logout, stream статуса |
| `HomeRepository` | Список собеседников, поиск, очистка чата |
| `ChatRepository` | Сообщения, отправка, пагинация, realtime-подписки |
| `SplashBloc` | Проверка auth → `navigateAuthNode` |
| `AuthNode` + `AuthBloc` | Shell: login или workspace по `AuthStatus` |
| `AppNavigator` | Splash, auth node, login, registration, chat, back, popToRoot |
| `AuthSessionPort` | Cross-feature logout из home (ADR-014) |
| Firestore datasources | В `features/*/lib/data/datasources/` (ADR-015) |

## Стратегия роста

| Фаза | Фокус |
|------|-------|
| **Текущая (MVP)** | Auth, home, chat на Firebase; manual Map routes |
| **Ближайшее** | Presence (online/offline), push-уведомления, вложения |
| **Позже** | Settings feature, профиль пользователя, offline-кэш (если потребуется) |

## Ключевые технические решения

### Аутентификация

- Email + password через Firebase Auth.
- Регистрация с именем и фамилией; профиль пишется в Firestore.
- Статус сессии — stream в `AuthRepository`; shell слушает через `AuthenticationStatePort`.

### Переписка

- Сообщения и метаданные чатов — Firestore collections.
- Realtime — подписки в `ChatRepository` / `HomeRepository`.
- Пагинация сообщений — `Paginated<Message>` с cursor по `lastMessageId`.

### Навигация

- Два уровня: root (splash, auth, login, registration) и nested (home, chat).
- Features вызывают `appLocator<AppNavigator>()`; shell обрабатывает BLoC-эффекты через listener.

## Антипаттерны (избегать)

- Прямой `Navigator.pop` в feature-виджетах и shared_ui.
- Import `features/chat` из `features/home` (использовать `AppNavigator.navigateChat`).
- Firestore `DocumentSnapshot` в domain/presentation.
- DTO и Firebase-ключи в BLoC.

## Открытые вопросы

Принятые решения — [08-decisions-log.md](08-decisions-log.md). Архитектурные ADR — [adr/](adr/).

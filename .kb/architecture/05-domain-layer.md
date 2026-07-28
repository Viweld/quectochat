# Domain и data: контракты QuectoChat

> **Статус:** отражает текущий код в `features/auth`, `features/home`, `features/chat` и `shared_domain/`.
>
> Transport (Firestore, Firebase Auth) — только в `feature/data/`. Маппинг в Domain — в Repository (ADR-010, ADR-015).

## Shared domain (`shared_domain/`)

Кросс-фичевые типы, используемые 2+ feature (ADR-9):

| Тип | Назначение |
|-----|------------|
| `AuthStatus` | `authorized` / `notAuthorized` |
| `Interlocutor` | Собеседник в списке home |
| `MessageContentType` | Тип содержимого сообщения |
| `Paginated<T>` | Пагинация списков |

## `AuthRepository`

**Файл:** `features/auth/lib/domain/repositories/auth_repository.dart`

| Операция | Возврат | Примечание |
|----------|---------|------------|
| `authStatus` / `authStatusStream` | `AuthStatus` | Текущий статус и stream |
| `checkAuth()` | `Future<void>` | Splash: дождаться Firebase Auth |
| `logIn(email, password)` | `Outcome<void, LoginFailure>` | Бизнес-ошибки входа |
| `registration(...)` | `Outcome<void, RegistrationFailure>` | Регистрация + профиль |
| `logOut()` | `Future<void>` | Выход |
| `subscribe(listener)` | `AuthSubscription` | Legacy callback-подписка |
| `close()` | `Future<void>` | Закрытие stream |

**Failure-модели:** `LoginFailure`, `RegistrationFailure` — sealed unions в `features/auth/lib/domain/entities/`.

**Data:** `AuthRemoteDataSource` → Firebase Auth + Firestore user doc.

## `HomeRepository`

**Файл:** `features/home/lib/domain/repositories/home_repository.dart`

| Операция | Возврат | Примечание |
|----------|---------|------------|
| `initialize()` | `Future<void>` | Подготовка подписок |
| `subscribe(listener)` | `InterlocutorsSubscription` | Stream набора собеседников |
| `getInterlocutors(lastInterlocutorId?)` | `Future<Paginated<Interlocutor>>` | Пагинация списка |
| `searchInterlocutors(searchText)` | `Future<Iterable<Interlocutor>>` | Поиск |
| `clearChat(interlocutorId)` | `Future<void>` | Очистка истории |
| `close()` | `Future<void>` | Закрытие подписок |

**Data:** Firestore collections для чатов/контактов; маппинг в `Interlocutor`.

## `ChatRepository`

**Файл:** `features/chat/lib/domain/repositories/chat_repository.dart`

| Операция | Возврат | Примечание |
|----------|---------|------------|
| `initialize(interlocutorId)` | `Future<void>` | Подписки на сообщения |
| `subscribeEvents(listener)` | `ChatMessagesSubscription` | Realtime сообщения |
| `subscribeErrors(listener)` | `ChatErrorsSubscription` | Ошибки stream |
| `getChatMessages(interlocutorId, lastMessageId?)` | `Future<Paginated<Message>>` | Пагинация (limit 20) |
| `sendMessage(interlocutorId, content, type)` | `Future<void>` | Отправка |
| `markAsViewed(interlocutorId)` | `Future<void>` | Прочитано |
| `cleanup()` | `Future<void>` | Отписка при уходе с экрана |
| `close()` | `Future<void>` | Закрытие |

**Domain-модель:** `Message` в `features/chat/lib/domain/entities/message.dart`.

**Data:** `ChatRemoteDataSourceImpl`, `_MessageMapper` — Firestore → `Message`.

## Cross-feature ports (`navigation_api/`)

| Port | Назначение | ADR |
|------|------------|-----|
| `AuthenticationStatePort` | `authStatus` + stream для shell | ADR-010 |
| `SplashAuthenticationPort` | `checkAuth` для splash | ADR-010 |
| `AuthSessionPort` | `logOut()` для home | ADR-014 |
| `AppNavigator` | Навигация без concrete router | ADR-013 |

Wiring: `lib/di/auth_port_adapters.dart`, `navigation/lib/src/app_navigator/`.

## Паттерн репозиториев

- BLoC зависит от **контракта** своей feature, не от `FirebaseFirestore`.
- Stateful stream (`authStatusStream`, `subscribe` на interlocutors/messages) — в Repository; BLoC подписывается в handler или через port.
- Ожидаемые отказы — `Outcome<S, F>`; инфраструктура — `BlocErrorHandler`.

## Data layer (фактическая структура)

```
features/<name>/lib/data/
├── datasources/
│   ├── *_remote_data_source.dart      # контракт
│   ├── *_remote_data_source_impl.dart # Firestore / Firebase Auth
│   └── firebase_keys.dart             # part — ключи коллекций
├── repositories/
│   └── *_repository_impl.dart         # DTO/map → Domain
└── (mappers в part рядом с datasource)
```

Firebase bootstrap — `infrastructure/lib/src/firebase/`.

## Планируемые расширения

| Область | Контракт | Когда |
|---------|----------|-------|
| Presence | методы в Home/Chat или `PresencePort` | Online status |
| Settings | `SettingsRepository` | Отдельный feature |
| Attachments | расширение `ChatRepository.sendMessage` | File upload |
| Profile | `ProfileRepository` | Редактирование профиля |

## Тестирование (концепция)

| Слой | Что тестировать |
|------|-----------------|
| domain | Equality, form fields, failure mapping |
| data | Mappers, repository impl с mock datasource |
| features | BLoC с mock repositories |

## Связанные ADR

- [adr-010-repository-vs-port.md](adr/adr-010-repository-vs-port.md)
- [adr-014-auth-session-port.md](adr/adr-014-auth-session-port.md)
- [adr-015-firestore-transport.md](adr/adr-015-firestore-transport.md)

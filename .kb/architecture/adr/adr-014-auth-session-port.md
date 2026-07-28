# ADR-014: AuthSessionPort — command port для logout

**Статус:** Принято  
**Дата:** 2026-07-28

## Контекст

`features/home` должен выполнять logout, но не может импортировать `features/auth` (strict DAG). По ADR-010 cross-feature доступ — через узкие ports в `navigation_api/`.

В auth уже есть:

- `AuthenticationStatePort` — **чтение** `AuthStatus` + stream (StatePort)
- `SplashAuthenticationPort` — `checkAuth` для splash

Home нужен только **один imperative**: завершить сессию.

## Решение

Ввести **`AuthSessionPort`** — narrow **command port**, не StatePort и не EventPort.

```dart
// navigation_api/lib/src/auth_session_port.dart
abstract interface class AuthSessionPort {
  Future<void> logOut();
}
```

### Семантика

| Аспект | AuthSessionPort |
|--------|-----------------|
| Направление | Consumer → Auth (команда) |
| Данные | Нет payload — только side effect |
| Ответ | `Future<void>` — успех/исключение |
| Подписки | Нет stream |

Это **не** классический StatePort (не отдаёт состояние) и **не** EventPort (не инвалидирует чужой кэш — auth сам обновит stream через `AuthRepository`).

### Wiring

```dart
// lib/di/auth_port_adapters.dart
locator.registerLazySingleton<AuthSessionPort>(
  () => _AuthSessionPortAdapter(locator<AuthRepository>()),
);
```

`HomeBloc` инжектирует `AuthSessionPort`, вызывает `logOut()` по действию пользователя. UI-переключение на login — через `AuthNode` + `AuthenticationStatePort` stream, не через callback из home.

## Альтернативы (отклонены)

| Вариант | Почему нет |
|---------|------------|
| `AuthRepository` в HomeBloc | Нарушение DAG (import auth domain из home) |
| `AuthenticationStatePort.logOut()` | Смешивает read-state и command; нарушает ISP |
| EventPort `AuthInvalidated` | Logout — команда с await, не fire-and-forget инвалидация |
| Global EventBus | Запрещён антипаттерном ADR-010 |

## Последствия

- Новые session-команды (refresh token, revoke device) — расширять `AuthSessionPort` или добавить отдельный port, не раздувать StatePort.
- Документировать в KB: [05-domain-layer.md](../05-domain-layer.md), [08-decisions-log.md](../08-decisions-log.md) D15.

## Связанные ADR

- [adr-010-repository-vs-port.md](adr-010-repository-vs-port.md)

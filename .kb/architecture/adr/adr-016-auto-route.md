# ADR-016: Единый AppRouter на auto_route (supersedes ADR-013)

**Статус:** Принято  
**Дата:** 2026-07-28  
**Supersedes:** ADR-013

## Контекст

Разделение root/nested `Navigator` и ручные Map-маршруты были избыточны для маленького приложения (Splash → Login/Registration → Home → Chat, без табов).

## Решение

- `AppRouter extends RootStackRouter implements AppNavigator` в `navigation/`.
- Плоский стек: Splash, Login, Registration, Home, Chat.
- `AuthGuard` / `GuestGuard` + `AuthStatusReevaluateListenable` вместо `AuthNode` shell.
- Features зависят только от `AppNavigator` порта; типизированные аргументы через `ChatRoute`.

## Последствия

- Удалены `root_navigation/`, `nested_navigation/`, `workspace.dart`, `auth_node/`.
- Deep links и typed args становятся дешёвыми.

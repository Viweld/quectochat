# ADR-013: Ручные Map-маршруты вместо auto_route

**Статус:** Superseded by ADR-016  
**Дата:** 2026-07-28

## Контекст

QuectoChat использует `MaterialApp` с `onGenerateRoute` и двумя уровнями `Navigator` (root + nested в `Workspace`). В skeleton и правилах упоминается `auto_route`, но в текущем коде маршруты определены вручную:

- `navigation/lib/src/presentation/root_navigation/root_routes.dart` — splash, auth node, login, registration
- `navigation/lib/src/presentation/nested_navigation/nested_routes.dart` — home, chat

Features не должны зависеть от concrete navigator implementation. Нужен единый порт `AppNavigator` в `navigation_api/`.

## Решение

**Оставить manual Map routes.** Не мигрировать на `auto_route` на текущем этапе.

### Маршруты

```dart
// RootRoutes — MaterialApp.initialRoute + push/replace
static const routeSplash = '/';
static const routeAuthNode = 'routeAuthController/';
static const routeLogin = 'routeLogin/';
static const routeRegistration = 'routeRegistration/';

// NestedRoutes — Workspace nested navigator
static const routeHome = 'routeHome/';
static const routeChat = 'routeChat/';
```

Builders — `Map<String, WidgetBuilder> getRouteBuilders()`.

### AppNavigator

Все переходы из features и shell — через `AppNavigator` (`navigation_api/lib/src/app_navigator.dart`):

| Метод | Поведение |
|-------|-----------|
| `navigateSplash()` | `pushNamedAndRemoveUntil` root splash |
| `navigateAuthNode()` | `pushReplacementNamed` auth node |
| `navigateLogin()` / `navigateRegistration()` | push на root |
| `navigateBack()` | pop nested, иначе pop root |
| `popToRoot()` | `popUntil` first route на root |
| `navigateChat(...)` | push chat на nested с arguments |

Реализация: `AppNavigatorImpl` — единственное место прямого доступа к `NavigatorState` (через `GlobalKey`).

### Запреты

- `Navigator.pop/push/...` в `features/*` и `shared_ui/*`.
- Исключение: `AppNavigatorImpl`, `Workspace` (`PopScope` + nested pop / `SystemNavigator.pop`).

BLoC эмитит `Effect`; screen listener вызывает `AppNavigator`.

## Альтернативы (отклонены)

| Вариант | Почему нет |
|---------|------------|
| **auto_route** | Overhead codegen и `@RoutePage` для 6 экранов; текущий Map-подход проще и уже работает |
| **go_router** | Смена стека; нет явной выгоды для двухуровневой схемы MVP |
| **Navigator в каждом feature** | Нарушает DAG и дублирует keys |

## Последствия

- Новый экран: константа route → builder в Map → метод `AppNavigator` → вызов из UI/Effect.
- ADR-005 (RouteDefinition без BLoC) остаётся в силе по духу; path-dep на feature-presentation через import экранов в `RootRoutes`/`NestedRoutes`.
- При росте числа маршрутов (>15) или deep links — пересмотреть ADR и оценить `go_router` / `auto_route` заново.

## Связанные документы

- [04-navigation-and-flows.md](../04-navigation-and-flows.md)
- [adr-005-navigation-routes.md](adr-005-navigation-routes.md)

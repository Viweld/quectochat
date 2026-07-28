# ADR-005: Navigation агрегирует RouteDefinition

**Статус:** Принято  
**Дата:** 2026-07-08

## Контекст

Navigation не должен тянуть BLoC и domain feature-пакетов.

## Решение

`navigation` импортирует **только** `presentation/routes/` feature.

### Запрещено импортировать

`bloc/`, `domain/`, `data/`.

### `presentation/routes/`

- не имеет права импортировать `bloc/`;
- запрещено создавать BLoC в определении маршрута (`LoginScreen(bloc: LoginBloc(...))`);
- BLoC создаётся в `*_screen.dart` через DI.

С `auto_route` path-dep на feature-пакет остаётся — принятый компромисс.

Guards: контракты (`AuthenticationStatePort`) в `navigation_api` или consumer `domain/ports/`; wiring — `app_di.dart`.

## Последствия

- Чёткая граница navigation ↔ presentation.
- Маршруты — тонкие определения без бизнес-логики.

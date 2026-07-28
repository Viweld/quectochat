# ADR-011: Infrastructure не знает Feature

**Статус:** Принято  
**Дата:** 2026-07-08

## Контекст

Business API в infrastructure создаёт жёсткую связь и нарушает vertical slices.

## Решение

### Запрещено в `infrastructure/`

- `AuthApi`, `ClinicApi`, `BookingApi` и любые business endpoints;
- feature-specific DataSource impl;
- импорты `features/*`.

### Разрешено в `infrastructure/`

- `DioClient`, `HttpExecutor`, `RetryPolicy`, `TokenInterceptor`;
- `SecureStorage`, `DatabaseOpener`;
- SDK wrappers (Google Sign-In, Apple Sign-In).

Граница: infrastructure знает **как** ходить в сеть/хранилище; feature/data знает **куда** и **что** (эндпоинты, DTO).

## Последствия

- Retrofit `@RestApi` с business paths — в `feature/data/datasources/`.
- Graph rule: `infrastructure ↛ features`.

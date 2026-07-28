# ADR-009: `shared_domain` — не God Package

**Статус:** Принято  
**Дата:** 2026-07-08

## Контекст

При миграции с глобального `domain/` есть риск перенести всё в `shared_domain`.

## Решение

В `shared_domain` попадают **только** типы, используемые **двумя и более независимыми feature** (например `Outcome`, `PaginationState`, `Country`).

**Запрещено** переносить в `shared_domain` сущности одной feature (`User` → `auth/domain/entities/`, `Clinic` → `onboarding/domain/entities/`).

При добавлении типа в `shared_domain` — ADR update с перечислением потребителей (минимум 2 feature).

Graph checker: warning при признаках feature-specific entity в `shared_domain`.

## Последствия

- `shared_domain` остаётся тонким kernel, не вторым global domain.
- Каждое добавление типа — осознанное решение.

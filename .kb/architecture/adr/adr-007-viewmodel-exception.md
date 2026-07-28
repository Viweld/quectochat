# ADR-007: ViewModel — редкое исключение

**Статус:** Принято  
**Дата:** 2026-07-08

## Контекст

Не нужен отдельный presentation-слой моделей для каждого экрана.

## Решение

**По умолчанию:** `Repository → Domain Model → BLoC → Widget`.

ViewModel (`presentation/<screen>/models/`) — только если:

- экран агрегирует несколько domain-моделей в одну UI-структуру;
- независимые секции с собственной presentation-моделью;
- нужна адаптация, которую нецелесообразно держать в Domain.

`AppErrorViewModel` — **не** screen ViewModel; живёт в `shared_core/error_handling/`.

## Последствия

- Меньше boilerplate в presentation.
- ViewModel появляется только с обоснованием в code review.

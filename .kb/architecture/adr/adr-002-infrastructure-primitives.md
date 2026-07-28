# ADR-002: Infrastructure — технические примитивы

**Статус:** Принято  
**Дата:** 2026-07-08

## Контекст

Нужно отделить транспорт и SDK от бизнес-логики feature.

## Решение

`infrastructure` предоставляет: `DioClient`, `SecureStorage`, `Database`, SDK wrappers.

**DataSource** (interface + impl) — в `feature/data/datasources/`. `DioClient` — через `shared_core/contracts/`.

Подробнее о границе infrastructure ↔ feature — **ADR-011**.

## Последствия

- Feature знает эндпоинты и DTO; infrastructure знает только «как» ходить в сеть/хранилище.

# ADR-006: Lean Domain

**Статус:** Принято  
**Дата:** 2026-07-08

## Контекст

Domain не должен раздуваться «на вырост» и дублировать Repository интерфейсами Port.

## Решение

**Базовый шаблон `feature/domain/`:**

```
domain/
├── entities/
├── repositories/
└── ports/              # при необходимости cross-feature
```

### Правила

- только каталоги, которые **реально используются**;
- не создавать заранее `services/`, `value_objects/`, `policies/`, `factories/`, `providers/`;
- Domain Model используется Presentation **напрямую**, если не нужна специальная адаптация.

Подробнее о Port — **ADR-010**. Не дублировать Repository интерфейсами `*RepositoryPort`.

## Последствия

- Минимальный domain в каждом feature.
- Новые папки — по Directory on Demand (ADR-008).

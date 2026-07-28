# Architecture Principles

> **Статус: заморожена** (после финального аудита). Изменения — только через ADR с явной причиной и датой.

Точка входа для разработчиков. Читать **до** [adr/](adr/).

1. **Feature First** — feature является основной единицей проекта.
2. **Feature независимы** — не импортируют друг друга; связь через DI (`lib/di/app_di.dart`) и navigation.
3. **BLoC = Application Layer** — orchestration; **Repository** — источник истины (без `_cached*` бизнес-данных в BLoC).
4. **UseCase отсутствуют** — логика в хэндлерах BLoC.
5. **Domain Model в UI напрямую** — ViewModel только при необходимости (ADR-7).
6. **DTO только в Data** — не покидают `feature/data/`.
7. **Repository** — единственная граница внешний мир ↔ Domain (маппинг DTO/SQLite/… → Domain). См. ADR-10.
8. **StatePort / EventPort** — узкие cross-feature контракты (состояние / событие-инвалидация). Не заменяют Repository. См. ADR-10.
9. **Infrastructure не знает Feature** — только технические примитивы (`DioClient`, Storage, SDK).
10. **`shared_domain`** — только модели 2+ независимых feature (ADR-9).
11. **Directory on Demand** — папки не создаются заранее (ADR-8).
12. **Любое исключение** — отражено в ADR.

## Терминология

| Уровень | Папка | Примеры |
|---------|-------|---------|
| Repository (своя feature) | `feature/domain/repositories/` | `AuthRepository`, `ProfileRepository` |
| StatePort (cross-feature) | `feature/domain/ports/`, `navigation_api/` | `AuthenticationStatePort`, `OnboardingStatePort` |
| EventPort (cross-feature) | `feature/domain/ports/`, `navigation_api/` | `OrdersInvalidationPort` (иллюстрация) |
| Технический контракт | `shared_core/contracts/` | `ApiCallWrapper`, storage ports |

**Три вида контрактов (ADR-10):** Repository → данные; StatePort → ограниченное состояние; EventPort → событие без Domain Model.

**Не путать:** `domain/ports/` (бизнес, StatePort/EventPort) ≠ `shared_core/contracts/` (техника).

Подробности и примеры: [adr/adr-010-repository-vs-port.md](adr/adr-010-repository-vs-port.md).

## Поток данных

```
Repository → Domain Model → BLoC → Widget
```

## Миграция

**Завершена (2026-07):** incremental strangler от D13 к vertical slices. Глобальные `domain/` и `data/` удалены; strict DAG включён.

Устаревший план D13: [../plans/architecture-dag-improvements.md](../plans/architecture-dag-improvements.md) (deprecated).

Подробности: [adr/](adr/)

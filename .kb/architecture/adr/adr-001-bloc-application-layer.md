# ADR-001: BLoC = Application Layer

**Статус:** Принято  
**Дата:** 2026-07-08

## Контекст

Нужен единый слой orchestration без отдельного UseCase-слоя.

## Решение

BLoC отвечает за **orchestration** (Controller / Presenter / Coordinator).

**BLoC не является источником истины.** Источник истины — `Repository`. Запрещено долгоживущее бизнес-состояние в полях BLoC (`_cachedUsers`, `_cachedProfile`, `_cachedBookings`).

### Разрешено

- вызывать несколько `Repository` и `Port`;
- последовательность async-операций, ветвление сценария;
- обработка ошибок (`BlocErrorHandler`, `Outcome`, `Failure` → `AppErrorKind`);
- работа с **Domain Model** в State (UI-состояние экрана, не кэш домена);
- генерация `State` и `Effect`.

### Запрещено

- DTO, DataSource, Dio, Retrofit, SQLite, Firebase SDK, SharedPreferences;
- JSON parsing;
- `BuildContext`, навигация, диалоги (только Effects);
- кэширование доменных данных вне `Repository`.

**Нет** UseCases. **Нет** Mapper в BLoC — преобразования внешних моделей → Domain только в `Repository` (ADR-010).

## Последствия

- Меньше слоёв, явная ответственность BLoC.
- Code review: отклонять `_cached*` бизнес-данные в BLoC.

# ADR-010: Repository vs StatePort vs EventPort

**Статус:** Принято  
**Дата:** 2026-07-08  
**Дополнение:** 2026-07-09 — раздел «Виды контрактов», StatePort / EventPort

## Контекст

Нужно различать полный контракт контекста, узкий cross-feature API для **чтения состояния** и узкий cross-feature API для **уведомления о событиях**; зафиксировать единственное место маппинга внешних моделей → Domain.

В проекте **нет** общих базовых классов `BaseRepository`, `BaseStatePort`, `BaseEventPort` и обязательного наследования ради унификации. Каждый контракт — обычный `abstract interface class`, определяемый по месту использования (Directory on Demand, ADR-8).

## Решение (кратко)

| Вид | Назначение |
|-----|------------|
| **Repository** | полный контракт доступа к данным **своей** feature |
| **StatePort** | узкий контракт — получить **ограниченное состояние** другой feature |
| **EventPort** | узкий контракт — **уведомить** другую feature о событии (инвалидация, не данные) |

Cross-feature wiring — только `lib/di/app_di.dart` и `lib/di/*_port_adapters.dart`. Feature A **не импортирует** package feature B.

---

## Виды контрактов

### 1. Repository

**Repository** — полный контракт доступа к данным своей feature.

Repository является владельцем данных своей предметной области (**Single Source of Truth**).

Repository **может:**

- загружать данные;
- кэшировать данные;
- объединять несколько источников (API, БД, cache);
- предоставлять реактивный `Stream`;
- самостоятельно поддерживать консистентность локального состояния после изменения данных.

Repository **не может:**

- содержать бизнес-правила предметной области;
- принимать решения уровня бизнес-процессов;
- знать о других feature.

Repository возвращает только **Domain Model**.

Repository — **единственное** место преобразования:

- DTO → Domain
- SQLite Entity → Domain
- Hive Object → Domain
- Firebase Document → Domain
- Proto → Domain
- любые внешние модели → Domain

DataSource возвращает transport-модели; Repository маппит в Domain.

Repository **не используется** как средство общения между feature.

```dart
abstract interface class OrdersRepository {
  Stream<List<Order>> watchOrders();

  Future<void> refresh();

  Future<void> createOrder(CreateOrderRequest request);
}
```

После успешного `createOrder` Repository самостоятельно может обновить локальное состояние и уведомить подписчиков `watchOrders()`. Это **инфраструктурная консистентность**, не бизнес-логика.

### 2. StatePort

**StatePort** — узкий контракт, предоставляющий другой feature только **необходимое состояние** (Interface Segregation).

StatePort **не** является Repository.

StatePort **не** возвращает полный API другой feature.

StatePort **не** обязан возвращать Domain Model — только то, что нужно consumer feature.

StatePort создаётся **только** когда одной feature нужна ограниченная информация из другой **без нарушения DAG**.

```dart
abstract interface class AuthenticationStatePort {
  AuthenticationState get authState;

  Stream<AuthenticationState> get authStateStream;
}
```

```dart
abstract interface class OnboardingStatePort {
  Future<bool> isOnboardingRequired();
}
```

Если BLoC использует **весь** Repository своей feature, отдельный StatePort **не нужен**.

Размещение: `feature/domain/ports/` или `navigation_api/` (bootstrap/guards).

### 3. EventPort

**EventPort** — узкий контракт для **уведомления** другой feature о произошедшем событии.

EventPort **не** передаёт Domain Model.

EventPort **не** инициирует бизнес-операции в чужой feature.

EventPort **не** является глобальным EventBus приложения.

EventPort существует только для взаимодействия **двух** независимых feature.

**Идея:** feature сообщает не данные, а факт того, что состояние другой feature **потенциально устарело**. Принимающая feature сама решает: обновлять ли данные, когда и через какой Repository.

**Предпочтительно** — событие-инвалидатор, не payload:

```dart
abstract interface class OrdersInvalidationPort {
  Stream<void> get stream;

  void invalidate();
}
```

или

```dart
sealed class OrdersEvent {}

final class OrdersInvalidated extends OrdersEvent {}
```

**Плохо** как payload EventPort: `Order`, `List<Order>`, DTO, `bool`, `String`, `int`.

---

## Типовая схема взаимодействия

```
Repository  →  данные (своя feature)
StatePort   →  ограниченное состояние (чужая feature)
EventPort   →  событие / инвалидация (между feature)
```

| Вопрос | Контракт |
|--------|----------|
| Откуда взять и изменить данные своей feature? | Repository |
| Нужен ли фрагмент состояния другой feature? | StatePort |
| Нужно ли сообщить, что данные другой feature могли устареть? | EventPort |

---

## Пример межфичевого взаимодействия (EventPort)

Две независимые feature: **Orders** и **CreateOrder**.

После успешного создания заказа **CreateOrder** **не должен:**

- знать `OrdersRepository`;
- вызывать `refresh()` чужой feature;
- импортировать Orders feature;
- передавать модели `Order`.

Вместо этого:

```text
CreateOrderFeature
        │
        ▼
OrdersInvalidationPort.invalidate()
        │
        ▼
OrdersFeature (слушает stream)
        │
        ▼
OrdersRepository.refresh()
        │
        ▼
watchOrders() → OrdersBloc
```

Каждая feature остаётся независимой.

---

## Правила применения

1. **Repository** — всегда для работы со **своими** данными внутри feature.
2. **StatePort** — только при необходимости получить **ограниченное состояние** другой feature.
3. **EventPort** — только когда нужно **уведомить** другую feature о событии (без передачи доменных данных).
4. Общие базовые Repository / StatePort / EventPort **не создавать**.
5. Обязательное наследование для унификации **не вводить**.
6. Повторяющийся код реализаций — выделять отдельно **только** по факту (Directory on Demand, ADR-8).

### StatePort появляется только когда

1. одна feature предоставляет сервис другой (через DI, не import);
2. нельзя импортировать feature-пакет напрямую (DAG);
3. нужен **subset** API, а не полный Repository.

### Антипаттерны

| Антипаттерн | Почему |
|-------------|--------|
| `UserRepositoryPort` дублирует `UserRepository` | StatePort не заменяет Repository |
| BLoC импортирует чужой `*Repository` | нарушение DAG; нужен StatePort или EventPort + свой Repository |
| EventPort передаёт `List<Order>` | это данные; нужна инвалидация |
| Один глобальный `AppEventBus` для всех feature | не EventPort; см. `shared_core` event buses только для UI/техники |

---

## Типовые примеры (иллюстрация, не обязательный шаблон)

Примеры фиксируют **семантику** контрактов. Имена и сигнатуры в реальном коде могут отличаться.

### Repository — `ProfileRepository` (проект)

```dart
abstract interface class ProfileRepository {
  UserProfile? get profileData;

  Stream<UserProfile?> get profileStream;

  Future<void> fetchProfileData();

  Future<Outcome<void, EmailChangeFailure>> confirmChangeEmail({required String code});
}
```

Полный API профиля, кэш + stream, маппинг DTO → `UserProfile` внутри `ProfileRepositoryImpl`.

### StatePort — `AuthenticationStatePort` (проект)

```dart
abstract interface class AuthenticationStatePort {
  AuthenticationState get authState;

  Stream<AuthenticationState> get authStateStream;
}
```

Guards и shell читают **только** состояние аутентификации. `AuthRepository` реализует полный контракт; adapter в `lib/di/auth_port_adapters.dart` регистрирует `AuthenticationStatePort` → `AuthRepository`.

### StatePort — `OnboardingStatePort` (проект)

```dart
abstract interface class OnboardingStatePort {
  Future<bool> isOnboardingRequired();
}
```

Splash и post-auth routing не импортируют `OnboardingRepository` напрямую. Wiring: `registerOnboardingPorts` → `OnboardingRepository`.

### EventPort — `OrdersInvalidationPort` (иллюстрация)

```dart
abstract interface class OrdersInvalidationPort {
  Stream<void> get stream;

  void invalidate();
}
```

`CreateOrder` вызывает `invalidate()` после успеха; `Orders` подписывается и сам решает вызвать `OrdersRepository.refresh()`. В текущем коде этап 2 такой пары feature нет — пример для будущих этапов.

---

## Последствия

- Cross-feature: StatePort / EventPort + `app_di.dart`, не import feature→feature.
- DTO и transport-модели не покидают `feature/data/`.
- BLoC своей feature зависит от своих Repository; для чужого состояния — StatePort; для реакции на чужое событие — EventPort + свой Repository.
- Технические контракты (`ApiCallWrapper`, storage) остаются в `shared_core/contracts/` — это **не** StatePort и не EventPort.

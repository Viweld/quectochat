# ADR-015: Firestore documents — transport; DTO boundary в feature/data

**Статус:** Superseded by ADR-017  
**Дата:** 2026-07-28

## Контекст

QuectoChat хранит данные в **Firebase Auth** и **Cloud Firestore**. SDK-типы (`DocumentSnapshot`, `QuerySnapshot`, `Map<String, dynamic>` из Firestore, `FirebaseAuthException`) — transport layer.

По ADR-010 и ADR-011:

- Domain не знает Firebase.
- Repository — единственная граница transport → Domain.
- DTO не покидают `feature/data/`.

## Решение

### Firestore docs = transport

- `AuthRemoteDataSourceImpl`, `HomeRemoteDataSourceImpl`, `ChatRemoteDataSourceImpl` работают с Firestore API напрямую.
- Ключи коллекций — `part 'firebase_keys.dart'` рядом с impl (не в domain).
- Исключения Firebase Auth маппятся в domain/network exceptions **в datasource или repository**, не в BLoC.

### DTO и mappers — в `feature/data/`

| Слой | Содержимое |
|------|------------|
| `datasources/*_impl.dart` | Запросы Firestore, сырые maps/snapshots |
| `datasources/*_mapper.dart` (part) | Map → промежуточная структура или сразу domain |
| `repositories/*_impl.dart` | Оркестрация, вызов datasource, финальный Domain |

Пример: `ChatRemoteDataSourceImpl` + `_MessageMapper` → `Message` в `ChatRepositoryImpl`.

### Запреты

- `DocumentSnapshot`, `FirebaseFirestore` в `domain/` и `presentation/`.
- Firestore field names (`snake_case` keys) в domain enums без mapper.
- `@JsonSerializable` DTO в domain (если понадобятся typed DTO — только в `data/`).

### Infrastructure boundary

- `infrastructure/` — **bootstrap only**: `Firebase.initializeApp`, `firebase_options`, messaging/crashlytics hooks.
- Feature-specific queries — **в feature/data**, не в global `infrastructure` repository.

## Альтернативы (отклонены)

| Вариант | Почему нет |
|---------|------------|
| Global Firestore service в `infrastructure` | Тянет feature-знание коллекций в infra; нарушает ADR-011 |
| Domain models с `@JsonSerializable` | Смешивает transport и domain |
| Firestore в BLoC | Нарушает Clean Architecture |

## Последствия

- Смена backend (REST вместо Firestore) — меняется только `feature/data/datasources/`, domain и BLoC стабильны.
- Новая коллекция — keys + impl + mapper в соответствующем feature slice.
- Тесты data: mock Firestore или fake datasource, не mock SDK в BLoC.

## Связанные ADR

- [adr-010-repository-vs-port.md](adr-010-repository-vs-port.md)
- [adr-011-infrastructure-boundary.md](adr-011-infrastructure-boundary.md)

## Реализация в коде

- `features/auth/lib/data/datasources/auth_remote_data_source_impl.dart`
- `features/home/lib/data/datasources/home_remote_data_source_impl.dart`
- `features/chat/lib/data/datasources/chat_remote_data_source_impl.dart`
- `infrastructure/lib/src/firebase/firebase_bootstrap.dart`

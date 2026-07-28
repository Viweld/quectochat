# ADR-004: `feature_module.dart` — только свой модуль

**Статус:** Принято  
**Дата:** 2026-07-08

## Контекст

Feature-модули DI не должны регистрировать чужие зависимости или обращаться к глобальному GetIt.

## Решение

```dart
void registerAuthModule(GetIt locator) {
  // AuthRepository, datasources, BLoCs — только auth
}
```

### Правила

- регистрирует только зависимости **своей** feature;
- **запрещено** `GetIt.instance` / `GetIt.I` внутри модуля — только переданный `locator`;
- **не регистрирует** wiring `OnboardingStatePort`, `AuthenticationStatePort` — это `app_di.dart`.

## Последствия

- Тестируемость: модуль принимает `GetIt` явно.
- Cross-feature — только в Composition Root.

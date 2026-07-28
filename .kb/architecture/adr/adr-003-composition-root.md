# ADR-003: Единственный Composition Root

**Статус:** Принято  
**Дата:** 2026-07-08

## Контекст

Cross-feature wiring не должен размазываться по feature-модулям.

## Решение

Только `lib/di/app_di.dart`. Папки `lib/bootstrap/` **нет**.

Cross-feature wiring — **только** здесь:

```dart
registerAuthModule(locator);
registerOnboardingModule(locator);

locator.registerLazySingleton<OnboardingStatePort>(
  () => locator<OnboardingRepository>(),
);
```

## Последствия

- Одна точка для понимания графа зависимостей приложения.
- Feature-модули не знают о портах других feature.

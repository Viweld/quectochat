part of 'form_fields.dart';

/// Состояния ошибок валидации
enum PasswordFieldError {
  emptyField,
}

// -----------------------------------------------------------------------------
@immutable
final class PasswordField extends FormField<String, PasswordFieldError> {
  const PasswordField({
    super.value,
    super.isErrorVisible,
  });

  @override
  PasswordFieldError? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return PasswordFieldError.emptyField;
    } else {
      return null;
    }
  }

  @override
  PasswordField copyWithVisibleError({
    required bool isErrorVisible,
  }) =>
      PasswordField(
        value: super.value,
        isErrorVisible: isErrorVisible,
      );
}

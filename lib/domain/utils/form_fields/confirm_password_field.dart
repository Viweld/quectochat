part of 'form_fields.dart';

/// Состояния ошибок валидации
enum ConfirmPasswordFieldError {
  emptyField,
  notEqual,
}

// -----------------------------------------------------------------------------
@immutable
final class ConfirmPasswordField
    extends FormField<String, ConfirmPasswordFieldError> {
  const ConfirmPasswordField({
    this.password,
    super.value,
    super.isErrorVisible,
  });

  final String? password;

  @override
  ConfirmPasswordFieldError? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return ConfirmPasswordFieldError.emptyField;
    } else if (value != password) {
      return ConfirmPasswordFieldError.notEqual;
    } else {
      return null;
    }
  }

  @override
  ConfirmPasswordField copyWithVisibleError({
    required bool isErrorVisible,
  }) =>
      ConfirmPasswordField(
        password: password,
        value: super.value,
        isErrorVisible: isErrorVisible,
      );
}

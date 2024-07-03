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
    required this.basePassword,
    super.value = '',
    super.isErrorVisible,
  });

  final String basePassword;

  @override
  ConfirmPasswordFieldError? _validator(String value) {
    if (value.isEmpty) {
      return ConfirmPasswordFieldError.emptyField;
    } else if (value != basePassword) {
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
        basePassword: basePassword,
        value: super.value,
        isErrorVisible: isErrorVisible,
      );

  ConfirmPasswordField copyWithBasePassword({
    required String basePassword,
  }) =>
      ConfirmPasswordField(
        basePassword: basePassword,
        value: super.value,
        isErrorVisible: isErrorVisible,
      );
}

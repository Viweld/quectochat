part of 'form_fields.dart';

/// Состояния ошибок валидации
enum RequiredFieldError {
  emptyField,
}

// -----------------------------------------------------------------------------
@immutable
final class RequiredField extends FormField<String, RequiredFieldError> {
  const RequiredField({
    super.value = '',
    super.isErrorVisible,
  });

  @override
  RequiredFieldError? _validator(String value) {
    if (value.isEmpty) {
      return RequiredFieldError.emptyField;
    } else {
      return null;
    }
  }

  @override
  RequiredField copyWithVisibleError({
    required bool isErrorVisible,
  }) =>
      RequiredField(
        value: super.value,
        isErrorVisible: isErrorVisible,
      );
}

part of 'form_fields.dart';

/// Состояния ошибок валидации
enum EmailFieldError {
  emptyField,
  wrongFormat,
}

@immutable
final class EmailField extends FormField<String?, EmailFieldError> {
  const EmailField({
    super.value,
    super.isErrorVisible,
  });

  static final _emailRegExp = RegExp(
    r'^[a-zA-Z\d.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z\d-]+(?:\.[a-zA-Z\d-]+)*$',
  );

  @override
  EmailFieldError? _validator(String? value) {
    if (value == null || value.isEmpty) {
      return EmailFieldError.emptyField;
    } else if (!_emailRegExp.hasMatch(value)) {
      return EmailFieldError.wrongFormat;
    } else {
      return null;
    }
  }

  @override
  EmailField copyWithVisibleError({
    required bool isErrorVisible,
  }) =>
      EmailField(
        value: super.value,
        isErrorVisible: isErrorVisible,
      );
}

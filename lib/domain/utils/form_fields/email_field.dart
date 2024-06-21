import 'package:formz/formz.dart';

/// Состояния ошибок валидации
enum EmailFieldError {
  emptyField,
  wrongFormat,
}

/// Поле ввода email
class EmailField extends FormzInput<String, EmailFieldError> {
  const EmailField.dirty([super.value = '']) : super.dirty();

  const EmailField.pure() : super.pure('');

  @override
  EmailFieldError? validator(String value) {
    if (value.isEmpty) {
      return EmailFieldError.emptyField;
    } else if (!_validateEmail(value)) {
      return EmailFieldError.wrongFormat;
    } else {
      return null;
    }
  }

  bool _validateEmail(String value) {
    final emailRegex = RegExp(
      r'^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$',
    );
    return value.contains(emailRegex);
  }
}

import 'package:formz/formz.dart';

/// Состояния ошибок валидации
enum EmailInputError {
  emptyField,
  wrongFormat,
}

/// Поле ввода email
class EmailField extends FormzInput<String, EmailInputError> {
  const EmailField.dirty([super.value = '']) : super.dirty();

  const EmailField.pure() : super.pure('');

  @override
  EmailInputError? validator(String value) {
    if (value.isEmpty) {
      return EmailInputError.emptyField;
    } else if (!_validateEmail(value)) {
      return EmailInputError.wrongFormat;
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

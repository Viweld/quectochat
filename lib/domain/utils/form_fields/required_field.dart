import 'package:formz/formz.dart';

/// Состояния ошибок валидации
enum RequiredFieldError {
  emptyField,
}

/// Поле ввода email
class RequiredField extends FormzInput<String, RequiredFieldError> {
  const RequiredField.dirty([super.value = '']) : super.dirty();

  const RequiredField.pure() : super.pure('');

  @override
  RequiredFieldError? validator(String value) {
    if (value.isEmpty) {
      return RequiredFieldError.emptyField;
    } else {
      return null;
    }
  }
}

import 'package:flutter/foundation.dart';

part 'email_field.dart';

part 'password_field.dart';

part 'required_field.dart';

part 'confirm_password_field.dart';

@immutable
abstract base class FormField<T, E> {
  const FormField({required this.value, this.isErrorVisible = false});

  final T value;

  final bool isErrorVisible;

  E? get error => _validator(value);

  bool get valid => _validator(value) == null;

  bool get invalid => _validator(value) != null;

  E? _validator(T value);

  FormField<T, E> copyWithVisibleError({required bool isErrorVisible}) {
    throw UnimplementedError('Method copyWithVisibleError '
        'is not implemented in base class FormField');
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FormField &&
          runtimeType == other.runtimeType &&
          value == other.value &&
          isErrorVisible == other.isErrorVisible;

  @override
  int get hashCode => value.hashCode;
}

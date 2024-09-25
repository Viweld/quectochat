import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/dep_provider.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/common/common_accent_button.dart';
import 'package:quectochat/presentation/common/common_text_field.dart';

import '../../../domain/utils/form_fields/form_fields.dart';
import '../../common/common_toast.dart';
import '../../values/images.dart';
import '../../values/qicons.dart';
import '../../values/values.dart';
import 'bloc/registration_bloc.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.dep<RegistrationBloc>(),
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listenWhen: (_, state) => state.maybeMap(
          requestError: (_) => true,
          orElse: () => false,
        ),
        buildWhen: (_, state) => state.maybeMap(
          view: (_) => true,
          orElse: () => false,
        ),
        listener: (context, state) => state.mapOrNull(
          requestError: (s) => _requestError(context, s.error),
        ),
        builder: (context, state) => state.maybeMap(
          orElse: () => throw UnimplementedError(
            'Wrong state for RegistrationScreen',
          ),
          view: (s) => _RegistrationView(
            firstNameField: s.firstNameField,
            lastNameField: s.lastNameField,
            emailField: s.emailField,
            passwordField: s.passwordField,
            confirmPasswordField: s.confirmPasswordField,
            isLoading: s.isLoading,
          ),
        ),
      ),
    );
  }

  // КОЛЛБЕКИ на смену состояний
  // ---------------------------------------------------------------------------
  void _requestError(BuildContext context, RegistrationError? error) {
    CommonToast.showError(
      context,
      text: switch (error) {
        RegistrationError.weakPassword =>
          context.texts.registrationExceptionWeakPassword,
        RegistrationError.emailAlreadyUsed =>
          context.texts.registrationExceptionEmailAlreadyUsed,
        _ => context.texts.commonRequestError,
      },
    );
  }
}

class _RegistrationView extends StatelessWidget {
  const _RegistrationView({
    required this.firstNameField,
    required this.lastNameField,
    required this.emailField,
    required this.passwordField,
    required this.confirmPasswordField,
    required this.isLoading,
  });

  final RequiredField firstNameField;
  final RequiredField lastNameField;
  final EmailField emailField;
  final PasswordField passwordField;
  final ConfirmPasswordField confirmPasswordField;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: Transform.translate(
        offset: const Offset(-Values.horizontalPadding, 0),
        child: IconButton(
          padding: const EdgeInsets.all(16),
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Qicons.back,
            color: context.palette.grayDark,
            size: 32,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          horizontal: Values.horizontalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Логотип
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Image.asset(Images.logo),
            ),

            /// Заголовок
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(
                context.texts.registrationTitle,
                style: context.style32w600$mainTitle,
              ),
            ),

            /// Поле ввода Имени
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationFirstNameFieldTitle,
                hintText: context.texts.registrationFirstNameFieldHint,
                onChanged: (v) => _onFirstNameChanged(context, v),
                onUnfocused: () => _onFirstNameFieldUnfocused(context),
                textCapitalization: TextCapitalization.words,
                validationError:
                    firstNameField.invalid && firstNameField.isErrorVisible,
                validationErrorText: _getFirstNameErrorText(
                  context,
                  firstNameField.error,
                ),
              ),
            ),

            /// Поле ввода Фамилии
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationLastNameFieldTitle,
                hintText: context.texts.registrationLastNameFieldHint,
                onChanged: (v) => _onLastNameChanged(context, v),
                onUnfocused: () => _onLastNameFieldUnfocused(context),
                textCapitalization: TextCapitalization.words,
                validationError:
                    lastNameField.invalid && lastNameField.isErrorVisible,
                validationErrorText: _getLastNameErrorText(
                  context,
                  lastNameField.error,
                ),
              ),
            ),

            /// Поле ввода email
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationEmailFieldTitle,
                hintText: context.texts.registrationEmailFieldHint,
                onChanged: (v) => _onEmailChanged(context, v),
                onUnfocused: () => _onEmailFieldUnfocused(context),
                keyboardType: TextInputType.emailAddress,
                validationError:
                    emailField.invalid && emailField.isErrorVisible,
                validationErrorText: _getEmailErrorText(
                  context,
                  emailField.error,
                ),
              ),
            ),

            /// Поле ввода пароля
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationPasswordFieldTitle,
                hintText: context.texts.registrationPasswordFieldHint,
                onChanged: (v) => _onPasswordChanged(context, v),
                onUnfocused: () => _onPasswordFieldUnfocused(context),
                isPassword: true,
                validationError:
                    passwordField.invalid && passwordField.isErrorVisible,
                validationErrorText: _getPasswordErrorText(
                  context,
                  passwordField.error,
                ),
              ),
            ),

            /// Поле повтора пароля
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationPasswordFieldTitle,
                hintText: context.texts.registrationPasswordFieldHint,
                onChanged: (v) => _onConfirmPasswordChanged(context, v),
                onUnfocused: () => _onConfirmPasswordFieldUnfocused(context),
                isPassword: true,
                validationError: confirmPasswordField.invalid &&
                    confirmPasswordField.isErrorVisible,
                validationErrorText: _getConfirmPasswordErrorText(
                  context,
                  confirmPasswordField.error,
                ),
              ),
            ),

            /// Кнопка логирования
            CommonAccentButton(
              title: context.texts.registrationButtonLabel,
              isPending: isLoading,
              onTapped: () => _onLoginTapped(context),
            )
          ],
        ),
      ),
    );
  }

  // КОЛЛБЕКИ на действия пользователя:
  // ---------------------------------------------------------------------------
  _onFirstNameChanged(BuildContext context, String v) {
    context.read<RegistrationBloc>().add(
          RegistrationEvent.onFirstNameChanged(v),
        );
  }

  _onFirstNameFieldUnfocused(BuildContext context) {
    context.read<RegistrationBloc>().add(
          const RegistrationEvent.onFirstNameFieldUnfocused(),
        );
  }

  _onLastNameChanged(BuildContext context, String v) {
    context.read<RegistrationBloc>().add(
          RegistrationEvent.onLastNameChanged(v),
        );
  }

  _onLastNameFieldUnfocused(BuildContext context) {
    context.read<RegistrationBloc>().add(
          const RegistrationEvent.onLastNameFieldUnfocused(),
        );
  }

  void _onEmailChanged(BuildContext context, String v) {
    context.read<RegistrationBloc>().add(
          RegistrationEvent.onEmailChanged(v),
        );
  }

  void _onEmailFieldUnfocused(BuildContext context) {
    context.read<RegistrationBloc>().add(
          const RegistrationEvent.onEmailFieldUnfocused(),
        );
  }

  void _onPasswordChanged(BuildContext context, String v) {
    context.read<RegistrationBloc>().add(
          RegistrationEvent.onPasswordChanged(v),
        );
  }

  void _onPasswordFieldUnfocused(BuildContext context) {
    context.read<RegistrationBloc>().add(
          const RegistrationEvent.onPasswordFieldUnfocused(),
        );
  }

  _onConfirmPasswordChanged(BuildContext context, String v) {
    context.read<RegistrationBloc>().add(
          RegistrationEvent.onConfirmPasswordChanged(v),
        );
  }

  _onConfirmPasswordFieldUnfocused(BuildContext context) {
    context.read<RegistrationBloc>().add(
          const RegistrationEvent.onConfirmPasswordFieldUnfocused(),
        );
  }

  void _onLoginTapped(BuildContext context) {
    context.read<RegistrationBloc>().add(
          const RegistrationEvent.onLoginTapped(),
        );
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ:
  // ---------------------------------------------------------------------------
  String? _getFirstNameErrorText(
      BuildContext context, RequiredFieldError? error) {
    return error == null ? null : context.texts.commonEmptyFieldError;
  }

  String? _getLastNameErrorText(
      BuildContext context, RequiredFieldError? error) {
    return error == null ? null : context.texts.commonEmptyFieldError;
  }

  String? _getEmailErrorText(BuildContext context, EmailFieldError? error) {
    return error == null
        ? null
        : switch (error) {
            EmailFieldError.emptyField => context.texts.commonEmptyFieldError,
            EmailFieldError.wrongFormat =>
              context.texts.registrationExceptionWrongEmail,
          };
  }

  String? _getPasswordErrorText(
      BuildContext context, PasswordFieldError? error) {
    return error == null ? null : context.texts.commonEmptyFieldError;
  }

  _getConfirmPasswordErrorText(
    BuildContext context,
    ConfirmPasswordFieldError? error,
  ) {
    return error == null
        ? null
        : switch (error) {
            ConfirmPasswordFieldError.emptyField =>
              context.texts.commonEmptyFieldError,
            ConfirmPasswordFieldError.notEqual =>
              context.texts.registrationExceptionNotEqualPasswords,
          };
  }
}

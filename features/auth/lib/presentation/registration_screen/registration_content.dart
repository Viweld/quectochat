import 'package:auth/domain/utils/form_fields/form_fields.dart';
import 'package:auth/presentation/registration_screen/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

class RegistrationContent extends StatelessWidget {
  const RegistrationContent({
    super.key,
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
    final RegistrationBloc bloc = context.read<RegistrationBloc>();

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: CommonFloatingBackButton(
        onPressed: () => appLocator<AppNavigator>().navigateBack(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 20),
              child: Image.asset(Images.logo),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(context.texts.registrationTitle, style: context.mainTitle),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationFirstNameFieldTitle,
                hintText: context.texts.registrationFirstNameFieldHint,
                onChanged: (String value) => bloc.add(RegistrationEvent.onFirstNameChanged(value)),
                onUnfocused: () => bloc.add(const RegistrationEvent.onFirstNameFieldUnfocused()),
                textCapitalization: TextCapitalization.words,
                validationError: firstNameField.invalid && firstNameField.isErrorVisible,
                validationErrorText: _getRequiredFieldErrorText(context, firstNameField.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationLastNameFieldTitle,
                hintText: context.texts.registrationLastNameFieldHint,
                onChanged: (String value) => bloc.add(RegistrationEvent.onLastNameChanged(value)),
                onUnfocused: () => bloc.add(const RegistrationEvent.onLastNameFieldUnfocused()),
                textCapitalization: TextCapitalization.words,
                validationError: lastNameField.invalid && lastNameField.isErrorVisible,
                validationErrorText: _getRequiredFieldErrorText(context, lastNameField.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationEmailFieldTitle,
                hintText: context.texts.registrationEmailFieldHint,
                onChanged: (String value) => bloc.add(RegistrationEvent.onEmailChanged(value)),
                onUnfocused: () => bloc.add(const RegistrationEvent.onEmailFieldUnfocused()),
                keyboardType: TextInputType.emailAddress,
                validationError: emailField.invalid && emailField.isErrorVisible,
                validationErrorText: _getEmailErrorText(context, emailField.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationPasswordFieldTitle,
                hintText: context.texts.registrationPasswordFieldHint,
                onChanged: (String value) => bloc.add(RegistrationEvent.onPasswordChanged(value)),
                onUnfocused: () => bloc.add(const RegistrationEvent.onPasswordFieldUnfocused()),
                isPassword: true,
                validationError: passwordField.invalid && passwordField.isErrorVisible,
                validationErrorText: _getPasswordErrorText(context, passwordField.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationPasswordFieldTitle,
                hintText: context.texts.registrationPasswordFieldHint,
                onChanged: (String value) =>
                    bloc.add(RegistrationEvent.onConfirmPasswordChanged(value)),
                onUnfocused: () =>
                    bloc.add(const RegistrationEvent.onConfirmPasswordFieldUnfocused()),
                isPassword: true,
                validationError:
                    confirmPasswordField.invalid && confirmPasswordField.isErrorVisible,
                validationErrorText: _getConfirmPasswordErrorText(
                  context,
                  confirmPasswordField.error,
                ),
              ),
            ),
            CommonAccentButton(
              title: context.texts.registrationButtonLabel,
              isPending: isLoading,
              onTapped: () => bloc.add(const RegistrationEvent.onLoginTapped()),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  String? _getRequiredFieldErrorText(BuildContext context, RequiredFieldError? error) {
    return error == null ? null : context.texts.commonEmptyFieldError;
  }

  String? _getEmailErrorText(BuildContext context, EmailFieldError? error) {
    return error == null
        ? null
        : switch (error) {
            EmailFieldError.emptyField => context.texts.commonEmptyFieldError,
            EmailFieldError.wrongFormat => context.texts.registrationExceptionWrongEmail,
          };
  }

  String? _getPasswordErrorText(BuildContext context, PasswordFieldError? error) {
    return error == null ? null : context.texts.commonEmptyFieldError;
  }

  String? _getConfirmPasswordErrorText(BuildContext context, ConfirmPasswordFieldError? error) {
    return error == null
        ? null
        : switch (error) {
            ConfirmPasswordFieldError.emptyField => context.texts.commonEmptyFieldError,
            ConfirmPasswordFieldError.notEqual =>
              context.texts.registrationExceptionNotEqualPasswords,
          };
  }
}

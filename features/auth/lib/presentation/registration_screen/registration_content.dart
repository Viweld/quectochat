import 'package:auth/domain/utils/form_fields/form_fields.dart';
import 'package:auth/presentation/registration_screen/bloc/registration_bloc.dart';
import 'package:flutter/material.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

class RegistrationContent extends StatelessWidget {
  const RegistrationContent({
    super.key,
    required this.displayNameField,
    required this.emailField,
    required this.passwordField,
    required this.confirmPasswordField,
    required this.isLoading,
  });

  final RequiredField displayNameField;
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
              child: Image.asset(Images.logo, package: kPackageName),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Text(context.texts.registrationTitle, style: context.mainTitle),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationDisplayNameFieldTitle,
                hintText: context.texts.registrationDisplayNameFieldHint,
                onChanged: (String value) => bloc.add(RegistrationEvent.displayNameChanged(value)),
                onUnfocused: () => bloc.add(const RegistrationEvent.displayNameFieldUnfocused()),
                textCapitalization: TextCapitalization.words,
                validationError: displayNameField.invalid && displayNameField.isErrorVisible,
                validationErrorText: displayNameField.error == null
                    ? null
                    : context.texts.commonEmptyFieldError,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.registrationEmailFieldTitle,
                hintText: context.texts.registrationEmailFieldHint,
                onChanged: (String value) => bloc.add(RegistrationEvent.emailChanged(value)),
                onUnfocused: () => bloc.add(const RegistrationEvent.emailFieldUnfocused()),
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
                onChanged: (String value) => bloc.add(RegistrationEvent.passwordChanged(value)),
                onUnfocused: () => bloc.add(const RegistrationEvent.passwordFieldUnfocused()),
                isPassword: true,
                validationError: passwordField.invalid && passwordField.isErrorVisible,
                validationErrorText: passwordField.error == null
                    ? null
                    : context.texts.commonEmptyFieldError,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CommonEditField(
                title: context.texts.registrationConfirmPasswordFieldTitle,
                hintText: context.texts.registrationConfirmPasswordFieldHint,
                onChanged: (String value) =>
                    bloc.add(RegistrationEvent.confirmPasswordChanged(value)),
                onUnfocused: () =>
                    bloc.add(const RegistrationEvent.confirmPasswordFieldUnfocused()),
                isPassword: true,
                validationError:
                    confirmPasswordField.invalid && confirmPasswordField.isErrorVisible,
                validationErrorText: confirmPasswordField.error == null
                    ? null
                    : context.texts.registrationExceptionNotEqualPasswords,
              ),
            ),
            CommonAccentButton(
              title: context.texts.registrationButtonLabel,
              isPending: isLoading,
              onTapped: () => bloc.add(const RegistrationEvent.submitRequested()),
            ),
          ],
        ),
      ),
    );
  }

  String? _getEmailErrorText(BuildContext context, EmailFieldError? error) {
    return error == null
        ? null
        : switch (error) {
            EmailFieldError.emptyField => context.texts.commonEmptyFieldError,
            EmailFieldError.wrongFormat => context.texts.registrationExceptionWrongEmail,
          };
  }
}

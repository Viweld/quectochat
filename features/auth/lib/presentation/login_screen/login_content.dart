import 'package:auth/domain/utils/form_fields/form_fields.dart';
import 'package:auth/presentation/login_screen/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

class LoginContent extends StatelessWidget {
  const LoginContent({
    super.key,
    required this.emailField,
    required this.passwordField,
    required this.isLoading,
  });

  final EmailField emailField;
  final PasswordField passwordField;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final LoginBloc bloc = context.read<LoginBloc>();

    return Scaffold(
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
              child: Text(context.texts.loginTitle, style: context.mainTitle),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.loginEmailFieldTitle,
                hintText: context.texts.loginEmailFieldHint,
                onChanged: (String value) => bloc.add(LoginEvent.emailChanged(value)),
                onUnfocused: () => bloc.add(const LoginEvent.emailFieldUnfocused()),
                keyboardType: TextInputType.emailAddress,
                validationError: emailField.invalid && emailField.isErrorVisible,
                validationErrorText: _getEmailErrorText(context, emailField.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.loginPasswordFieldTitle,
                hintText: context.texts.loginPasswordFieldHint,
                onChanged: (String value) => bloc.add(LoginEvent.passwordChanged(value)),
                onUnfocused: () => bloc.add(const LoginEvent.passwordFieldUnfocused()),
                isPassword: true,
                validationError: passwordField.invalid && passwordField.isErrorVisible,
                validationErrorText: passwordField.error == null
                    ? null
                    : context.texts.commonEmptyFieldError,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CommonAccentButton(
                title: context.texts.loginButtonLabel,
                isPending: isLoading,
                onTapped: () => bloc.add(const LoginEvent.submitRequested()),
              ),
            ),
            TextButton(
              onPressed: isLoading
                  ? null
                  : () => bloc.add(const LoginEvent.registrationRequested()),
              child: Text(context.texts.loginToRegistrationButtonLabel),
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
            EmailFieldError.wrongFormat => context.texts.loginExceptionWrongEmail,
          };
  }
}

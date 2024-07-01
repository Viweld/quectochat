import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/common/common_accent_button.dart';
import 'package:quectochat/presentation/common/common_text_field.dart';

import '../../../domain/utils/form_fields/form_fields.dart';
import '../../common/common_toast.dart';
import '../../navigation/root_navigation/root_routes.dart';
import '../../values/images.dart';
import '../../values/values.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.depGen().buildLoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
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
            'Wrong state for LoginScreen',
          ),
          view: (s) => _LoginView(
            emailField: s.emailField,
            passwordField: s.passwordField,
            isLoading: s.isLoading,
          ),
        ),
      ),
    );
  }

  // КОЛЛБЕКИ на смену состояний
  // ---------------------------------------------------------------------------
  _requestError(BuildContext context, LoginError? error) {
    CommonToast.showError(
      context,
      text: switch (error) {
        LoginError.userNotFound => context.texts.loginExceptionUserNotFound,
        LoginError.wrongPassword => context.texts.loginExceptionWrongPassword,
        _ => context.texts.commonRequestError,
      },
    );
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({
    required this.emailField,
    required this.passwordField,
    required this.isLoading,
  });

  final EmailField emailField;
  final PasswordField passwordField;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
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
                context.texts.loginTitle,
                style: context.style32w600$mainTitle,
              ),
            ),

            /// Поле ввода email
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: CommonEditField(
                title: context.texts.loginEmailFieldTitle,
                hintText: context.texts.loginEmailFieldHint,
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
                title: context.texts.loginPasswordFieldTitle,
                hintText: context.texts.loginPasswordFieldHint,
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

            /// Кнопка логирования
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: CommonAccentButton(
                title: context.texts.loginButtonLabel,
                isPending: isLoading,
                onTapped: () => _onLoginTapped(context),
              ),
            ),

            /// Кнопка "Регистрация"
            TextButton(
              onPressed: isLoading ? null : () => _onRegisterTapped(context),
              child: Text(context.texts.loginToRegistrationButtonLabel),
            ),
          ],
        ),
      ),
    );
  }

  // КОЛЛБЕКИ на действия пользователя:
  // ---------------------------------------------------------------------------
  void _onEmailChanged(BuildContext context, String v) {
    context.read<LoginBloc>().add(LoginEvent.onLoginChanged(v));
  }

  void _onEmailFieldUnfocused(BuildContext context) {
    context.read<LoginBloc>().add(const LoginEvent.onLoginFieldUnfocused());
  }

  void _onPasswordChanged(BuildContext context, String v) {
    context.read<LoginBloc>().add(LoginEvent.onPasswordChanged(v));
  }

  void _onPasswordFieldUnfocused(BuildContext context) {
    context.read<LoginBloc>().add(const LoginEvent.onPasswordFieldUnfocused());
  }

  void _onLoginTapped(BuildContext context) {
    context.read<LoginBloc>().add(const LoginEvent.onLoginTapped());
  }

  void _onRegisterTapped(BuildContext context) {
    Navigator.pushNamed(context, RootRoutes.routeRegistration);
  }

  // ВСПОМОГАТЕЛЬНЫЕ МЕТОДЫ:
  // ---------------------------------------------------------------------------
  String? _getEmailErrorText(BuildContext context, EmailFieldError? error) {
    return error == null
        ? null
        : switch (error) {
            EmailFieldError.emptyField => context.texts.commonEmptyFieldError,
            EmailFieldError.wrongFormat =>
              context.texts.loginExceptionWrongEmail,
          };
  }

  _getPasswordErrorText(BuildContext context, PasswordFieldError? error) {
    return error == null ? null : context.texts.commonEmptyFieldError;
  }
}

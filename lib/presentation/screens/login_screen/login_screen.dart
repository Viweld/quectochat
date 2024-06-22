import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';
import 'package:quectochat/presentation/common/common_accent_button.dart';
import 'package:quectochat/presentation/common/common_text_field.dart';

import '../../../domain/utils/form_fields/form_fields.dart';
import '../../common/common_toast.dart';
import '../../values/values.dart';
import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
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
      ),
    );
  }

  // КОЛЛБЕКИ на смену состояний
  // ---------------------------------------------------------------------------
  _requestError(BuildContext context, LoginError? error) {
    CommonToast.showError(
      context,
      text: switch (error) {
        LoginError.userNotFound =>
          'Пользователь с таким email не зарегистрирован',
        LoginError.wrongPassword => 'Неправильный логин и/или пароль',
        _ => 'Ошибка сетевого запроса'
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
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: Values.horizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Заголовок
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              'Войти',
              style: context.style32w600$mainTitle,
            ),
          ),

          /// Поле ввода email
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CommonEditField(
              title: 'Введите логин:',
              hintText: 'e-mail',
              onChanged: (v) => _onEmailChanged(context, v),
              onUnfocused: () => _onEmailFieldUnfocused(context),
            ),
          ),

          /// Поле ввода пароля
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CommonEditField(
              title: 'Введите пароль:',
              hintText: 'пароль',
              onChanged: (v) => _onPasswordChanged(context, v),
              onUnfocused: () => _onPasswordFieldUnfocused(context),
            ),
          ),

          /// Кнопка логирования
          CommonAccentButton(
            title: 'Вход',
            isPending: isLoading,
            onTapped: () => _onLoginTapped(context),
          )
        ],
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
}

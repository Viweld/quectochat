import 'package:auth/presentation/login_screen/bloc/login_bloc.dart';
import 'package:auth/presentation/login_screen/login_content.dart';
import 'package:flutter/material.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppNavigator navigator = appLocator<AppNavigator>();

    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => appLocator<LoginBloc>(),
      child: BlocConsumer<LoginBloc, LoginState>(
        listenWhen: (LoginState previous, LoginState current) => previous.effect != current.effect,
        listener: (BuildContext context, LoginState state) {
          final LoginEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(
            showError: (AppErrorKind kind) =>
                CommonToast.showError(context, text: _resolveErrorText(context, kind)),
            navigateRegistration: navigator.navigateRegistration,
          );

          context.read<LoginBloc>().add(const LoginEvent.effectHandled());
        },
        builder: (BuildContext context, LoginState state) => LoginContent(
          emailField: state.emailField,
          passwordField: state.passwordField,
          isLoading: state.isLoading,
        ),
      ),
    );
  }

  String _resolveErrorText(BuildContext context, AppErrorKind kind) {
    return switch (kind) {
      AppErrorKind.invalidCredential => context.texts.loginExceptionInvalidCredential,
      AppErrorKind.userNotFound => context.texts.loginExceptionUserNotFound,
      AppErrorKind.wrongPassword => context.texts.loginExceptionWrongPassword,
      _ => context.texts.commonRequestError,
    };
  }
}

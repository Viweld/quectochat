import 'package:auth/presentation/registration_screen/bloc/registration_bloc.dart';
import 'package:auth/presentation/registration_screen/registration_content.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

@RoutePage()
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key, required this.inviteCode});

  final String inviteCode;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistrationBloc>(
      create: (BuildContext context) => appLocator<RegistrationBloc>(param1: inviteCode),
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listenWhen: (RegistrationState previous, RegistrationState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, RegistrationState state) {
          final RegistrationEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(
            showError: (AppErrorKind kind, String? detail) => CommonToast.showError(
              context,
              text: switch (kind) {
                AppErrorKind.weakPassword => context.texts.registrationExceptionWeakPassword,
                AppErrorKind.emailAlreadyUsed =>
                  context.texts.registrationExceptionEmailAlreadyUsed,
                AppErrorKind.emailRateLimit => context.texts.registrationExceptionRateLimit,
                AppErrorKind.invalidInvite => context.texts.registrationExceptionInvalidInvite,
                AppErrorKind.network => context.texts.toastNetworkError,
                AppErrorKind.server => context.texts.toastServerError,
                _ => context.texts.commonRequestError,
              },
            ),
          );

          context.read<RegistrationBloc>().add(const RegistrationEvent.effectHandled());
        },
        builder: (BuildContext context, RegistrationState state) => RegistrationContent(
          displayNameField: state.displayNameField,
          emailField: state.emailField,
          passwordField: state.passwordField,
          confirmPasswordField: state.confirmPasswordField,
          isLoading: state.isLoading,
        ),
      ),
    );
  }
}

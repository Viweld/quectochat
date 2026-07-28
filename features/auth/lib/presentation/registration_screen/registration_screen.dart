import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

import 'bloc/registration_bloc.dart';
import 'registration_content.dart';

@RoutePage()
class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => appLocator<RegistrationBloc>(),
      child: BlocConsumer<RegistrationBloc, RegistrationState>(
        listenWhen: (RegistrationState previous, RegistrationState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, RegistrationState state) {
          final RegistrationEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(
            showError: (AppErrorKind kind) => CommonToast.showError(
              context,
              text: switch (kind) {
                AppErrorKind.weakPassword => context.texts.registrationExceptionWeakPassword,
                AppErrorKind.emailAlreadyUsed =>
                  context.texts.registrationExceptionEmailAlreadyUsed,
                _ => context.texts.commonRequestError,
              },
            ),
          );

          context.read<RegistrationBloc>().add(const RegistrationEvent.effectHandled());
        },
        builder: (BuildContext context, RegistrationState state) => RegistrationContent(
          firstNameField: state.firstNameField,
          lastNameField: state.lastNameField,
          emailField: state.emailField,
          passwordField: state.passwordField,
          confirmPasswordField: state.confirmPasswordField,
          isLoading: state.isLoading,
        ),
      ),
    );
  }
}

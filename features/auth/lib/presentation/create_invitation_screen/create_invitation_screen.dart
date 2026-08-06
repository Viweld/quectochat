import 'package:auth/presentation/create_invitation_screen/bloc/create_invitation_bloc.dart';
import 'package:auth/presentation/create_invitation_screen/create_invitation_content.dart';
import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

@RoutePage()
class CreateInvitationScreen extends StatelessWidget {
  const CreateInvitationScreen({super.key, required this.targetRole});

  final String targetRole;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateInvitationBloc>(
      create: (_) => appLocator<CreateInvitationBloc>(param1: targetRole),
      child: BlocConsumer<CreateInvitationBloc, CreateInvitationState>(
        listenWhen: (CreateInvitationState previous, CreateInvitationState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, CreateInvitationState state) {
          final CreateInvitationEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(
            showError: (AppErrorKind kind) =>
                AppToast.showError(context, text: _resolveErrorText(context, kind)),
          );

          context.read<CreateInvitationBloc>().add(const CreateInvitationEvent.effectHandled());
        },
        builder: (BuildContext context, CreateInvitationState state) =>
            CreateInvitationContent(isLoading: state.isLoading, invitation: state.invitation),
      ),
    );
  }

  String _resolveErrorText(BuildContext context, AppErrorKind kind) {
    return switch (kind) {
      AppErrorKind.inviteExpired => context.texts.inviteCodeExpired,
      AppErrorKind.inviteUsed => context.texts.inviteCodeUsed,
      AppErrorKind.inviteNotFound => context.texts.inviteCodeNotFound,
      AppErrorKind.invalidInvite => context.texts.inviteCodeInvalid,
      AppErrorKind.network => context.texts.toastNetworkError,
      AppErrorKind.server => context.texts.toastServerError,
      _ => context.texts.commonRequestError,
    };
  }
}

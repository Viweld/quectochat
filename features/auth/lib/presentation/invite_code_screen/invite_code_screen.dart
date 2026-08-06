import 'package:auth/presentation/invite_code_screen/bloc/invite_code_bloc.dart';
import 'package:auth/presentation/invite_code_screen/invite_code_content.dart';
import 'package:flutter/material.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';

@RoutePage()
class InviteCodeScreen extends StatelessWidget {
  const InviteCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppNavigator navigator = appLocator<AppNavigator>();

    return BlocProvider<InviteCodeBloc>(
      create: (_) => appLocator<InviteCodeBloc>(),
      child: BlocConsumer<InviteCodeBloc, InviteCodeState>(
        listenWhen: (InviteCodeState previous, InviteCodeState current) =>
            previous.effect != current.effect,
        listener: (BuildContext context, InviteCodeState state) async {
          final InviteCodeEffect? effect = state.effect;
          if (effect == null) return;

          final InviteCodeBloc bloc = context.read<InviteCodeBloc>();

          await effect.when(
            navigateQrScanner: () async {
              final String? scanned = await navigator.navigateInviteQrScanner();
              if (!context.mounted) return;
              if (scanned != null && scanned.isNotEmpty) {
                bloc.add(InviteCodeEvent.codeFilledFromQr(scanned));
              }
            },
            navigateRegistration: (String inviteCode) =>
                navigator.navigateRegistration(inviteCode: inviteCode),
          );

          if (!context.mounted) return;
          bloc.add(const InviteCodeEvent.effectHandled());
        },
        builder: (BuildContext context, InviteCodeState state) => InviteCodeContent(
          code: state.code,
          isLoading: state.isLoading,
          inlineError: state.inlineError,
        ),
      ),
    );
  }
}

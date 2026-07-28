import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';
import 'package:shared_ui/core_ui.dart';

import 'bloc/home_bloc.dart';
import 'home_content.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => appLocator<HomeBloc>(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (HomeState previous, HomeState current) => previous.effect != current.effect,
        listener: (BuildContext context, HomeState state) {
          final HomeEffect? effect = state.effect;
          if (effect == null) return;

          effect.when(
            showError: (AppErrorKind kind) => CommonToast.showError(
              context,
              text: switch (kind) {
                _ => context.texts.commonRequestError,
              },
            ),
          );

          context.read<HomeBloc>().add(const HomeEvent.effectHandled());
        },
        builder: (BuildContext context, HomeState state) =>
            HomeContent(isFirstLoading: state.isFirstLoading, interlocutors: state.interlocutors),
      ),
    );
  }
}

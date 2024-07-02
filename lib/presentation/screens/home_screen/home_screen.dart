import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/domain/extensions/context_extensions.dart';

import '../../common/common_toast.dart';
import 'bloc/home_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.depGen().buildHomeBloc(),
      child: BlocConsumer<HomeBloc, HomeState>(
        listenWhen: (_, state) => state.maybeMap(
          requestError: (_) => true,
          orElse: () => false,
        ),
        buildWhen: (_, state) => state.maybeMap(
          view: (_) => true,
          orElse: () => false,
        ),
        listener: (context, state) => state.mapOrNull(
          requestError: (s) => _requestError(context, s.errorText),
        ),
        builder: (context, state) => state.maybeMap(
          orElse: () => throw UnimplementedError(
            'Wrong state for HomeScreen',
          ),
          view: (s) => Scaffold(
            appBar: AppBar(
              title: const Text('Добро пожаловать'),
            ),
            body: Center(
              child: TextButton(
                child: const Text('Выход'),
                onPressed: () => _onLogoutTapped(context),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onLogoutTapped(BuildContext context) {
    context.read<HomeBloc>().add(const HomeEvent.onLogoutTapped());
  }

  void _requestError(BuildContext context, String? errorText) {
    CommonToast.showError(
      context,
      text: errorText ?? context.texts.commonRequestError,
    );
  }
}

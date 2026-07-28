import 'package:flutter/material.dart';
import 'package:shared_core/core.dart';

import 'bloc/home_bloc.dart';
import 'home_content.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => appLocator<HomeBloc>(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) =>
            HomeContent(isFirstLoading: state.isFirstLoading, interlocutors: state.interlocutors),
      ),
    );
  }
}

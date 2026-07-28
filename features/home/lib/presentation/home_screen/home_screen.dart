import 'package:flutter/material.dart';
import 'package:home/presentation/home_screen/bloc/home_bloc.dart';
import 'package:home/presentation/home_screen/home_content.dart';
import 'package:shared_core/core.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => appLocator<HomeBloc>(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (BuildContext context, HomeState state) =>
            HomeContent(isFirstLoading: state.isFirstLoading, interlocutors: state.interlocutors),
      ),
    );
  }
}

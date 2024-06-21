import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quectochat/domain/environment/builders.dep_gen.dart';
import 'package:quectochat/presentation/screens/workspace.dart';

import '../../screens/login_screen/login_screen.dart';
import 'bloc/auth_bloc.dart';

class AuthController extends StatelessWidget {
  const AuthController({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => context.depGen().buildAuthBloc(),
      child: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) => state.map(
          authorized: (_) => const Workspace(),
          notAuthorized: (_) => const LoginScreen(),
        ),
      ),
    );
  }
}

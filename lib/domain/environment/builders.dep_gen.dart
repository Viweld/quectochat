// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint
// coverage:ignore-start

import 'dart:collection';

import 'package:flutter/widgets.dart';

// **************************************************************************
// DepGen code generator
// **************************************************************************

import 'package:quectochat/domain/interfaces/i_auth_repository.dart';
import 'package:quectochat/domain/interfaces/i_chat_repository.dart';
import 'package:quectochat/domain/interfaces/i_home_repository.dart';
import 'package:quectochat/presentation/navigation/auth_node/bloc/auth_bloc.dart';
import 'package:quectochat/presentation/screens/chat_screen/bloc/chat_bloc.dart';
import 'package:quectochat/presentation/screens/chat_screen/widgets/reading_view/bloc/reading_view_bloc.dart';
import 'package:quectochat/presentation/screens/chat_screen/widgets/typing_view/bloc/typing_view_bloc.dart';
import 'package:quectochat/presentation/screens/home_screen/bloc/home_bloc.dart';
import 'package:quectochat/presentation/screens/login_screen/bloc/login_bloc.dart';
import 'package:quectochat/presentation/screens/registration_screen/bloc/registration_bloc.dart';
import 'package:quectochat/presentation/screens/splash_screen/bloc/splash_bloc.dart';

/// The environment in which all used dependency instances are configured
@immutable
class DepGenEnvironment {
  DepGenEnvironment({Map<Type, Object>? initialServices})
      : _environment = initialServices ?? {};

  late final Map<Type, Object> _environment;

  // ---------------------------------------------------------------------------
  /// An unsafe method for getting an instance by its type. You need to be sure
  /// that an instance of the requested type has been registered
  T g<T>() => _environment[T] as T;

  // ---------------------------------------------------------------------------
  /// A safe method for trying to get an instance by its type.
  T? mayBeGet<T>() => _environment.containsKey(T) ? _environment[T] as T : null;

  // ---------------------------------------------------------------------------
  /// Registration of an instance with an indication of its type. You cannot
  /// register multiple instances of the same type
  void registry<T>(Object instance) => _environment[T] = instance;

  // ---------------------------------------------------------------------------
  /// Is the collection of instances blocked
  bool get isLocked => _environment is UnmodifiableMapView;

  // ---------------------------------------------------------------------------
  /// Returns an instance of the environment settings with the collection
  /// blocked from changes
  DepGenEnvironment lock() {
    return DepGenEnvironment(initialServices: Map.unmodifiable(_environment));
  }
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
extension DepProviderContextExtension on BuildContext {
  /// Obtain a value from the nearest ancestor DepProvider.
  DepProvider depGen() => DepProvider.of(this);
}

// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
class DepProvider extends InheritedWidget {
  const DepProvider({
    Key? key,
    required Widget child,
    required DepGenEnvironment environment,
  })  : _env = environment,
        super(key: key, child: child);

  // ---------------------------------------------------------------------------
  /// A pre-configured environment containing the dependencies used
  final DepGenEnvironment _env;
  DepGenEnvironment get environment => _env;

  // ---------------------------------------------------------------------------
  static DepProvider of(BuildContext context) {
    final DepProvider? dp =
        context.findAncestorWidgetOfExactType<DepProvider>();
    if (dp == null) {
      throw UnimplementedError('DepProvider is not initialized in context');
    }
    return dp;
  }

  // ---------------------------------------------------------------------------
  @override
  bool updateShouldNotify(DepProvider oldWidget) {
    return false;
  }

  // ---------------------------------------------------------------------------
  /// An unsafe method for getting an instance by its type. You need to be sure
  /// that an instance of the requested type has been registered
  T g<T>() => _env.g<T>();

  // ---------------------------------------------------------------------------
  /// A safe method for trying to get an instance by its type.
  T? mayBeGet<T>() => _env.mayBeGet<T>();

  // ---------------------------------------------------------------------------
  AuthBloc buildAuthBloc() => AuthBloc(
        authRepository: _env.g<IAuthRepository>(),
      );

  // ---------------------------------------------------------------------------
  ChatBloc buildChatBloc({
    required String interlocutorId,
  }) =>
      ChatBloc(
        interlocutorId: interlocutorId,
        chatRepository: _env.g<IChatRepository>(),
      );

  // ---------------------------------------------------------------------------
  ReadingViewBloc buildReadingViewBloc() => ReadingViewBloc(
        chatRepository: _env.g<IChatRepository>(),
      );

  // ---------------------------------------------------------------------------
  TypingViewBloc buildTypingViewBloc({
    required String interlocutorId,
  }) =>
      TypingViewBloc(
        interlocutorId: interlocutorId,
        chatRepository: _env.g<IChatRepository>(),
      );

  // ---------------------------------------------------------------------------
  HomeBloc buildHomeBloc() => HomeBloc(
        authRepository: _env.g<IAuthRepository>(),
        homeRepository: _env.g<IHomeRepository>(),
      );

  // ---------------------------------------------------------------------------
  LoginBloc buildLoginBloc() => LoginBloc(
        authRepository: _env.g<IAuthRepository>(),
      );

  // ---------------------------------------------------------------------------
  RegistrationBloc buildRegistrationBloc() => RegistrationBloc(
        authRepository: _env.g<IAuthRepository>(),
      );

  // ---------------------------------------------------------------------------
  SplashBloc buildSplashBloc() => SplashBloc(
        authRepository: _env.g<IAuthRepository>(),
      );
}
// coverage:ignore-end

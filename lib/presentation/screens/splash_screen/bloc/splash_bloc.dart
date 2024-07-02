import 'package:dep_gen/dep_gen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../domain/interfaces/i_auth_repository.dart';

part 'splash_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc({
    @DepArg() required IAuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const SplashState.notInitialized()) {
    on<SplashEvent>(
      (event, emitter) => event.map(
        onInitializationRequested: (e) =>
            _onInitializationRequested(e, emitter),
      ),
    );

    add(const SplashEvent.onInitializationRequested());
  }

  // ЗАВИСИМОСТИ
  // ---------------------------------------------------------------------------
  final IAuthRepository _authRepository;

  // СОСТОЯНИЕ
  // ---------------------------------------------------------------------------

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНЕШНЕГО события "нажата кнопка выйти"
  Future<void> _onInitializationRequested(
    _EventOnInitializationRequested event,
    Emitter<SplashState> emitter,
  ) async {
    await Future.delayed(const Duration(seconds: 2));
    _authRepository.checkAuth();
    emitter(const SplashState.initializationCompleted());
  }
}

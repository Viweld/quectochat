import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../domain/interfaces/i_auth_repository.dart';

part 'splash_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  @factoryMethod
  SplashBloc({
    required IAuthRepository authRepository,
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
    _authRepository.checkAuth();
    emitter(const SplashState.initializationCompleted());
  }
}

import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/interfaces/i_auth_repository.dart';

part 'auth_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    @DepArg() required IAuthRepository authRepository,
  }) : super(_initializeState(authRepository.authStatus)) {
    on<AuthEvent>((event, emitter) => event.map(
          onAuthStatusChanged: (e) => _onAuthStatusChanged(e, emitter),
        ));

    // подписываем блок на стрим AuthRepository
    _authStreamSubscription = authRepository.subscribe(_authStreamListener);
  }

  // СОСТОЯНИЕ
  // ---------------------------------------------------------------------------
  static AuthState _initializeState(AuthStatus initialStatus) =>
      switch (initialStatus) {
        AuthStatus.authorized => const _StateAuthorized(),
        AuthStatus.notAuthorized => const _StateNotAuthorized(),
      };

  // ПОДПИСКИ
  // ---------------------------------------------------------------------------
  late AuthSubscription _authStreamSubscription;

  // МЕТОДЫ ОБРАБОТКИ ПОДПИСОК:
  // ---------------------------------------------------------------------------
  @override
  Future<void> close() async {
    await _authStreamSubscription.cancel();
    await super.close();
  }

  /// Обработчик события в стриме AuthRepository
  void _authStreamListener(AuthStatus authStatus) {
    if (isClosed) return;
    add(AuthEvent.onAuthStatusChanged(authStatus));
  }

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  /// Обработчик ВНУТРЕННЕГО события "изменился статус аутентификации""
  Future<void> _onAuthStatusChanged(
    _EventOnAuthStatusChanged event,
    Emitter<AuthState> emitter,
  ) async {
    switch (event.val) {
      case AuthStatus.authorized:
        emitter(const AuthState.authorized());
      case AuthStatus.notAuthorized:
        emitter(const AuthState.notAuthorized());
    }
  }
}

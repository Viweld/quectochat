import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:navigation_api/navigation_api.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

part 'splash_bloc.freezed.dart';
part 'splash_effect.dart';
part 'splash_event.dart';
part 'splash_state.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  @factoryMethod
  SplashBloc(this._splashAuthenticationPort, this._blocErrorHandler) : super(const SplashState()) {
    on<SplashEvent>(
      (SplashEvent event, Emitter<SplashState> emit) => event.map(
        onInitializationRequested: (_) => _onInitializationRequested(emit),
        effectHandled: (_) => _onEffectHandled(emit),
      ),
    );

    add(const SplashEvent.onInitializationRequested());
  }

  final SplashAuthenticationPort _splashAuthenticationPort;
  final BlocErrorHandler _blocErrorHandler;

  void _onEffectHandled(Emitter<SplashState> emit) {
    emit(state.copyWith(effect: null));
  }

  Future<void> _onInitializationRequested(Emitter<SplashState> emit) async {
    emit(state.copyWith(isInitializing: true, effect: null));

    try {
      await _splashAuthenticationPort.checkAuth();
      final SplashEffect effect = _splashAuthenticationPort.authStatus == AuthStatus.authorized
          ? const SplashEffect.navigateHome()
          : const SplashEffect.navigateLogin();
      emit(state.copyWith(effect: effect));
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
      );
      if (presentation.shouldRethrow) rethrow;
    } finally {
      emit(state.copyWith(isInitializing: false));
    }
  }
}

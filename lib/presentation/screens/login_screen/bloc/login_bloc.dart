import 'package:dep_gen/dep_gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quectochat/domain/interfaces/i_api_facade.dart';

part 'login_bloc.freezed.dart';

part 'events.dart';

part 'states.dart';

@DepGen()
class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    @DepArg() required INetworkFacade networkFacade,
  })  : _networkFacade = networkFacade,
        super(_initializeViewState()) {
    // обрабатываем  события
    on<LoginEvent>((event, emitter) => event.map(
          onLoginTapped: (_) => _onLoginTapped(emitter),
        ));

    _viewState = super.state as _StateView;
  }

  // ---------------------------------------------------------------------------
  // ЗАВИСИМОСТИ
  final INetworkFacade _networkFacade;

  // СОСТОЯНИЕ
  late _StateView _viewState;

  static _StateView _initializeViewState() => const _StateView(
        data: 'начальные данные',
      );

  // МЕТОДЫ ОБРАБОТКИ СОБЫТИЙ:
  // ---------------------------------------------------------------------------
  // ---------------------------------------------------------------------------
  /// Обработчик ВНЕШНЕГО события "нажата кнопка залогиниться"
  Future<void> _onLoginTapped(
    Emitter<LoginState> emitter,
  ) async {
    // TODO(Vadim): #unimplemented
    throw UnimplementedError();
  }
}

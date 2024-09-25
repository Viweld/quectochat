// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:quectochat/data/firebase/firebase_service.dart' as _i977;
import 'package:quectochat/data/repositories/auth_repository.dart' as _i706;
import 'package:quectochat/data/repositories/chat_repository.dart' as _i416;
import 'package:quectochat/domain/interfaces/i_api_facade.dart' as _i547;
import 'package:quectochat/domain/interfaces/i_auth_repository.dart' as _i487;
import 'package:quectochat/domain/interfaces/i_chat_repository.dart' as _i226;
import 'package:quectochat/presentation/navigation/auth_node/bloc/auth_bloc.dart'
    as _i501;
import 'package:quectochat/presentation/screens/chat_screen/bloc/chat_bloc.dart'
    as _i625;
import 'package:quectochat/presentation/screens/chat_screen/widgets/reading_view/bloc/reading_view_bloc.dart'
    as _i435;
import 'package:quectochat/presentation/screens/chat_screen/widgets/typing_view/bloc/typing_view_bloc.dart'
    as _i485;
import 'package:quectochat/presentation/screens/home_screen/bloc/home_bloc.dart'
    as _i676;
import 'package:quectochat/presentation/screens/login_screen/bloc/login_bloc.dart'
    as _i563;
import 'package:quectochat/presentation/screens/registration_screen/bloc/registration_bloc.dart'
    as _i206;
import 'package:quectochat/presentation/screens/splash_screen/bloc/splash_bloc.dart'
    as _i761;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i547.INetworkFacade>(() => _i977.FirebaseService());
    gh.singleton<_i226.IChatRepository>(
        () => _i416.ChatRepository(networkFacade: gh<_i547.INetworkFacade>()));
    gh.factoryParam<_i625.ChatBloc, String, dynamic>((
      partnerId,
      _,
    ) =>
        _i625.ChatBloc(
          partnerId: partnerId,
          chatRepository: gh<_i226.IChatRepository>(),
        ));
    gh.singleton<_i487.IAuthRepository>(
        () => _i706.AuthRepository(networkFacade: gh<_i547.INetworkFacade>()));
    gh.factory<_i501.AuthBloc>(
        () => _i501.AuthBloc(authRepository: gh<_i487.IAuthRepository>()));
    gh.factory<_i563.LoginBloc>(
        () => _i563.LoginBloc(authRepository: gh<_i487.IAuthRepository>()));
    gh.factory<_i206.RegistrationBloc>(() =>
        _i206.RegistrationBloc(authRepository: gh<_i487.IAuthRepository>()));
    gh.factory<_i761.SplashBloc>(
        () => _i761.SplashBloc(authRepository: gh<_i487.IAuthRepository>()));
    gh.factory<_i676.HomeBloc>(() => _i676.HomeBloc(
          authRepository: gh<_i487.IAuthRepository>(),
          facade: gh<_i547.INetworkFacade>(),
        ));
    gh.factory<_i435.ReadingViewBloc>(() =>
        _i435.ReadingViewBloc(chatRepository: gh<_i226.IChatRepository>()));
    gh.factory<_i485.TypingViewBloc>(() =>
        _i485.TypingViewBloc(chatRepository: gh<_i226.IChatRepository>()));
    return this;
  }
}

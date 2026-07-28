// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation/src/app_router/app_router.dart' as _i1005;
import 'package:navigation/src/di/register_module.dart' as _i675;
import 'package:navigation/src/guards/auth_guard.dart' as _i813;
import 'package:navigation/src/guards/auth_status_reevaluate_listenable.dart' as _i158;
import 'package:navigation/src/guards/guest_guard.dart' as _i311;
import 'package:navigation/src/presentation/splash_screen/bloc/splash_bloc.dart' as _i672;
import 'package:navigation_api/navigation_api.dart' as _i842;
import 'package:shared_core/core.dart' as _i668;

class NavigationPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final registerModule = _$RegisterModule();
    gh.factory<_i672.SplashBloc>(
      () => _i672.SplashBloc(gh<_i842.SplashAuthenticationPort>(), gh<_i668.BlocErrorHandler>()),
    );
    gh.factory<_i813.AuthGuard>(() => _i813.AuthGuard(gh<_i842.AuthenticationStatePort>()));
    gh.factory<_i311.GuestGuard>(() => _i311.GuestGuard(gh<_i842.AuthenticationStatePort>()));
    gh.lazySingleton<_i158.AuthStatusReevaluateListenable>(
      () => registerModule.authStatusReevaluateListenable(gh<_i842.AuthenticationStatePort>()),
    );
    gh.lazySingleton<_i1005.AppRouter>(
      () => registerModule.appRouter(gh<_i813.AuthGuard>(), gh<_i311.GuestGuard>()),
    );
  }
}

class _$RegisterModule extends _i675.RegisterModule {}

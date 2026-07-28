// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:auth/data/datasources/auth_remote_data_source.dart' as _i906;
import 'package:auth/data/datasources/auth_remote_data_source_impl.dart' as _i512;
import 'package:auth/data/repositories/auth_repository_impl.dart' as _i288;
import 'package:auth/domain/repositories/auth_repository.dart' as _i698;
import 'package:auth/presentation/login_screen/bloc/login_bloc.dart' as _i553;
import 'package:auth/presentation/registration_screen/bloc/registration_bloc.dart' as _i336;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_core/core.dart' as _i668;

class AuthPackageModule extends _i526.MicroPackageModule {
  // initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i906.AuthRemoteDataSource>(() => _i512.AuthRemoteDataSourceImpl());
    gh.lazySingleton<_i698.AuthRepository>(
      () => _i288.AuthRepositoryImpl(remoteDataSource: gh<_i906.AuthRemoteDataSource>()),
    );
    gh.factory<_i553.LoginBloc>(
      () => _i553.LoginBloc(gh<_i698.AuthRepository>(), gh<_i668.BlocErrorHandler>()),
    );
    gh.factory<_i336.RegistrationBloc>(
      () => _i336.RegistrationBloc(gh<_i698.AuthRepository>(), gh<_i668.BlocErrorHandler>()),
    );
  }
}

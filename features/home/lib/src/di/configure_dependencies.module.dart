// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:home/data/datasources/home_remote_data_source.dart' as _i987;
import 'package:home/data/datasources/home_remote_data_source_impl.dart'
    as _i666;
import 'package:home/data/repositories/home_repository_impl.dart' as _i243;
import 'package:home/domain/repositories/home_repository.dart' as _i621;
import 'package:home/presentation/home_screen/bloc/home_bloc.dart' as _i200;
import 'package:home/presentation/nested_contacts_screen/bloc/nested_contacts_bloc.dart'
    as _i200;
import 'package:home/presentation/nested_contacts_screen/nested_contacts_args.dart'
    as _i1023;
import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation_api/navigation_api.dart' as _i842;
import 'package:shared_core/core.dart' as _i668;

class HomePackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i987.HomeRemoteDataSource>(
        () => _i666.HomeRemoteDataSourceImpl());
    gh.lazySingleton<_i621.HomeRepository>(() => _i243.HomeRepositoryImpl(
          remoteDataSource: gh<_i987.HomeRemoteDataSource>(),
          currentUserPort: gh<_i842.CurrentUserPort>(),
        ));
    gh.factory<_i200.HomeBloc>(() => _i200.HomeBloc(
          gh<_i842.AuthSessionPort>(),
          gh<_i621.HomeRepository>(),
          gh<_i668.BlocErrorHandler>(),
        ));
    gh.factoryParam<_i200.NestedContactsBloc, _i1023.NestedContactsArgs,
        dynamic>((
      args,
      _,
    ) =>
        _i200.NestedContactsBloc(
          gh<_i621.HomeRepository>(),
          gh<_i668.BlocErrorHandler>(),
          args: args,
        ));
  }
}

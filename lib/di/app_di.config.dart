// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auth/auth.dart' as _i662;
import 'package:chat/chat.dart' as _i377;
import 'package:get_it/get_it.dart' as _i174;
import 'package:home/home.dart' as _i1024;
import 'package:infrastructure/infrastructure.dart' as _i740;
import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation/navigation.dart' as _i1058;
import 'package:shared_core/core.dart' as _i668;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    await _i668.SharedCorePackageModule().init(gh);
    await _i740.InfrastructurePackageModule().init(gh);
    await _i1058.NavigationPackageModule().init(gh);
    await _i662.AuthPackageModule().init(gh);
    await _i1024.HomePackageModule().init(gh);
    await _i377.ChatPackageModule().init(gh);
    return this;
  }
}

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i687;

import 'package:chat/data/datasources/chat_remote_data_source.dart' as _i503;
import 'package:chat/data/datasources/chat_remote_data_source_impl.dart'
    as _i524;
import 'package:chat/data/repositories/chat_repository_impl.dart' as _i166;
import 'package:chat/domain/repositories/chat_repository.dart' as _i250;
import 'package:chat/presentation/chat_screen/bloc/chat_bloc.dart' as _i405;
import 'package:chat/presentation/chat_screen/widgets/reading_view/bloc/reading_view_bloc.dart'
    as _i639;
import 'package:chat/presentation/chat_screen/widgets/typing_view/bloc/typing_view_bloc.dart'
    as _i392;
import 'package:injectable/injectable.dart' as _i526;
import 'package:navigation_api/navigation_api.dart' as _i842;
import 'package:shared_core/core.dart' as _i668;

class ChatPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.lazySingleton<_i503.ChatRemoteDataSource>(
        () => _i524.ChatRemoteDataSourceImpl());
    gh.lazySingleton<_i250.ChatRepository>(() => _i166.ChatRepositoryImpl(
          remoteDataSource: gh<_i503.ChatRemoteDataSource>(),
          currentUserPort: gh<_i842.CurrentUserPort>(),
        ));
    gh.factory<_i639.ReadingViewBloc>(() => _i639.ReadingViewBloc(
          gh<_i250.ChatRepository>(),
          gh<_i668.BlocErrorHandler>(),
        ));
    gh.factoryParam<_i405.ChatBloc, String, dynamic>((
      interlocutorId,
      _,
    ) =>
        _i405.ChatBloc(
          gh<_i250.ChatRepository>(),
          gh<_i668.BlocErrorHandler>(),
          interlocutorId: interlocutorId,
        ));
    gh.factoryParam<_i392.TypingViewBloc, String, dynamic>((
      interlocutorId,
      _,
    ) =>
        _i392.TypingViewBloc(
          gh<_i250.ChatRepository>(),
          gh<_i668.BlocErrorHandler>(),
          interlocutorId: interlocutorId,
        ));
  }
}

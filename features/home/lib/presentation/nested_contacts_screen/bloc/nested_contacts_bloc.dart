import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:home/domain/repositories/home_repository.dart';
import 'package:home/presentation/nested_contacts_screen/nested_contacts_args.dart';
import 'package:shared_core/core.dart';
import 'package:shared_domain/shared_domain.dart';

part 'nested_contacts_bloc.freezed.dart';
part 'nested_contacts_event.dart';
part 'nested_contacts_state.dart';

@injectable
class NestedContactsBloc extends Bloc<NestedContactsEvent, NestedContactsState> {
  final HomeRepository _homeRepository;
  final BlocErrorHandler _blocErrorHandler;

  @factoryMethod
  NestedContactsBloc(
    this._homeRepository,
    this._blocErrorHandler, {
    @factoryParam required NestedContactsArgs args,
  }) : super(
         NestedContactsState(
           anchorUserId: args.anchorUserId,
           anchorDisplayName: args.anchorDisplayName,
           isFriendsOfRelative: args.isFriendsOfRelative,
         ),
       ) {
    on<NestedContactsInit>(_onInit);
    on<NestedContactsRetryRequested>(_onRetryRequested);
    add(const NestedContactsEvent.init());
  }

  Future<void> _onInit(NestedContactsInit event, Emitter<NestedContactsState> emit) async {
    await _loadContacts(emit);
  }

  Future<void> _onRetryRequested(
    NestedContactsRetryRequested event,
    Emitter<NestedContactsState> emit,
  ) async {
    await _loadContacts(emit);
  }

  Future<void> _loadContacts(Emitter<NestedContactsState> emit) async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true, loadError: null));

    try {
      final List<Interlocutor> contacts = await _homeRepository.getNestedContacts(
        anchorUserId: state.anchorUserId,
      );
      emit(state.copyWith(contacts: contacts));
    } on Object catch (error, stackTrace) {
      final ErrorPresentation presentation = _blocErrorHandler.handle(
        error,
        stackTrace: stackTrace,
        isSilent: true,
      );
      if (presentation.shouldRethrow) rethrow;
      emit(
        state.copyWith(loadError: AppErrorViewModel(kind: _mapLoadErrorKind(error, presentation))),
      );
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  AppErrorKind _mapLoadErrorKind(Object error, ErrorPresentation presentation) {
    return switch (presentation.toastKind) {
      AppToastErrorKind.network => AppErrorKind.network,
      AppToastErrorKind.server => AppErrorKind.server,
      _ => switch (classifyTransportError(error)) {
        TransportErrorKind.network => AppErrorKind.network,
        TransportErrorKind.server => AppErrorKind.server,
        TransportErrorKind.other => AppErrorKind.generic,
      },
    };
  }
}

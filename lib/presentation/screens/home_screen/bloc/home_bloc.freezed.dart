// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLogoutTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLogoutTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLogoutTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnLogoutTapped value) onLogoutTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLogoutTapped value)? onLogoutTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnLogoutTapped value)? onLogoutTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$EventOnLogoutTappedImplCopyWith<$Res> {
  factory _$$EventOnLogoutTappedImplCopyWith(_$EventOnLogoutTappedImpl value,
          $Res Function(_$EventOnLogoutTappedImpl) then) =
      __$$EventOnLogoutTappedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventOnLogoutTappedImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$EventOnLogoutTappedImpl>
    implements _$$EventOnLogoutTappedImplCopyWith<$Res> {
  __$$EventOnLogoutTappedImplCopyWithImpl(_$EventOnLogoutTappedImpl _value,
      $Res Function(_$EventOnLogoutTappedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventOnLogoutTappedImpl implements _EventOnLogoutTapped {
  const _$EventOnLogoutTappedImpl();

  @override
  String toString() {
    return 'HomeEvent.onLogoutTapped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnLogoutTappedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLogoutTapped,
  }) {
    return onLogoutTapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLogoutTapped,
  }) {
    return onLogoutTapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLogoutTapped,
    required TResult orElse(),
  }) {
    if (onLogoutTapped != null) {
      return onLogoutTapped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnLogoutTapped value) onLogoutTapped,
  }) {
    return onLogoutTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLogoutTapped value)? onLogoutTapped,
  }) {
    return onLogoutTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnLogoutTapped value)? onLogoutTapped,
    required TResult orElse(),
  }) {
    if (onLogoutTapped != null) {
      return onLogoutTapped(this);
    }
    return orElse();
  }
}

abstract class _EventOnLogoutTapped implements HomeEvent {
  const factory _EventOnLogoutTapped() = _$EventOnLogoutTappedImpl;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Iterable<ChatListItem> chatList, dynamic isLoading)
        view,
    required TResult Function(String? errorText) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<ChatListItem> chatList, dynamic isLoading)? view,
    TResult? Function(String? errorText)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<ChatListItem> chatList, dynamic isLoading)? view,
    TResult Function(String? errorText)? requestError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateView value) view,
    required TResult Function(_StateRequestError value) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateRequestError value)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateView value)? view,
    TResult Function(_StateRequestError value)? requestError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StateViewImplCopyWith<$Res> {
  factory _$$StateViewImplCopyWith(
          _$StateViewImpl value, $Res Function(_$StateViewImpl) then) =
      __$$StateViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Iterable<ChatListItem> chatList, dynamic isLoading});
}

/// @nodoc
class __$$StateViewImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$StateViewImpl>
    implements _$$StateViewImplCopyWith<$Res> {
  __$$StateViewImplCopyWithImpl(
      _$StateViewImpl _value, $Res Function(_$StateViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatList = null,
    Object? isLoading = freezed,
  }) {
    return _then(_$StateViewImpl(
      chatList: null == chatList
          ? _value.chatList
          : chatList // ignore: cast_nullable_to_non_nullable
              as Iterable<ChatListItem>,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
    ));
  }
}

/// @nodoc

class _$StateViewImpl implements _StateView {
  const _$StateViewImpl({this.chatList = const [], this.isLoading = false});

  @override
  @JsonKey()
  final Iterable<ChatListItem> chatList;
  @override
  @JsonKey()
  final dynamic isLoading;

  @override
  String toString() {
    return 'HomeState.view(chatList: $chatList, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateViewImpl &&
            const DeepCollectionEquality().equals(other.chatList, chatList) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(chatList),
      const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateViewImplCopyWith<_$StateViewImpl> get copyWith =>
      __$$StateViewImplCopyWithImpl<_$StateViewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Iterable<ChatListItem> chatList, dynamic isLoading)
        view,
    required TResult Function(String? errorText) requestError,
  }) {
    return view(chatList, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<ChatListItem> chatList, dynamic isLoading)? view,
    TResult? Function(String? errorText)? requestError,
  }) {
    return view?.call(chatList, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<ChatListItem> chatList, dynamic isLoading)? view,
    TResult Function(String? errorText)? requestError,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(chatList, isLoading);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateView value) view,
    required TResult Function(_StateRequestError value) requestError,
  }) {
    return view(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateRequestError value)? requestError,
  }) {
    return view?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateView value)? view,
    TResult Function(_StateRequestError value)? requestError,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(this);
    }
    return orElse();
  }
}

abstract class _StateView implements HomeState {
  const factory _StateView(
      {final Iterable<ChatListItem> chatList,
      final dynamic isLoading}) = _$StateViewImpl;

  Iterable<ChatListItem> get chatList;
  dynamic get isLoading;
  @JsonKey(ignore: true)
  _$$StateViewImplCopyWith<_$StateViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StateRequestErrorImplCopyWith<$Res> {
  factory _$$StateRequestErrorImplCopyWith(_$StateRequestErrorImpl value,
          $Res Function(_$StateRequestErrorImpl) then) =
      __$$StateRequestErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? errorText});
}

/// @nodoc
class __$$StateRequestErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$StateRequestErrorImpl>
    implements _$$StateRequestErrorImplCopyWith<$Res> {
  __$$StateRequestErrorImplCopyWithImpl(_$StateRequestErrorImpl _value,
      $Res Function(_$StateRequestErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_$StateRequestErrorImpl(
      errorText: freezed == errorText
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$StateRequestErrorImpl implements _StateRequestError {
  const _$StateRequestErrorImpl({this.errorText});

  @override
  final String? errorText;

  @override
  String toString() {
    return 'HomeState.requestError(errorText: $errorText)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateRequestErrorImpl &&
            (identical(other.errorText, errorText) ||
                other.errorText == errorText));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorText);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      __$$StateRequestErrorImplCopyWithImpl<_$StateRequestErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Iterable<ChatListItem> chatList, dynamic isLoading)
        view,
    required TResult Function(String? errorText) requestError,
  }) {
    return requestError(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Iterable<ChatListItem> chatList, dynamic isLoading)? view,
    TResult? Function(String? errorText)? requestError,
  }) {
    return requestError?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Iterable<ChatListItem> chatList, dynamic isLoading)? view,
    TResult Function(String? errorText)? requestError,
    required TResult orElse(),
  }) {
    if (requestError != null) {
      return requestError(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateView value) view,
    required TResult Function(_StateRequestError value) requestError,
  }) {
    return requestError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateRequestError value)? requestError,
  }) {
    return requestError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateView value)? view,
    TResult Function(_StateRequestError value)? requestError,
    required TResult orElse(),
  }) {
    if (requestError != null) {
      return requestError(this);
    }
    return orElse();
  }
}

abstract class _StateRequestError implements HomeState {
  const factory _StateRequestError({final String? errorText}) =
      _$StateRequestErrorImpl;

  String? get errorText;
  @JsonKey(ignore: true)
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

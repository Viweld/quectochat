// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ChatEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
    required TResult Function(String? message) onErrorReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function(String? message)? onErrorReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function(String? message)? onErrorReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnInitializationRequested value)
        onInitializationRequested,
    required TResult Function(_EventOnErrorReceived value) onErrorReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult? Function(_EventOnErrorReceived value)? onErrorReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult Function(_EventOnErrorReceived value)? onErrorReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatEventCopyWith<$Res> {
  factory $ChatEventCopyWith(ChatEvent value, $Res Function(ChatEvent) then) =
      _$ChatEventCopyWithImpl<$Res, ChatEvent>;
}

/// @nodoc
class _$ChatEventCopyWithImpl<$Res, $Val extends ChatEvent>
    implements $ChatEventCopyWith<$Res> {
  _$ChatEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EventOnInitializationRequestedImplCopyWith<$Res> {
  factory _$$EventOnInitializationRequestedImplCopyWith(
          _$EventOnInitializationRequestedImpl value,
          $Res Function(_$EventOnInitializationRequestedImpl) then) =
      __$$EventOnInitializationRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventOnInitializationRequestedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$EventOnInitializationRequestedImpl>
    implements _$$EventOnInitializationRequestedImplCopyWith<$Res> {
  __$$EventOnInitializationRequestedImplCopyWithImpl(
      _$EventOnInitializationRequestedImpl _value,
      $Res Function(_$EventOnInitializationRequestedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EventOnInitializationRequestedImpl
    implements _EventOnInitializationRequested {
  const _$EventOnInitializationRequestedImpl();

  @override
  String toString() {
    return 'ChatEvent.onInitializationRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnInitializationRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
    required TResult Function(String? message) onErrorReceived,
  }) {
    return onInitializationRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function(String? message)? onErrorReceived,
  }) {
    return onInitializationRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function(String? message)? onErrorReceived,
    required TResult orElse(),
  }) {
    if (onInitializationRequested != null) {
      return onInitializationRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnInitializationRequested value)
        onInitializationRequested,
    required TResult Function(_EventOnErrorReceived value) onErrorReceived,
  }) {
    return onInitializationRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult? Function(_EventOnErrorReceived value)? onErrorReceived,
  }) {
    return onInitializationRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult Function(_EventOnErrorReceived value)? onErrorReceived,
    required TResult orElse(),
  }) {
    if (onInitializationRequested != null) {
      return onInitializationRequested(this);
    }
    return orElse();
  }
}

abstract class _EventOnInitializationRequested implements ChatEvent {
  const factory _EventOnInitializationRequested() =
      _$EventOnInitializationRequestedImpl;
}

/// @nodoc
abstract class _$$EventOnErrorReceivedImplCopyWith<$Res> {
  factory _$$EventOnErrorReceivedImplCopyWith(_$EventOnErrorReceivedImpl value,
          $Res Function(_$EventOnErrorReceivedImpl) then) =
      __$$EventOnErrorReceivedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? message});
}

/// @nodoc
class __$$EventOnErrorReceivedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$EventOnErrorReceivedImpl>
    implements _$$EventOnErrorReceivedImplCopyWith<$Res> {
  __$$EventOnErrorReceivedImplCopyWithImpl(_$EventOnErrorReceivedImpl _value,
      $Res Function(_$EventOnErrorReceivedImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(_$EventOnErrorReceivedImpl(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EventOnErrorReceivedImpl implements _EventOnErrorReceived {
  const _$EventOnErrorReceivedImpl({this.message});

  @override
  final String? message;

  @override
  String toString() {
    return 'ChatEvent.onErrorReceived(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnErrorReceivedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventOnErrorReceivedImplCopyWith<_$EventOnErrorReceivedImpl>
      get copyWith =>
          __$$EventOnErrorReceivedImplCopyWithImpl<_$EventOnErrorReceivedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
    required TResult Function(String? message) onErrorReceived,
  }) {
    return onErrorReceived(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function(String? message)? onErrorReceived,
  }) {
    return onErrorReceived?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function(String? message)? onErrorReceived,
    required TResult orElse(),
  }) {
    if (onErrorReceived != null) {
      return onErrorReceived(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnInitializationRequested value)
        onInitializationRequested,
    required TResult Function(_EventOnErrorReceived value) onErrorReceived,
  }) {
    return onErrorReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult? Function(_EventOnErrorReceived value)? onErrorReceived,
  }) {
    return onErrorReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult Function(_EventOnErrorReceived value)? onErrorReceived,
    required TResult orElse(),
  }) {
    if (onErrorReceived != null) {
      return onErrorReceived(this);
    }
    return orElse();
  }
}

abstract class _EventOnErrorReceived implements ChatEvent {
  const factory _EventOnErrorReceived({final String? message}) =
      _$EventOnErrorReceivedImpl;

  String? get message;

  /// Create a copy of ChatEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventOnErrorReceivedImplCopyWith<_$EventOnErrorReceivedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() view,
    required TResult Function(String? errorText) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? view,
    TResult? Function(String? errorText)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? view,
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
abstract class $ChatStateCopyWith<$Res> {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) then) =
      _$ChatStateCopyWithImpl<$Res, ChatState>;
}

/// @nodoc
class _$ChatStateCopyWithImpl<$Res, $Val extends ChatState>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StateViewImplCopyWith<$Res> {
  factory _$$StateViewImplCopyWith(
          _$StateViewImpl value, $Res Function(_$StateViewImpl) then) =
      __$$StateViewImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StateViewImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$StateViewImpl>
    implements _$$StateViewImplCopyWith<$Res> {
  __$$StateViewImplCopyWithImpl(
      _$StateViewImpl _value, $Res Function(_$StateViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StateViewImpl implements _StateView {
  const _$StateViewImpl();

  @override
  String toString() {
    return 'ChatState.view()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StateViewImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() view,
    required TResult Function(String? errorText) requestError,
  }) {
    return view();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? view,
    TResult? Function(String? errorText)? requestError,
  }) {
    return view?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? view,
    TResult Function(String? errorText)? requestError,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view();
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

abstract class _StateView implements ChatState {
  const factory _StateView() = _$StateViewImpl;
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
    extends _$ChatStateCopyWithImpl<$Res, _$StateRequestErrorImpl>
    implements _$$StateRequestErrorImplCopyWith<$Res> {
  __$$StateRequestErrorImplCopyWithImpl(_$StateRequestErrorImpl _value,
      $Res Function(_$StateRequestErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
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
    return 'ChatState.requestError(errorText: $errorText)';
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

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      __$$StateRequestErrorImplCopyWithImpl<_$StateRequestErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() view,
    required TResult Function(String? errorText) requestError,
  }) {
    return requestError(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? view,
    TResult? Function(String? errorText)? requestError,
  }) {
    return requestError?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? view,
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

abstract class _StateRequestError implements ChatState {
  const factory _StateRequestError({final String? errorText}) =
      _$StateRequestErrorImpl;

  String? get errorText;

  /// Create a copy of ChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

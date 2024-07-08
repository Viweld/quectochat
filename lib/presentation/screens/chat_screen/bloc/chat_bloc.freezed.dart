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
    required TResult Function() onStateChanged,
    required TResult Function(String val) onMessageChanged,
    required TResult Function() onSendTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function()? onStateChanged,
    TResult? Function(String val)? onMessageChanged,
    TResult? Function()? onSendTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function()? onStateChanged,
    TResult Function(String val)? onMessageChanged,
    TResult Function()? onSendTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnInitializationRequested value)
        onInitializationRequested,
    required TResult Function(_EventOnStateChanged value) onStateChanged,
    required TResult Function(_EventOnMessageChanged value) onMessageChanged,
    required TResult Function(_EventOnSendTapped value) onSendTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult? Function(_EventOnStateChanged value)? onStateChanged,
    TResult? Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult? Function(_EventOnSendTapped value)? onSendTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult Function(_EventOnStateChanged value)? onStateChanged,
    TResult Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult Function(_EventOnSendTapped value)? onSendTapped,
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
    required TResult Function() onStateChanged,
    required TResult Function(String val) onMessageChanged,
    required TResult Function() onSendTapped,
  }) {
    return onInitializationRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function()? onStateChanged,
    TResult? Function(String val)? onMessageChanged,
    TResult? Function()? onSendTapped,
  }) {
    return onInitializationRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function()? onStateChanged,
    TResult Function(String val)? onMessageChanged,
    TResult Function()? onSendTapped,
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
    required TResult Function(_EventOnStateChanged value) onStateChanged,
    required TResult Function(_EventOnMessageChanged value) onMessageChanged,
    required TResult Function(_EventOnSendTapped value) onSendTapped,
  }) {
    return onInitializationRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult? Function(_EventOnStateChanged value)? onStateChanged,
    TResult? Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult? Function(_EventOnSendTapped value)? onSendTapped,
  }) {
    return onInitializationRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult Function(_EventOnStateChanged value)? onStateChanged,
    TResult Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult Function(_EventOnSendTapped value)? onSendTapped,
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
abstract class _$$EventOnStateChangedImplCopyWith<$Res> {
  factory _$$EventOnStateChangedImplCopyWith(_$EventOnStateChangedImpl value,
          $Res Function(_$EventOnStateChangedImpl) then) =
      __$$EventOnStateChangedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventOnStateChangedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$EventOnStateChangedImpl>
    implements _$$EventOnStateChangedImplCopyWith<$Res> {
  __$$EventOnStateChangedImplCopyWithImpl(_$EventOnStateChangedImpl _value,
      $Res Function(_$EventOnStateChangedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventOnStateChangedImpl implements _EventOnStateChanged {
  const _$EventOnStateChangedImpl();

  @override
  String toString() {
    return 'ChatEvent.onStateChanged()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnStateChangedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
    required TResult Function() onStateChanged,
    required TResult Function(String val) onMessageChanged,
    required TResult Function() onSendTapped,
  }) {
    return onStateChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function()? onStateChanged,
    TResult? Function(String val)? onMessageChanged,
    TResult? Function()? onSendTapped,
  }) {
    return onStateChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function()? onStateChanged,
    TResult Function(String val)? onMessageChanged,
    TResult Function()? onSendTapped,
    required TResult orElse(),
  }) {
    if (onStateChanged != null) {
      return onStateChanged();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnInitializationRequested value)
        onInitializationRequested,
    required TResult Function(_EventOnStateChanged value) onStateChanged,
    required TResult Function(_EventOnMessageChanged value) onMessageChanged,
    required TResult Function(_EventOnSendTapped value) onSendTapped,
  }) {
    return onStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult? Function(_EventOnStateChanged value)? onStateChanged,
    TResult? Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult? Function(_EventOnSendTapped value)? onSendTapped,
  }) {
    return onStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult Function(_EventOnStateChanged value)? onStateChanged,
    TResult Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult Function(_EventOnSendTapped value)? onSendTapped,
    required TResult orElse(),
  }) {
    if (onStateChanged != null) {
      return onStateChanged(this);
    }
    return orElse();
  }
}

abstract class _EventOnStateChanged implements ChatEvent {
  const factory _EventOnStateChanged() = _$EventOnStateChangedImpl;
}

/// @nodoc
abstract class _$$EventOnMessageChangedImplCopyWith<$Res> {
  factory _$$EventOnMessageChangedImplCopyWith(
          _$EventOnMessageChangedImpl value,
          $Res Function(_$EventOnMessageChangedImpl) then) =
      __$$EventOnMessageChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String val});
}

/// @nodoc
class __$$EventOnMessageChangedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$EventOnMessageChangedImpl>
    implements _$$EventOnMessageChangedImplCopyWith<$Res> {
  __$$EventOnMessageChangedImplCopyWithImpl(_$EventOnMessageChangedImpl _value,
      $Res Function(_$EventOnMessageChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? val = null,
  }) {
    return _then(_$EventOnMessageChangedImpl(
      null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EventOnMessageChangedImpl implements _EventOnMessageChanged {
  const _$EventOnMessageChangedImpl(this.val);

  @override
  final String val;

  @override
  String toString() {
    return 'ChatEvent.onMessageChanged(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnMessageChangedImpl &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventOnMessageChangedImplCopyWith<_$EventOnMessageChangedImpl>
      get copyWith => __$$EventOnMessageChangedImplCopyWithImpl<
          _$EventOnMessageChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
    required TResult Function() onStateChanged,
    required TResult Function(String val) onMessageChanged,
    required TResult Function() onSendTapped,
  }) {
    return onMessageChanged(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function()? onStateChanged,
    TResult? Function(String val)? onMessageChanged,
    TResult? Function()? onSendTapped,
  }) {
    return onMessageChanged?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function()? onStateChanged,
    TResult Function(String val)? onMessageChanged,
    TResult Function()? onSendTapped,
    required TResult orElse(),
  }) {
    if (onMessageChanged != null) {
      return onMessageChanged(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnInitializationRequested value)
        onInitializationRequested,
    required TResult Function(_EventOnStateChanged value) onStateChanged,
    required TResult Function(_EventOnMessageChanged value) onMessageChanged,
    required TResult Function(_EventOnSendTapped value) onSendTapped,
  }) {
    return onMessageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult? Function(_EventOnStateChanged value)? onStateChanged,
    TResult? Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult? Function(_EventOnSendTapped value)? onSendTapped,
  }) {
    return onMessageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult Function(_EventOnStateChanged value)? onStateChanged,
    TResult Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult Function(_EventOnSendTapped value)? onSendTapped,
    required TResult orElse(),
  }) {
    if (onMessageChanged != null) {
      return onMessageChanged(this);
    }
    return orElse();
  }
}

abstract class _EventOnMessageChanged implements ChatEvent {
  const factory _EventOnMessageChanged(final String val) =
      _$EventOnMessageChangedImpl;

  String get val;
  @JsonKey(ignore: true)
  _$$EventOnMessageChangedImplCopyWith<_$EventOnMessageChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventOnSendTappedImplCopyWith<$Res> {
  factory _$$EventOnSendTappedImplCopyWith(_$EventOnSendTappedImpl value,
          $Res Function(_$EventOnSendTappedImpl) then) =
      __$$EventOnSendTappedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventOnSendTappedImplCopyWithImpl<$Res>
    extends _$ChatEventCopyWithImpl<$Res, _$EventOnSendTappedImpl>
    implements _$$EventOnSendTappedImplCopyWith<$Res> {
  __$$EventOnSendTappedImplCopyWithImpl(_$EventOnSendTappedImpl _value,
      $Res Function(_$EventOnSendTappedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventOnSendTappedImpl implements _EventOnSendTapped {
  const _$EventOnSendTappedImpl();

  @override
  String toString() {
    return 'ChatEvent.onSendTapped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EventOnSendTappedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
    required TResult Function() onStateChanged,
    required TResult Function(String val) onMessageChanged,
    required TResult Function() onSendTapped,
  }) {
    return onSendTapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function()? onStateChanged,
    TResult? Function(String val)? onMessageChanged,
    TResult? Function()? onSendTapped,
  }) {
    return onSendTapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function()? onStateChanged,
    TResult Function(String val)? onMessageChanged,
    TResult Function()? onSendTapped,
    required TResult orElse(),
  }) {
    if (onSendTapped != null) {
      return onSendTapped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnInitializationRequested value)
        onInitializationRequested,
    required TResult Function(_EventOnStateChanged value) onStateChanged,
    required TResult Function(_EventOnMessageChanged value) onMessageChanged,
    required TResult Function(_EventOnSendTapped value) onSendTapped,
  }) {
    return onSendTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult? Function(_EventOnStateChanged value)? onStateChanged,
    TResult? Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult? Function(_EventOnSendTapped value)? onSendTapped,
  }) {
    return onSendTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onInitializationRequested,
    TResult Function(_EventOnStateChanged value)? onStateChanged,
    TResult Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult Function(_EventOnSendTapped value)? onSendTapped,
    required TResult orElse(),
  }) {
    if (onSendTapped != null) {
      return onSendTapped(this);
    }
    return orElse();
  }
}

abstract class _EventOnSendTapped implements ChatEvent {
  const factory _EventOnSendTapped() = _$EventOnSendTappedImpl;
}

/// @nodoc
mixin _$ChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function(
            String typedMessage, Iterable<ChatMessage> messages)
        view,
    required TResult Function(String? errorText) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function(String typedMessage, Iterable<ChatMessage> messages)?
        view,
    TResult? Function(String? errorText)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function(String typedMessage, Iterable<ChatMessage> messages)? view,
    TResult Function(String? errorText)? requestError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatePending value) pending,
    required TResult Function(_StateView value) view,
    required TResult Function(_StateRequestError value) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatePending value)? pending,
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateRequestError value)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatePending value)? pending,
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
}

/// @nodoc
abstract class _$$StatePendingImplCopyWith<$Res> {
  factory _$$StatePendingImplCopyWith(
          _$StatePendingImpl value, $Res Function(_$StatePendingImpl) then) =
      __$$StatePendingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StatePendingImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$StatePendingImpl>
    implements _$$StatePendingImplCopyWith<$Res> {
  __$$StatePendingImplCopyWithImpl(
      _$StatePendingImpl _value, $Res Function(_$StatePendingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StatePendingImpl implements _StatePending {
  const _$StatePendingImpl();

  @override
  String toString() {
    return 'ChatState.pending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StatePendingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function(
            String typedMessage, Iterable<ChatMessage> messages)
        view,
    required TResult Function(String? errorText) requestError,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function(String typedMessage, Iterable<ChatMessage> messages)?
        view,
    TResult? Function(String? errorText)? requestError,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function(String typedMessage, Iterable<ChatMessage> messages)? view,
    TResult Function(String? errorText)? requestError,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatePending value) pending,
    required TResult Function(_StateView value) view,
    required TResult Function(_StateRequestError value) requestError,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatePending value)? pending,
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateRequestError value)? requestError,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatePending value)? pending,
    TResult Function(_StateView value)? view,
    TResult Function(_StateRequestError value)? requestError,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _StatePending implements ChatState {
  const factory _StatePending() = _$StatePendingImpl;
}

/// @nodoc
abstract class _$$StateViewImplCopyWith<$Res> {
  factory _$$StateViewImplCopyWith(
          _$StateViewImpl value, $Res Function(_$StateViewImpl) then) =
      __$$StateViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String typedMessage, Iterable<ChatMessage> messages});
}

/// @nodoc
class __$$StateViewImplCopyWithImpl<$Res>
    extends _$ChatStateCopyWithImpl<$Res, _$StateViewImpl>
    implements _$$StateViewImplCopyWith<$Res> {
  __$$StateViewImplCopyWithImpl(
      _$StateViewImpl _value, $Res Function(_$StateViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typedMessage = null,
    Object? messages = null,
  }) {
    return _then(_$StateViewImpl(
      typedMessage: null == typedMessage
          ? _value.typedMessage
          : typedMessage // ignore: cast_nullable_to_non_nullable
              as String,
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Iterable<ChatMessage>,
    ));
  }
}

/// @nodoc

class _$StateViewImpl implements _StateView {
  const _$StateViewImpl({this.typedMessage = '', this.messages = const []});

  @override
  @JsonKey()
  final String typedMessage;
  @override
  @JsonKey()
  final Iterable<ChatMessage> messages;

  @override
  String toString() {
    return 'ChatState.view(typedMessage: $typedMessage, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateViewImpl &&
            (identical(other.typedMessage, typedMessage) ||
                other.typedMessage == typedMessage) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, typedMessage, const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateViewImplCopyWith<_$StateViewImpl> get copyWith =>
      __$$StateViewImplCopyWithImpl<_$StateViewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function(
            String typedMessage, Iterable<ChatMessage> messages)
        view,
    required TResult Function(String? errorText) requestError,
  }) {
    return view(typedMessage, messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function(String typedMessage, Iterable<ChatMessage> messages)?
        view,
    TResult? Function(String? errorText)? requestError,
  }) {
    return view?.call(typedMessage, messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function(String typedMessage, Iterable<ChatMessage> messages)? view,
    TResult Function(String? errorText)? requestError,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(typedMessage, messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatePending value) pending,
    required TResult Function(_StateView value) view,
    required TResult Function(_StateRequestError value) requestError,
  }) {
    return view(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatePending value)? pending,
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateRequestError value)? requestError,
  }) {
    return view?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatePending value)? pending,
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
  const factory _StateView(
      {final String typedMessage,
      final Iterable<ChatMessage> messages}) = _$StateViewImpl;

  String get typedMessage;
  Iterable<ChatMessage> get messages;
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
    extends _$ChatStateCopyWithImpl<$Res, _$StateRequestErrorImpl>
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      __$$StateRequestErrorImplCopyWithImpl<_$StateRequestErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function(
            String typedMessage, Iterable<ChatMessage> messages)
        view,
    required TResult Function(String? errorText) requestError,
  }) {
    return requestError(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function(String typedMessage, Iterable<ChatMessage> messages)?
        view,
    TResult? Function(String? errorText)? requestError,
  }) {
    return requestError?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function(String typedMessage, Iterable<ChatMessage> messages)? view,
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
    required TResult Function(_StatePending value) pending,
    required TResult Function(_StateView value) view,
    required TResult Function(_StateRequestError value) requestError,
  }) {
    return requestError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatePending value)? pending,
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateRequestError value)? requestError,
  }) {
    return requestError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatePending value)? pending,
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
  @JsonKey(ignore: true)
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

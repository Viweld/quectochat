// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReadingViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onNextPageRequested,
    required TResult Function() onStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onNextPageRequested,
    TResult? Function()? onStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onNextPageRequested,
    TResult Function()? onStateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnInitializationRequested value)
        onNextPageRequested,
    required TResult Function(_EventOnStateChanged value) onStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onNextPageRequested,
    TResult? Function(_EventOnStateChanged value)? onStateChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onNextPageRequested,
    TResult Function(_EventOnStateChanged value)? onStateChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingViewEventCopyWith<$Res> {
  factory $ReadingViewEventCopyWith(
          ReadingViewEvent value, $Res Function(ReadingViewEvent) then) =
      _$ReadingViewEventCopyWithImpl<$Res, ReadingViewEvent>;
}

/// @nodoc
class _$ReadingViewEventCopyWithImpl<$Res, $Val extends ReadingViewEvent>
    implements $ReadingViewEventCopyWith<$Res> {
  _$ReadingViewEventCopyWithImpl(this._value, this._then);

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
    extends _$ReadingViewEventCopyWithImpl<$Res,
        _$EventOnInitializationRequestedImpl>
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
    return 'ReadingViewEvent.onNextPageRequested()';
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
    required TResult Function() onNextPageRequested,
    required TResult Function() onStateChanged,
  }) {
    return onNextPageRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onNextPageRequested,
    TResult? Function()? onStateChanged,
  }) {
    return onNextPageRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onNextPageRequested,
    TResult Function()? onStateChanged,
    required TResult orElse(),
  }) {
    if (onNextPageRequested != null) {
      return onNextPageRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnInitializationRequested value)
        onNextPageRequested,
    required TResult Function(_EventOnStateChanged value) onStateChanged,
  }) {
    return onNextPageRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onNextPageRequested,
    TResult? Function(_EventOnStateChanged value)? onStateChanged,
  }) {
    return onNextPageRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onNextPageRequested,
    TResult Function(_EventOnStateChanged value)? onStateChanged,
    required TResult orElse(),
  }) {
    if (onNextPageRequested != null) {
      return onNextPageRequested(this);
    }
    return orElse();
  }
}

abstract class _EventOnInitializationRequested implements ReadingViewEvent {
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
    extends _$ReadingViewEventCopyWithImpl<$Res, _$EventOnStateChangedImpl>
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
    return 'ReadingViewEvent.onStateChanged()';
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
    required TResult Function() onNextPageRequested,
    required TResult Function() onStateChanged,
  }) {
    return onStateChanged();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onNextPageRequested,
    TResult? Function()? onStateChanged,
  }) {
    return onStateChanged?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onNextPageRequested,
    TResult Function()? onStateChanged,
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
        onNextPageRequested,
    required TResult Function(_EventOnStateChanged value) onStateChanged,
  }) {
    return onStateChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnInitializationRequested value)?
        onNextPageRequested,
    TResult? Function(_EventOnStateChanged value)? onStateChanged,
  }) {
    return onStateChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnInitializationRequested value)?
        onNextPageRequested,
    TResult Function(_EventOnStateChanged value)? onStateChanged,
    required TResult orElse(),
  }) {
    if (onStateChanged != null) {
      return onStateChanged(this);
    }
    return orElse();
  }
}

abstract class _EventOnStateChanged implements ReadingViewEvent {
  const factory _EventOnStateChanged() = _$EventOnStateChangedImpl;
}

/// @nodoc
mixin _$ReadingViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function(Iterable<Message> messages) view,
    required TResult Function() initializationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function(Iterable<Message> messages)? view,
    TResult? Function()? initializationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function(Iterable<Message> messages)? view,
    TResult Function()? initializationError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatePending value) pending,
    required TResult Function(_StateView value) view,
    required TResult Function(_StateInitializationError value)
        initializationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatePending value)? pending,
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateInitializationError value)? initializationError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatePending value)? pending,
    TResult Function(_StateView value)? view,
    TResult Function(_StateInitializationError value)? initializationError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReadingViewStateCopyWith<$Res> {
  factory $ReadingViewStateCopyWith(
          ReadingViewState value, $Res Function(ReadingViewState) then) =
      _$ReadingViewStateCopyWithImpl<$Res, ReadingViewState>;
}

/// @nodoc
class _$ReadingViewStateCopyWithImpl<$Res, $Val extends ReadingViewState>
    implements $ReadingViewStateCopyWith<$Res> {
  _$ReadingViewStateCopyWithImpl(this._value, this._then);

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
    extends _$ReadingViewStateCopyWithImpl<$Res, _$StatePendingImpl>
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
    return 'ReadingViewState.pending()';
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
    required TResult Function(Iterable<Message> messages) view,
    required TResult Function() initializationError,
  }) {
    return pending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function(Iterable<Message> messages)? view,
    TResult? Function()? initializationError,
  }) {
    return pending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function(Iterable<Message> messages)? view,
    TResult Function()? initializationError,
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
    required TResult Function(_StateInitializationError value)
        initializationError,
  }) {
    return pending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatePending value)? pending,
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateInitializationError value)? initializationError,
  }) {
    return pending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatePending value)? pending,
    TResult Function(_StateView value)? view,
    TResult Function(_StateInitializationError value)? initializationError,
    required TResult orElse(),
  }) {
    if (pending != null) {
      return pending(this);
    }
    return orElse();
  }
}

abstract class _StatePending implements ReadingViewState {
  const factory _StatePending() = _$StatePendingImpl;
}

/// @nodoc
abstract class _$$StateViewImplCopyWith<$Res> {
  factory _$$StateViewImplCopyWith(
          _$StateViewImpl value, $Res Function(_$StateViewImpl) then) =
      __$$StateViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Iterable<Message> messages});
}

/// @nodoc
class __$$StateViewImplCopyWithImpl<$Res>
    extends _$ReadingViewStateCopyWithImpl<$Res, _$StateViewImpl>
    implements _$$StateViewImplCopyWith<$Res> {
  __$$StateViewImplCopyWithImpl(
      _$StateViewImpl _value, $Res Function(_$StateViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messages = null,
  }) {
    return _then(_$StateViewImpl(
      messages: null == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as Iterable<Message>,
    ));
  }
}

/// @nodoc

class _$StateViewImpl implements _StateView {
  const _$StateViewImpl({this.messages = const []});

  @override
  @JsonKey()
  final Iterable<Message> messages;

  @override
  String toString() {
    return 'ReadingViewState.view(messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateViewImpl &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateViewImplCopyWith<_$StateViewImpl> get copyWith =>
      __$$StateViewImplCopyWithImpl<_$StateViewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function(Iterable<Message> messages) view,
    required TResult Function() initializationError,
  }) {
    return view(messages);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function(Iterable<Message> messages)? view,
    TResult? Function()? initializationError,
  }) {
    return view?.call(messages);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function(Iterable<Message> messages)? view,
    TResult Function()? initializationError,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(messages);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatePending value) pending,
    required TResult Function(_StateView value) view,
    required TResult Function(_StateInitializationError value)
        initializationError,
  }) {
    return view(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatePending value)? pending,
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateInitializationError value)? initializationError,
  }) {
    return view?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatePending value)? pending,
    TResult Function(_StateView value)? view,
    TResult Function(_StateInitializationError value)? initializationError,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(this);
    }
    return orElse();
  }
}

abstract class _StateView implements ReadingViewState {
  const factory _StateView({final Iterable<Message> messages}) =
      _$StateViewImpl;

  Iterable<Message> get messages;
  @JsonKey(ignore: true)
  _$$StateViewImplCopyWith<_$StateViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StateInitializationErrorImplCopyWith<$Res> {
  factory _$$StateInitializationErrorImplCopyWith(
          _$StateInitializationErrorImpl value,
          $Res Function(_$StateInitializationErrorImpl) then) =
      __$$StateInitializationErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StateInitializationErrorImplCopyWithImpl<$Res>
    extends _$ReadingViewStateCopyWithImpl<$Res, _$StateInitializationErrorImpl>
    implements _$$StateInitializationErrorImplCopyWith<$Res> {
  __$$StateInitializationErrorImplCopyWithImpl(
      _$StateInitializationErrorImpl _value,
      $Res Function(_$StateInitializationErrorImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StateInitializationErrorImpl implements _StateInitializationError {
  const _$StateInitializationErrorImpl();

  @override
  String toString() {
    return 'ReadingViewState.initializationError()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateInitializationErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() pending,
    required TResult Function(Iterable<Message> messages) view,
    required TResult Function() initializationError,
  }) {
    return initializationError();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? pending,
    TResult? Function(Iterable<Message> messages)? view,
    TResult? Function()? initializationError,
  }) {
    return initializationError?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? pending,
    TResult Function(Iterable<Message> messages)? view,
    TResult Function()? initializationError,
    required TResult orElse(),
  }) {
    if (initializationError != null) {
      return initializationError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatePending value) pending,
    required TResult Function(_StateView value) view,
    required TResult Function(_StateInitializationError value)
        initializationError,
  }) {
    return initializationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatePending value)? pending,
    TResult? Function(_StateView value)? view,
    TResult? Function(_StateInitializationError value)? initializationError,
  }) {
    return initializationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatePending value)? pending,
    TResult Function(_StateView value)? view,
    TResult Function(_StateInitializationError value)? initializationError,
    required TResult orElse(),
  }) {
    if (initializationError != null) {
      return initializationError(this);
    }
    return orElse();
  }
}

abstract class _StateInitializationError implements ReadingViewState {
  const factory _StateInitializationError() = _$StateInitializationErrorImpl;
}

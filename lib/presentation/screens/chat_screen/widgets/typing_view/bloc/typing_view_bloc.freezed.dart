// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'typing_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TypingViewEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String val) onMessageChanged,
    required TResult Function() onSendTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onMessageChanged,
    TResult? Function()? onSendTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String val)? onMessageChanged,
    TResult Function()? onSendTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnMessageChanged value) onMessageChanged,
    required TResult Function(_EventOnSendTapped value) onSendTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult? Function(_EventOnSendTapped value)? onSendTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult Function(_EventOnSendTapped value)? onSendTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TypingViewEventCopyWith<$Res> {
  factory $TypingViewEventCopyWith(
          TypingViewEvent value, $Res Function(TypingViewEvent) then) =
      _$TypingViewEventCopyWithImpl<$Res, TypingViewEvent>;
}

/// @nodoc
class _$TypingViewEventCopyWithImpl<$Res, $Val extends TypingViewEvent>
    implements $TypingViewEventCopyWith<$Res> {
  _$TypingViewEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$TypingViewEventCopyWithImpl<$Res, _$EventOnMessageChangedImpl>
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
    return 'TypingViewEvent.onMessageChanged(val: $val)';
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
    required TResult Function(String val) onMessageChanged,
    required TResult Function() onSendTapped,
  }) {
    return onMessageChanged(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onMessageChanged,
    TResult? Function()? onSendTapped,
  }) {
    return onMessageChanged?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(_EventOnMessageChanged value) onMessageChanged,
    required TResult Function(_EventOnSendTapped value) onSendTapped,
  }) {
    return onMessageChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult? Function(_EventOnSendTapped value)? onSendTapped,
  }) {
    return onMessageChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _EventOnMessageChanged implements TypingViewEvent {
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
    extends _$TypingViewEventCopyWithImpl<$Res, _$EventOnSendTappedImpl>
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
    return 'TypingViewEvent.onSendTapped()';
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
    required TResult Function(String val) onMessageChanged,
    required TResult Function() onSendTapped,
  }) {
    return onSendTapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onMessageChanged,
    TResult? Function()? onSendTapped,
  }) {
    return onSendTapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(_EventOnMessageChanged value) onMessageChanged,
    required TResult Function(_EventOnSendTapped value) onSendTapped,
  }) {
    return onSendTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnMessageChanged value)? onMessageChanged,
    TResult? Function(_EventOnSendTapped value)? onSendTapped,
  }) {
    return onSendTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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

abstract class _EventOnSendTapped implements TypingViewEvent {
  const factory _EventOnSendTapped() = _$EventOnSendTappedImpl;
}

/// @nodoc
mixin _$TypingViewState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String typedMessage) view,
    required TResult Function(String? errorText) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typedMessage)? view,
    TResult? Function(String? errorText)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typedMessage)? view,
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
abstract class $TypingViewStateCopyWith<$Res> {
  factory $TypingViewStateCopyWith(
          TypingViewState value, $Res Function(TypingViewState) then) =
      _$TypingViewStateCopyWithImpl<$Res, TypingViewState>;
}

/// @nodoc
class _$TypingViewStateCopyWithImpl<$Res, $Val extends TypingViewState>
    implements $TypingViewStateCopyWith<$Res> {
  _$TypingViewStateCopyWithImpl(this._value, this._then);

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
  $Res call({String typedMessage});
}

/// @nodoc
class __$$StateViewImplCopyWithImpl<$Res>
    extends _$TypingViewStateCopyWithImpl<$Res, _$StateViewImpl>
    implements _$$StateViewImplCopyWith<$Res> {
  __$$StateViewImplCopyWithImpl(
      _$StateViewImpl _value, $Res Function(_$StateViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? typedMessage = null,
  }) {
    return _then(_$StateViewImpl(
      typedMessage: null == typedMessage
          ? _value.typedMessage
          : typedMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$StateViewImpl implements _StateView {
  const _$StateViewImpl({this.typedMessage = ''});

  @override
  @JsonKey()
  final String typedMessage;

  @override
  String toString() {
    return 'TypingViewState.view(typedMessage: $typedMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateViewImpl &&
            (identical(other.typedMessage, typedMessage) ||
                other.typedMessage == typedMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, typedMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateViewImplCopyWith<_$StateViewImpl> get copyWith =>
      __$$StateViewImplCopyWithImpl<_$StateViewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String typedMessage) view,
    required TResult Function(String? errorText) requestError,
  }) {
    return view(typedMessage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typedMessage)? view,
    TResult? Function(String? errorText)? requestError,
  }) {
    return view?.call(typedMessage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typedMessage)? view,
    TResult Function(String? errorText)? requestError,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(typedMessage);
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

abstract class _StateView implements TypingViewState {
  const factory _StateView({final String typedMessage}) = _$StateViewImpl;

  String get typedMessage;
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
    extends _$TypingViewStateCopyWithImpl<$Res, _$StateRequestErrorImpl>
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
    return 'TypingViewState.requestError(errorText: $errorText)';
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
    required TResult Function(String typedMessage) view,
    required TResult Function(String? errorText) requestError,
  }) {
    return requestError(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String typedMessage)? view,
    TResult? Function(String? errorText)? requestError,
  }) {
    return requestError?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String typedMessage)? view,
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

abstract class _StateRequestError implements TypingViewState {
  const factory _StateRequestError({final String? errorText}) =
      _$StateRequestErrorImpl;

  String? get errorText;
  @JsonKey(ignore: true)
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

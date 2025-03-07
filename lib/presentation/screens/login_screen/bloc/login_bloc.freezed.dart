// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String val) onLoginChanged,
    required TResult Function() onLoginFieldUnfocused,
    required TResult Function(String val) onPasswordChanged,
    required TResult Function() onPasswordFieldUnfocused,
    required TResult Function() onLoginTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onLoginChanged,
    TResult? Function()? onLoginFieldUnfocused,
    TResult? Function(String val)? onPasswordChanged,
    TResult? Function()? onPasswordFieldUnfocused,
    TResult? Function()? onLoginTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String val)? onLoginChanged,
    TResult Function()? onLoginFieldUnfocused,
    TResult Function(String val)? onPasswordChanged,
    TResult Function()? onPasswordFieldUnfocused,
    TResult Function()? onLoginTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnLoginChanged value) onLoginChanged,
    required TResult Function(_EventOnLoginFieldUnfocused value)
        onLoginFieldUnfocused,
    required TResult Function(_EventOnPasswordChanged value) onPasswordChanged,
    required TResult Function(_EventOnPasswordFieldUnfocused value)
        onPasswordFieldUnfocused,
    required TResult Function(_EventOnLoginTapped value) onLoginTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult? Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult? Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult? Function(_EventOnLoginTapped value)? onLoginTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginEventCopyWith<$Res> {
  factory $LoginEventCopyWith(
          LoginEvent value, $Res Function(LoginEvent) then) =
      _$LoginEventCopyWithImpl<$Res, LoginEvent>;
}

/// @nodoc
class _$LoginEventCopyWithImpl<$Res, $Val extends LoginEvent>
    implements $LoginEventCopyWith<$Res> {
  _$LoginEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$EventOnLoginChangedImplCopyWith<$Res> {
  factory _$$EventOnLoginChangedImplCopyWith(_$EventOnLoginChangedImpl value,
          $Res Function(_$EventOnLoginChangedImpl) then) =
      __$$EventOnLoginChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String val});
}

/// @nodoc
class __$$EventOnLoginChangedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$EventOnLoginChangedImpl>
    implements _$$EventOnLoginChangedImplCopyWith<$Res> {
  __$$EventOnLoginChangedImplCopyWithImpl(_$EventOnLoginChangedImpl _value,
      $Res Function(_$EventOnLoginChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? val = null,
  }) {
    return _then(_$EventOnLoginChangedImpl(
      null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EventOnLoginChangedImpl implements _EventOnLoginChanged {
  const _$EventOnLoginChangedImpl(this.val);

  @override
  final String val;

  @override
  String toString() {
    return 'LoginEvent.onLoginChanged(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnLoginChangedImpl &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventOnLoginChangedImplCopyWith<_$EventOnLoginChangedImpl> get copyWith =>
      __$$EventOnLoginChangedImplCopyWithImpl<_$EventOnLoginChangedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String val) onLoginChanged,
    required TResult Function() onLoginFieldUnfocused,
    required TResult Function(String val) onPasswordChanged,
    required TResult Function() onPasswordFieldUnfocused,
    required TResult Function() onLoginTapped,
  }) {
    return onLoginChanged(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onLoginChanged,
    TResult? Function()? onLoginFieldUnfocused,
    TResult? Function(String val)? onPasswordChanged,
    TResult? Function()? onPasswordFieldUnfocused,
    TResult? Function()? onLoginTapped,
  }) {
    return onLoginChanged?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String val)? onLoginChanged,
    TResult Function()? onLoginFieldUnfocused,
    TResult Function(String val)? onPasswordChanged,
    TResult Function()? onPasswordFieldUnfocused,
    TResult Function()? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onLoginChanged != null) {
      return onLoginChanged(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnLoginChanged value) onLoginChanged,
    required TResult Function(_EventOnLoginFieldUnfocused value)
        onLoginFieldUnfocused,
    required TResult Function(_EventOnPasswordChanged value) onPasswordChanged,
    required TResult Function(_EventOnPasswordFieldUnfocused value)
        onPasswordFieldUnfocused,
    required TResult Function(_EventOnLoginTapped value) onLoginTapped,
  }) {
    return onLoginChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult? Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult? Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult? Function(_EventOnLoginTapped value)? onLoginTapped,
  }) {
    return onLoginChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onLoginChanged != null) {
      return onLoginChanged(this);
    }
    return orElse();
  }
}

abstract class _EventOnLoginChanged implements LoginEvent {
  const factory _EventOnLoginChanged(final String val) =
      _$EventOnLoginChangedImpl;

  String get val;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventOnLoginChangedImplCopyWith<_$EventOnLoginChangedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventOnLoginFieldUnfocusedImplCopyWith<$Res> {
  factory _$$EventOnLoginFieldUnfocusedImplCopyWith(
          _$EventOnLoginFieldUnfocusedImpl value,
          $Res Function(_$EventOnLoginFieldUnfocusedImpl) then) =
      __$$EventOnLoginFieldUnfocusedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventOnLoginFieldUnfocusedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$EventOnLoginFieldUnfocusedImpl>
    implements _$$EventOnLoginFieldUnfocusedImplCopyWith<$Res> {
  __$$EventOnLoginFieldUnfocusedImplCopyWithImpl(
      _$EventOnLoginFieldUnfocusedImpl _value,
      $Res Function(_$EventOnLoginFieldUnfocusedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EventOnLoginFieldUnfocusedImpl implements _EventOnLoginFieldUnfocused {
  const _$EventOnLoginFieldUnfocusedImpl();

  @override
  String toString() {
    return 'LoginEvent.onLoginFieldUnfocused()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnLoginFieldUnfocusedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String val) onLoginChanged,
    required TResult Function() onLoginFieldUnfocused,
    required TResult Function(String val) onPasswordChanged,
    required TResult Function() onPasswordFieldUnfocused,
    required TResult Function() onLoginTapped,
  }) {
    return onLoginFieldUnfocused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onLoginChanged,
    TResult? Function()? onLoginFieldUnfocused,
    TResult? Function(String val)? onPasswordChanged,
    TResult? Function()? onPasswordFieldUnfocused,
    TResult? Function()? onLoginTapped,
  }) {
    return onLoginFieldUnfocused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String val)? onLoginChanged,
    TResult Function()? onLoginFieldUnfocused,
    TResult Function(String val)? onPasswordChanged,
    TResult Function()? onPasswordFieldUnfocused,
    TResult Function()? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onLoginFieldUnfocused != null) {
      return onLoginFieldUnfocused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnLoginChanged value) onLoginChanged,
    required TResult Function(_EventOnLoginFieldUnfocused value)
        onLoginFieldUnfocused,
    required TResult Function(_EventOnPasswordChanged value) onPasswordChanged,
    required TResult Function(_EventOnPasswordFieldUnfocused value)
        onPasswordFieldUnfocused,
    required TResult Function(_EventOnLoginTapped value) onLoginTapped,
  }) {
    return onLoginFieldUnfocused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult? Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult? Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult? Function(_EventOnLoginTapped value)? onLoginTapped,
  }) {
    return onLoginFieldUnfocused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onLoginFieldUnfocused != null) {
      return onLoginFieldUnfocused(this);
    }
    return orElse();
  }
}

abstract class _EventOnLoginFieldUnfocused implements LoginEvent {
  const factory _EventOnLoginFieldUnfocused() =
      _$EventOnLoginFieldUnfocusedImpl;
}

/// @nodoc
abstract class _$$EventOnPasswordChangedImplCopyWith<$Res> {
  factory _$$EventOnPasswordChangedImplCopyWith(
          _$EventOnPasswordChangedImpl value,
          $Res Function(_$EventOnPasswordChangedImpl) then) =
      __$$EventOnPasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String val});
}

/// @nodoc
class __$$EventOnPasswordChangedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$EventOnPasswordChangedImpl>
    implements _$$EventOnPasswordChangedImplCopyWith<$Res> {
  __$$EventOnPasswordChangedImplCopyWithImpl(
      _$EventOnPasswordChangedImpl _value,
      $Res Function(_$EventOnPasswordChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? val = null,
  }) {
    return _then(_$EventOnPasswordChangedImpl(
      null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EventOnPasswordChangedImpl implements _EventOnPasswordChanged {
  const _$EventOnPasswordChangedImpl(this.val);

  @override
  final String val;

  @override
  String toString() {
    return 'LoginEvent.onPasswordChanged(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnPasswordChangedImpl &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$EventOnPasswordChangedImplCopyWith<_$EventOnPasswordChangedImpl>
      get copyWith => __$$EventOnPasswordChangedImplCopyWithImpl<
          _$EventOnPasswordChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String val) onLoginChanged,
    required TResult Function() onLoginFieldUnfocused,
    required TResult Function(String val) onPasswordChanged,
    required TResult Function() onPasswordFieldUnfocused,
    required TResult Function() onLoginTapped,
  }) {
    return onPasswordChanged(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onLoginChanged,
    TResult? Function()? onLoginFieldUnfocused,
    TResult? Function(String val)? onPasswordChanged,
    TResult? Function()? onPasswordFieldUnfocused,
    TResult? Function()? onLoginTapped,
  }) {
    return onPasswordChanged?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String val)? onLoginChanged,
    TResult Function()? onLoginFieldUnfocused,
    TResult Function(String val)? onPasswordChanged,
    TResult Function()? onPasswordFieldUnfocused,
    TResult Function()? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onPasswordChanged != null) {
      return onPasswordChanged(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnLoginChanged value) onLoginChanged,
    required TResult Function(_EventOnLoginFieldUnfocused value)
        onLoginFieldUnfocused,
    required TResult Function(_EventOnPasswordChanged value) onPasswordChanged,
    required TResult Function(_EventOnPasswordFieldUnfocused value)
        onPasswordFieldUnfocused,
    required TResult Function(_EventOnLoginTapped value) onLoginTapped,
  }) {
    return onPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult? Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult? Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult? Function(_EventOnLoginTapped value)? onLoginTapped,
  }) {
    return onPasswordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onPasswordChanged != null) {
      return onPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class _EventOnPasswordChanged implements LoginEvent {
  const factory _EventOnPasswordChanged(final String val) =
      _$EventOnPasswordChangedImpl;

  String get val;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$EventOnPasswordChangedImplCopyWith<_$EventOnPasswordChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventOnPasswordFieldUnfocusedImplCopyWith<$Res> {
  factory _$$EventOnPasswordFieldUnfocusedImplCopyWith(
          _$EventOnPasswordFieldUnfocusedImpl value,
          $Res Function(_$EventOnPasswordFieldUnfocusedImpl) then) =
      __$$EventOnPasswordFieldUnfocusedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventOnPasswordFieldUnfocusedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$EventOnPasswordFieldUnfocusedImpl>
    implements _$$EventOnPasswordFieldUnfocusedImplCopyWith<$Res> {
  __$$EventOnPasswordFieldUnfocusedImplCopyWithImpl(
      _$EventOnPasswordFieldUnfocusedImpl _value,
      $Res Function(_$EventOnPasswordFieldUnfocusedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EventOnPasswordFieldUnfocusedImpl
    implements _EventOnPasswordFieldUnfocused {
  const _$EventOnPasswordFieldUnfocusedImpl();

  @override
  String toString() {
    return 'LoginEvent.onPasswordFieldUnfocused()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnPasswordFieldUnfocusedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String val) onLoginChanged,
    required TResult Function() onLoginFieldUnfocused,
    required TResult Function(String val) onPasswordChanged,
    required TResult Function() onPasswordFieldUnfocused,
    required TResult Function() onLoginTapped,
  }) {
    return onPasswordFieldUnfocused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onLoginChanged,
    TResult? Function()? onLoginFieldUnfocused,
    TResult? Function(String val)? onPasswordChanged,
    TResult? Function()? onPasswordFieldUnfocused,
    TResult? Function()? onLoginTapped,
  }) {
    return onPasswordFieldUnfocused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String val)? onLoginChanged,
    TResult Function()? onLoginFieldUnfocused,
    TResult Function(String val)? onPasswordChanged,
    TResult Function()? onPasswordFieldUnfocused,
    TResult Function()? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onPasswordFieldUnfocused != null) {
      return onPasswordFieldUnfocused();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnLoginChanged value) onLoginChanged,
    required TResult Function(_EventOnLoginFieldUnfocused value)
        onLoginFieldUnfocused,
    required TResult Function(_EventOnPasswordChanged value) onPasswordChanged,
    required TResult Function(_EventOnPasswordFieldUnfocused value)
        onPasswordFieldUnfocused,
    required TResult Function(_EventOnLoginTapped value) onLoginTapped,
  }) {
    return onPasswordFieldUnfocused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult? Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult? Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult? Function(_EventOnLoginTapped value)? onLoginTapped,
  }) {
    return onPasswordFieldUnfocused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onPasswordFieldUnfocused != null) {
      return onPasswordFieldUnfocused(this);
    }
    return orElse();
  }
}

abstract class _EventOnPasswordFieldUnfocused implements LoginEvent {
  const factory _EventOnPasswordFieldUnfocused() =
      _$EventOnPasswordFieldUnfocusedImpl;
}

/// @nodoc
abstract class _$$EventOnLoginTappedImplCopyWith<$Res> {
  factory _$$EventOnLoginTappedImplCopyWith(_$EventOnLoginTappedImpl value,
          $Res Function(_$EventOnLoginTappedImpl) then) =
      __$$EventOnLoginTappedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventOnLoginTappedImplCopyWithImpl<$Res>
    extends _$LoginEventCopyWithImpl<$Res, _$EventOnLoginTappedImpl>
    implements _$$EventOnLoginTappedImplCopyWith<$Res> {
  __$$EventOnLoginTappedImplCopyWithImpl(_$EventOnLoginTappedImpl _value,
      $Res Function(_$EventOnLoginTappedImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$EventOnLoginTappedImpl implements _EventOnLoginTapped {
  const _$EventOnLoginTappedImpl();

  @override
  String toString() {
    return 'LoginEvent.onLoginTapped()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$EventOnLoginTappedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String val) onLoginChanged,
    required TResult Function() onLoginFieldUnfocused,
    required TResult Function(String val) onPasswordChanged,
    required TResult Function() onPasswordFieldUnfocused,
    required TResult Function() onLoginTapped,
  }) {
    return onLoginTapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onLoginChanged,
    TResult? Function()? onLoginFieldUnfocused,
    TResult? Function(String val)? onPasswordChanged,
    TResult? Function()? onPasswordFieldUnfocused,
    TResult? Function()? onLoginTapped,
  }) {
    return onLoginTapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String val)? onLoginChanged,
    TResult Function()? onLoginFieldUnfocused,
    TResult Function(String val)? onPasswordChanged,
    TResult Function()? onPasswordFieldUnfocused,
    TResult Function()? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onLoginTapped != null) {
      return onLoginTapped();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnLoginChanged value) onLoginChanged,
    required TResult Function(_EventOnLoginFieldUnfocused value)
        onLoginFieldUnfocused,
    required TResult Function(_EventOnPasswordChanged value) onPasswordChanged,
    required TResult Function(_EventOnPasswordFieldUnfocused value)
        onPasswordFieldUnfocused,
    required TResult Function(_EventOnLoginTapped value) onLoginTapped,
  }) {
    return onLoginTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult? Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult? Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult? Function(_EventOnLoginTapped value)? onLoginTapped,
  }) {
    return onLoginTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onLoginTapped != null) {
      return onLoginTapped(this);
    }
    return orElse();
  }
}

abstract class _EventOnLoginTapped implements LoginEvent {
  const factory _EventOnLoginTapped() = _$EventOnLoginTappedImpl;
}

/// @nodoc
mixin _$LoginState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EmailField emailField,
            PasswordField passwordField, dynamic isLoading)
        view,
    required TResult Function(LoginError? error) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailField emailField, PasswordField passwordField,
            dynamic isLoading)?
        view,
    TResult? Function(LoginError? error)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailField emailField, PasswordField passwordField,
            dynamic isLoading)?
        view,
    TResult Function(LoginError? error)? requestError,
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
abstract class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) then) =
      _$LoginStateCopyWithImpl<$Res, LoginState>;
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res, $Val extends LoginState>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StateViewImplCopyWith<$Res> {
  factory _$$StateViewImplCopyWith(
          _$StateViewImpl value, $Res Function(_$StateViewImpl) then) =
      __$$StateViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {EmailField emailField, PasswordField passwordField, dynamic isLoading});
}

/// @nodoc
class __$$StateViewImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$StateViewImpl>
    implements _$$StateViewImplCopyWith<$Res> {
  __$$StateViewImplCopyWithImpl(
      _$StateViewImpl _value, $Res Function(_$StateViewImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailField = null,
    Object? passwordField = null,
    Object? isLoading = freezed,
  }) {
    return _then(_$StateViewImpl(
      emailField: null == emailField
          ? _value.emailField
          : emailField // ignore: cast_nullable_to_non_nullable
              as EmailField,
      passwordField: null == passwordField
          ? _value.passwordField
          : passwordField // ignore: cast_nullable_to_non_nullable
              as PasswordField,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
    ));
  }
}

/// @nodoc

class _$StateViewImpl implements _StateView {
  const _$StateViewImpl(
      {required this.emailField,
      required this.passwordField,
      this.isLoading = false});

  @override
  final EmailField emailField;
  @override
  final PasswordField passwordField;
  @override
  @JsonKey()
  final dynamic isLoading;

  @override
  String toString() {
    return 'LoginState.view(emailField: $emailField, passwordField: $passwordField, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateViewImpl &&
            (identical(other.emailField, emailField) ||
                other.emailField == emailField) &&
            (identical(other.passwordField, passwordField) ||
                other.passwordField == passwordField) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailField, passwordField,
      const DeepCollectionEquality().hash(isLoading));

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StateViewImplCopyWith<_$StateViewImpl> get copyWith =>
      __$$StateViewImplCopyWithImpl<_$StateViewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EmailField emailField,
            PasswordField passwordField, dynamic isLoading)
        view,
    required TResult Function(LoginError? error) requestError,
  }) {
    return view(emailField, passwordField, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailField emailField, PasswordField passwordField,
            dynamic isLoading)?
        view,
    TResult? Function(LoginError? error)? requestError,
  }) {
    return view?.call(emailField, passwordField, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailField emailField, PasswordField passwordField,
            dynamic isLoading)?
        view,
    TResult Function(LoginError? error)? requestError,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(emailField, passwordField, isLoading);
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

abstract class _StateView implements LoginState {
  const factory _StateView(
      {required final EmailField emailField,
      required final PasswordField passwordField,
      final dynamic isLoading}) = _$StateViewImpl;

  EmailField get emailField;
  PasswordField get passwordField;
  dynamic get isLoading;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateViewImplCopyWith<_$StateViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StateRequestErrorImplCopyWith<$Res> {
  factory _$$StateRequestErrorImplCopyWith(_$StateRequestErrorImpl value,
          $Res Function(_$StateRequestErrorImpl) then) =
      __$$StateRequestErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoginError? error});
}

/// @nodoc
class __$$StateRequestErrorImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$StateRequestErrorImpl>
    implements _$$StateRequestErrorImplCopyWith<$Res> {
  __$$StateRequestErrorImplCopyWithImpl(_$StateRequestErrorImpl _value,
      $Res Function(_$StateRequestErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$StateRequestErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as LoginError?,
    ));
  }
}

/// @nodoc

class _$StateRequestErrorImpl implements _StateRequestError {
  const _$StateRequestErrorImpl({this.error});

  @override
  final LoginError? error;

  @override
  String toString() {
    return 'LoginState.requestError(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StateRequestErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of LoginState
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
    required TResult Function(EmailField emailField,
            PasswordField passwordField, dynamic isLoading)
        view,
    required TResult Function(LoginError? error) requestError,
  }) {
    return requestError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailField emailField, PasswordField passwordField,
            dynamic isLoading)?
        view,
    TResult? Function(LoginError? error)? requestError,
  }) {
    return requestError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailField emailField, PasswordField passwordField,
            dynamic isLoading)?
        view,
    TResult Function(LoginError? error)? requestError,
    required TResult orElse(),
  }) {
    if (requestError != null) {
      return requestError(error);
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

abstract class _StateRequestError implements LoginState {
  const factory _StateRequestError({final LoginError? error}) =
      _$StateRequestErrorImpl;

  LoginError? get error;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

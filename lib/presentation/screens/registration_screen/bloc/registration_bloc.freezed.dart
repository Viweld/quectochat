// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegistrationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String val) onLoginChanged,
    required TResult Function() onLoginFieldUnfocused,
    required TResult Function(String val) onPasswordChanged,
    required TResult Function() onPasswordFieldUnfocused,
    required TResult Function(String val) onConfirmPasswordChanged,
    required TResult Function() onConfirmPasswordFieldUnfocused,
    required TResult Function() onLoginTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onLoginChanged,
    TResult? Function()? onLoginFieldUnfocused,
    TResult? Function(String val)? onPasswordChanged,
    TResult? Function()? onPasswordFieldUnfocused,
    TResult? Function(String val)? onConfirmPasswordChanged,
    TResult? Function()? onConfirmPasswordFieldUnfocused,
    TResult? Function()? onLoginTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String val)? onLoginChanged,
    TResult Function()? onLoginFieldUnfocused,
    TResult Function(String val)? onPasswordChanged,
    TResult Function()? onPasswordFieldUnfocused,
    TResult Function(String val)? onConfirmPasswordChanged,
    TResult Function()? onConfirmPasswordFieldUnfocused,
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
    required TResult Function(_EventOnConfirmPasswordChanged value)
        onConfirmPasswordChanged,
    required TResult Function(_EventOnConfirmPasswordFieldUnfocused value)
        onConfirmPasswordFieldUnfocused,
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
    TResult? Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult? Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
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
    TResult Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegistrationEventCopyWith<$Res> {
  factory $RegistrationEventCopyWith(
          RegistrationEvent value, $Res Function(RegistrationEvent) then) =
      _$RegistrationEventCopyWithImpl<$Res, RegistrationEvent>;
}

/// @nodoc
class _$RegistrationEventCopyWithImpl<$Res, $Val extends RegistrationEvent>
    implements $RegistrationEventCopyWith<$Res> {
  _$RegistrationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
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
    extends _$RegistrationEventCopyWithImpl<$Res, _$EventOnLoginChangedImpl>
    implements _$$EventOnLoginChangedImplCopyWith<$Res> {
  __$$EventOnLoginChangedImplCopyWithImpl(_$EventOnLoginChangedImpl _value,
      $Res Function(_$EventOnLoginChangedImpl) _then)
      : super(_value, _then);

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
    return 'RegistrationEvent.onLoginChanged(val: $val)';
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

  @JsonKey(ignore: true)
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
    required TResult Function(String val) onConfirmPasswordChanged,
    required TResult Function() onConfirmPasswordFieldUnfocused,
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
    TResult? Function(String val)? onConfirmPasswordChanged,
    TResult? Function()? onConfirmPasswordFieldUnfocused,
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
    TResult Function(String val)? onConfirmPasswordChanged,
    TResult Function()? onConfirmPasswordFieldUnfocused,
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
    required TResult Function(_EventOnConfirmPasswordChanged value)
        onConfirmPasswordChanged,
    required TResult Function(_EventOnConfirmPasswordFieldUnfocused value)
        onConfirmPasswordFieldUnfocused,
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
    TResult? Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult? Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
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
    TResult Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onLoginChanged != null) {
      return onLoginChanged(this);
    }
    return orElse();
  }
}

abstract class _EventOnLoginChanged implements RegistrationEvent {
  const factory _EventOnLoginChanged(final String val) =
      _$EventOnLoginChangedImpl;

  String get val;
  @JsonKey(ignore: true)
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
    extends _$RegistrationEventCopyWithImpl<$Res,
        _$EventOnLoginFieldUnfocusedImpl>
    implements _$$EventOnLoginFieldUnfocusedImplCopyWith<$Res> {
  __$$EventOnLoginFieldUnfocusedImplCopyWithImpl(
      _$EventOnLoginFieldUnfocusedImpl _value,
      $Res Function(_$EventOnLoginFieldUnfocusedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventOnLoginFieldUnfocusedImpl implements _EventOnLoginFieldUnfocused {
  const _$EventOnLoginFieldUnfocusedImpl();

  @override
  String toString() {
    return 'RegistrationEvent.onLoginFieldUnfocused()';
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
    required TResult Function(String val) onConfirmPasswordChanged,
    required TResult Function() onConfirmPasswordFieldUnfocused,
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
    TResult? Function(String val)? onConfirmPasswordChanged,
    TResult? Function()? onConfirmPasswordFieldUnfocused,
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
    TResult Function(String val)? onConfirmPasswordChanged,
    TResult Function()? onConfirmPasswordFieldUnfocused,
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
    required TResult Function(_EventOnConfirmPasswordChanged value)
        onConfirmPasswordChanged,
    required TResult Function(_EventOnConfirmPasswordFieldUnfocused value)
        onConfirmPasswordFieldUnfocused,
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
    TResult? Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult? Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
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
    TResult Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onLoginFieldUnfocused != null) {
      return onLoginFieldUnfocused(this);
    }
    return orElse();
  }
}

abstract class _EventOnLoginFieldUnfocused implements RegistrationEvent {
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
    extends _$RegistrationEventCopyWithImpl<$Res, _$EventOnPasswordChangedImpl>
    implements _$$EventOnPasswordChangedImplCopyWith<$Res> {
  __$$EventOnPasswordChangedImplCopyWithImpl(
      _$EventOnPasswordChangedImpl _value,
      $Res Function(_$EventOnPasswordChangedImpl) _then)
      : super(_value, _then);

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
    return 'RegistrationEvent.onPasswordChanged(val: $val)';
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

  @JsonKey(ignore: true)
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
    required TResult Function(String val) onConfirmPasswordChanged,
    required TResult Function() onConfirmPasswordFieldUnfocused,
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
    TResult? Function(String val)? onConfirmPasswordChanged,
    TResult? Function()? onConfirmPasswordFieldUnfocused,
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
    TResult Function(String val)? onConfirmPasswordChanged,
    TResult Function()? onConfirmPasswordFieldUnfocused,
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
    required TResult Function(_EventOnConfirmPasswordChanged value)
        onConfirmPasswordChanged,
    required TResult Function(_EventOnConfirmPasswordFieldUnfocused value)
        onConfirmPasswordFieldUnfocused,
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
    TResult? Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult? Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
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
    TResult Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onPasswordChanged != null) {
      return onPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class _EventOnPasswordChanged implements RegistrationEvent {
  const factory _EventOnPasswordChanged(final String val) =
      _$EventOnPasswordChangedImpl;

  String get val;
  @JsonKey(ignore: true)
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
    extends _$RegistrationEventCopyWithImpl<$Res,
        _$EventOnPasswordFieldUnfocusedImpl>
    implements _$$EventOnPasswordFieldUnfocusedImplCopyWith<$Res> {
  __$$EventOnPasswordFieldUnfocusedImplCopyWithImpl(
      _$EventOnPasswordFieldUnfocusedImpl _value,
      $Res Function(_$EventOnPasswordFieldUnfocusedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventOnPasswordFieldUnfocusedImpl
    implements _EventOnPasswordFieldUnfocused {
  const _$EventOnPasswordFieldUnfocusedImpl();

  @override
  String toString() {
    return 'RegistrationEvent.onPasswordFieldUnfocused()';
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
    required TResult Function(String val) onConfirmPasswordChanged,
    required TResult Function() onConfirmPasswordFieldUnfocused,
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
    TResult? Function(String val)? onConfirmPasswordChanged,
    TResult? Function()? onConfirmPasswordFieldUnfocused,
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
    TResult Function(String val)? onConfirmPasswordChanged,
    TResult Function()? onConfirmPasswordFieldUnfocused,
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
    required TResult Function(_EventOnConfirmPasswordChanged value)
        onConfirmPasswordChanged,
    required TResult Function(_EventOnConfirmPasswordFieldUnfocused value)
        onConfirmPasswordFieldUnfocused,
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
    TResult? Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult? Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
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
    TResult Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onPasswordFieldUnfocused != null) {
      return onPasswordFieldUnfocused(this);
    }
    return orElse();
  }
}

abstract class _EventOnPasswordFieldUnfocused implements RegistrationEvent {
  const factory _EventOnPasswordFieldUnfocused() =
      _$EventOnPasswordFieldUnfocusedImpl;
}

/// @nodoc
abstract class _$$EventOnConfirmPasswordChangedImplCopyWith<$Res> {
  factory _$$EventOnConfirmPasswordChangedImplCopyWith(
          _$EventOnConfirmPasswordChangedImpl value,
          $Res Function(_$EventOnConfirmPasswordChangedImpl) then) =
      __$$EventOnConfirmPasswordChangedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String val});
}

/// @nodoc
class __$$EventOnConfirmPasswordChangedImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res,
        _$EventOnConfirmPasswordChangedImpl>
    implements _$$EventOnConfirmPasswordChangedImplCopyWith<$Res> {
  __$$EventOnConfirmPasswordChangedImplCopyWithImpl(
      _$EventOnConfirmPasswordChangedImpl _value,
      $Res Function(_$EventOnConfirmPasswordChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? val = null,
  }) {
    return _then(_$EventOnConfirmPasswordChangedImpl(
      null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EventOnConfirmPasswordChangedImpl
    implements _EventOnConfirmPasswordChanged {
  const _$EventOnConfirmPasswordChangedImpl(this.val);

  @override
  final String val;

  @override
  String toString() {
    return 'RegistrationEvent.onConfirmPasswordChanged(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnConfirmPasswordChangedImpl &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventOnConfirmPasswordChangedImplCopyWith<
          _$EventOnConfirmPasswordChangedImpl>
      get copyWith => __$$EventOnConfirmPasswordChangedImplCopyWithImpl<
          _$EventOnConfirmPasswordChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String val) onLoginChanged,
    required TResult Function() onLoginFieldUnfocused,
    required TResult Function(String val) onPasswordChanged,
    required TResult Function() onPasswordFieldUnfocused,
    required TResult Function(String val) onConfirmPasswordChanged,
    required TResult Function() onConfirmPasswordFieldUnfocused,
    required TResult Function() onLoginTapped,
  }) {
    return onConfirmPasswordChanged(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onLoginChanged,
    TResult? Function()? onLoginFieldUnfocused,
    TResult? Function(String val)? onPasswordChanged,
    TResult? Function()? onPasswordFieldUnfocused,
    TResult? Function(String val)? onConfirmPasswordChanged,
    TResult? Function()? onConfirmPasswordFieldUnfocused,
    TResult? Function()? onLoginTapped,
  }) {
    return onConfirmPasswordChanged?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String val)? onLoginChanged,
    TResult Function()? onLoginFieldUnfocused,
    TResult Function(String val)? onPasswordChanged,
    TResult Function()? onPasswordFieldUnfocused,
    TResult Function(String val)? onConfirmPasswordChanged,
    TResult Function()? onConfirmPasswordFieldUnfocused,
    TResult Function()? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onConfirmPasswordChanged != null) {
      return onConfirmPasswordChanged(val);
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
    required TResult Function(_EventOnConfirmPasswordChanged value)
        onConfirmPasswordChanged,
    required TResult Function(_EventOnConfirmPasswordFieldUnfocused value)
        onConfirmPasswordFieldUnfocused,
    required TResult Function(_EventOnLoginTapped value) onLoginTapped,
  }) {
    return onConfirmPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult? Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult? Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult? Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult? Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
    TResult? Function(_EventOnLoginTapped value)? onLoginTapped,
  }) {
    return onConfirmPasswordChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onConfirmPasswordChanged != null) {
      return onConfirmPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class _EventOnConfirmPasswordChanged implements RegistrationEvent {
  const factory _EventOnConfirmPasswordChanged(final String val) =
      _$EventOnConfirmPasswordChangedImpl;

  String get val;
  @JsonKey(ignore: true)
  _$$EventOnConfirmPasswordChangedImplCopyWith<
          _$EventOnConfirmPasswordChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EventOnConfirmPasswordFieldUnfocusedImplCopyWith<$Res> {
  factory _$$EventOnConfirmPasswordFieldUnfocusedImplCopyWith(
          _$EventOnConfirmPasswordFieldUnfocusedImpl value,
          $Res Function(_$EventOnConfirmPasswordFieldUnfocusedImpl) then) =
      __$$EventOnConfirmPasswordFieldUnfocusedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventOnConfirmPasswordFieldUnfocusedImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res,
        _$EventOnConfirmPasswordFieldUnfocusedImpl>
    implements _$$EventOnConfirmPasswordFieldUnfocusedImplCopyWith<$Res> {
  __$$EventOnConfirmPasswordFieldUnfocusedImplCopyWithImpl(
      _$EventOnConfirmPasswordFieldUnfocusedImpl _value,
      $Res Function(_$EventOnConfirmPasswordFieldUnfocusedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventOnConfirmPasswordFieldUnfocusedImpl
    implements _EventOnConfirmPasswordFieldUnfocused {
  const _$EventOnConfirmPasswordFieldUnfocusedImpl();

  @override
  String toString() {
    return 'RegistrationEvent.onConfirmPasswordFieldUnfocused()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnConfirmPasswordFieldUnfocusedImpl);
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
    required TResult Function(String val) onConfirmPasswordChanged,
    required TResult Function() onConfirmPasswordFieldUnfocused,
    required TResult Function() onLoginTapped,
  }) {
    return onConfirmPasswordFieldUnfocused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String val)? onLoginChanged,
    TResult? Function()? onLoginFieldUnfocused,
    TResult? Function(String val)? onPasswordChanged,
    TResult? Function()? onPasswordFieldUnfocused,
    TResult? Function(String val)? onConfirmPasswordChanged,
    TResult? Function()? onConfirmPasswordFieldUnfocused,
    TResult? Function()? onLoginTapped,
  }) {
    return onConfirmPasswordFieldUnfocused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String val)? onLoginChanged,
    TResult Function()? onLoginFieldUnfocused,
    TResult Function(String val)? onPasswordChanged,
    TResult Function()? onPasswordFieldUnfocused,
    TResult Function(String val)? onConfirmPasswordChanged,
    TResult Function()? onConfirmPasswordFieldUnfocused,
    TResult Function()? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onConfirmPasswordFieldUnfocused != null) {
      return onConfirmPasswordFieldUnfocused();
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
    required TResult Function(_EventOnConfirmPasswordChanged value)
        onConfirmPasswordChanged,
    required TResult Function(_EventOnConfirmPasswordFieldUnfocused value)
        onConfirmPasswordFieldUnfocused,
    required TResult Function(_EventOnLoginTapped value) onLoginTapped,
  }) {
    return onConfirmPasswordFieldUnfocused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult? Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult? Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult? Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult? Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult? Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
    TResult? Function(_EventOnLoginTapped value)? onLoginTapped,
  }) {
    return onConfirmPasswordFieldUnfocused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnLoginChanged value)? onLoginChanged,
    TResult Function(_EventOnLoginFieldUnfocused value)? onLoginFieldUnfocused,
    TResult Function(_EventOnPasswordChanged value)? onPasswordChanged,
    TResult Function(_EventOnPasswordFieldUnfocused value)?
        onPasswordFieldUnfocused,
    TResult Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onConfirmPasswordFieldUnfocused != null) {
      return onConfirmPasswordFieldUnfocused(this);
    }
    return orElse();
  }
}

abstract class _EventOnConfirmPasswordFieldUnfocused
    implements RegistrationEvent {
  const factory _EventOnConfirmPasswordFieldUnfocused() =
      _$EventOnConfirmPasswordFieldUnfocusedImpl;
}

/// @nodoc
abstract class _$$EventOnLoginTappedImplCopyWith<$Res> {
  factory _$$EventOnLoginTappedImplCopyWith(_$EventOnLoginTappedImpl value,
          $Res Function(_$EventOnLoginTappedImpl) then) =
      __$$EventOnLoginTappedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$EventOnLoginTappedImplCopyWithImpl<$Res>
    extends _$RegistrationEventCopyWithImpl<$Res, _$EventOnLoginTappedImpl>
    implements _$$EventOnLoginTappedImplCopyWith<$Res> {
  __$$EventOnLoginTappedImplCopyWithImpl(_$EventOnLoginTappedImpl _value,
      $Res Function(_$EventOnLoginTappedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$EventOnLoginTappedImpl implements _EventOnLoginTapped {
  const _$EventOnLoginTappedImpl();

  @override
  String toString() {
    return 'RegistrationEvent.onLoginTapped()';
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
    required TResult Function(String val) onConfirmPasswordChanged,
    required TResult Function() onConfirmPasswordFieldUnfocused,
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
    TResult? Function(String val)? onConfirmPasswordChanged,
    TResult? Function()? onConfirmPasswordFieldUnfocused,
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
    TResult Function(String val)? onConfirmPasswordChanged,
    TResult Function()? onConfirmPasswordFieldUnfocused,
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
    required TResult Function(_EventOnConfirmPasswordChanged value)
        onConfirmPasswordChanged,
    required TResult Function(_EventOnConfirmPasswordFieldUnfocused value)
        onConfirmPasswordFieldUnfocused,
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
    TResult? Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult? Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
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
    TResult Function(_EventOnConfirmPasswordChanged value)?
        onConfirmPasswordChanged,
    TResult Function(_EventOnConfirmPasswordFieldUnfocused value)?
        onConfirmPasswordFieldUnfocused,
    TResult Function(_EventOnLoginTapped value)? onLoginTapped,
    required TResult orElse(),
  }) {
    if (onLoginTapped != null) {
      return onLoginTapped(this);
    }
    return orElse();
  }
}

abstract class _EventOnLoginTapped implements RegistrationEvent {
  const factory _EventOnLoginTapped() = _$EventOnLoginTappedImpl;
}

/// @nodoc
mixin _$RegistrationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            EmailField emailField,
            PasswordField passwordField,
            ConfirmPasswordField confirmPasswordField,
            dynamic isLoading)
        view,
    required TResult Function(RegistrationError? error) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailField emailField, PasswordField passwordField,
            ConfirmPasswordField confirmPasswordField, dynamic isLoading)?
        view,
    TResult? Function(RegistrationError? error)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailField emailField, PasswordField passwordField,
            ConfirmPasswordField confirmPasswordField, dynamic isLoading)?
        view,
    TResult Function(RegistrationError? error)? requestError,
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
abstract class $RegistrationStateCopyWith<$Res> {
  factory $RegistrationStateCopyWith(
          RegistrationState value, $Res Function(RegistrationState) then) =
      _$RegistrationStateCopyWithImpl<$Res, RegistrationState>;
}

/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res, $Val extends RegistrationState>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._value, this._then);

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
  $Res call(
      {EmailField emailField,
      PasswordField passwordField,
      ConfirmPasswordField confirmPasswordField,
      dynamic isLoading});
}

/// @nodoc
class __$$StateViewImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$StateViewImpl>
    implements _$$StateViewImplCopyWith<$Res> {
  __$$StateViewImplCopyWithImpl(
      _$StateViewImpl _value, $Res Function(_$StateViewImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? emailField = null,
    Object? passwordField = null,
    Object? confirmPasswordField = null,
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
      confirmPasswordField: null == confirmPasswordField
          ? _value.confirmPasswordField
          : confirmPasswordField // ignore: cast_nullable_to_non_nullable
              as ConfirmPasswordField,
      isLoading: freezed == isLoading ? _value.isLoading! : isLoading,
    ));
  }
}

/// @nodoc

class _$StateViewImpl implements _StateView {
  const _$StateViewImpl(
      {required this.emailField,
      required this.passwordField,
      required this.confirmPasswordField,
      this.isLoading = false});

  @override
  final EmailField emailField;
  @override
  final PasswordField passwordField;
  @override
  final ConfirmPasswordField confirmPasswordField;
  @override
  @JsonKey()
  final dynamic isLoading;

  @override
  String toString() {
    return 'RegistrationState.view(emailField: $emailField, passwordField: $passwordField, confirmPasswordField: $confirmPasswordField, isLoading: $isLoading)';
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
            (identical(other.confirmPasswordField, confirmPasswordField) ||
                other.confirmPasswordField == confirmPasswordField) &&
            const DeepCollectionEquality().equals(other.isLoading, isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailField, passwordField,
      confirmPasswordField, const DeepCollectionEquality().hash(isLoading));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateViewImplCopyWith<_$StateViewImpl> get copyWith =>
      __$$StateViewImplCopyWithImpl<_$StateViewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            EmailField emailField,
            PasswordField passwordField,
            ConfirmPasswordField confirmPasswordField,
            dynamic isLoading)
        view,
    required TResult Function(RegistrationError? error) requestError,
  }) {
    return view(emailField, passwordField, confirmPasswordField, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailField emailField, PasswordField passwordField,
            ConfirmPasswordField confirmPasswordField, dynamic isLoading)?
        view,
    TResult? Function(RegistrationError? error)? requestError,
  }) {
    return view?.call(
        emailField, passwordField, confirmPasswordField, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailField emailField, PasswordField passwordField,
            ConfirmPasswordField confirmPasswordField, dynamic isLoading)?
        view,
    TResult Function(RegistrationError? error)? requestError,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(emailField, passwordField, confirmPasswordField, isLoading);
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

abstract class _StateView implements RegistrationState {
  const factory _StateView(
      {required final EmailField emailField,
      required final PasswordField passwordField,
      required final ConfirmPasswordField confirmPasswordField,
      final dynamic isLoading}) = _$StateViewImpl;

  EmailField get emailField;
  PasswordField get passwordField;
  ConfirmPasswordField get confirmPasswordField;
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
  $Res call({RegistrationError? error});
}

/// @nodoc
class __$$StateRequestErrorImplCopyWithImpl<$Res>
    extends _$RegistrationStateCopyWithImpl<$Res, _$StateRequestErrorImpl>
    implements _$$StateRequestErrorImplCopyWith<$Res> {
  __$$StateRequestErrorImplCopyWithImpl(_$StateRequestErrorImpl _value,
      $Res Function(_$StateRequestErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_$StateRequestErrorImpl(
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as RegistrationError?,
    ));
  }
}

/// @nodoc

class _$StateRequestErrorImpl implements _StateRequestError {
  const _$StateRequestErrorImpl({this.error});

  @override
  final RegistrationError? error;

  @override
  String toString() {
    return 'RegistrationState.requestError(error: $error)';
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
            EmailField emailField,
            PasswordField passwordField,
            ConfirmPasswordField confirmPasswordField,
            dynamic isLoading)
        view,
    required TResult Function(RegistrationError? error) requestError,
  }) {
    return requestError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailField emailField, PasswordField passwordField,
            ConfirmPasswordField confirmPasswordField, dynamic isLoading)?
        view,
    TResult? Function(RegistrationError? error)? requestError,
  }) {
    return requestError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailField emailField, PasswordField passwordField,
            ConfirmPasswordField confirmPasswordField, dynamic isLoading)?
        view,
    TResult Function(RegistrationError? error)? requestError,
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

abstract class _StateRequestError implements RegistrationState {
  const factory _StateRequestError({final RegistrationError? error}) =
      _$StateRequestErrorImpl;

  RegistrationError? get error;
  @JsonKey(ignore: true)
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

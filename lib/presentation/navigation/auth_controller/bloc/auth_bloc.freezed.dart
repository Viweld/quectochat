// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthEvent {
  AuthStatus get val => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus val) onAuthStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus val)? onAuthStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus val)? onAuthStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnAuthStatusChanged value)
        onAuthStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnAuthStatusChanged value)? onAuthStatusChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnAuthStatusChanged value)? onAuthStatusChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthEventCopyWith<AuthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res, AuthEvent>;
  @useResult
  $Res call({AuthStatus val});
}

/// @nodoc
class _$AuthEventCopyWithImpl<$Res, $Val extends AuthEvent>
    implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? val = null,
  }) {
    return _then(_value.copyWith(
      val: null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EventOnAuthStatusChangedImplCopyWith<$Res>
    implements $AuthEventCopyWith<$Res> {
  factory _$$EventOnAuthStatusChangedImplCopyWith(
          _$EventOnAuthStatusChangedImpl value,
          $Res Function(_$EventOnAuthStatusChangedImpl) then) =
      __$$EventOnAuthStatusChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AuthStatus val});
}

/// @nodoc
class __$$EventOnAuthStatusChangedImplCopyWithImpl<$Res>
    extends _$AuthEventCopyWithImpl<$Res, _$EventOnAuthStatusChangedImpl>
    implements _$$EventOnAuthStatusChangedImplCopyWith<$Res> {
  __$$EventOnAuthStatusChangedImplCopyWithImpl(
      _$EventOnAuthStatusChangedImpl _value,
      $Res Function(_$EventOnAuthStatusChangedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? val = null,
  }) {
    return _then(_$EventOnAuthStatusChangedImpl(
      null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as AuthStatus,
    ));
  }
}

/// @nodoc

class _$EventOnAuthStatusChangedImpl implements _EventOnAuthStatusChanged {
  const _$EventOnAuthStatusChangedImpl(this.val);

  @override
  final AuthStatus val;

  @override
  String toString() {
    return 'AuthEvent.onAuthStatusChanged(val: $val)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EventOnAuthStatusChangedImpl &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EventOnAuthStatusChangedImplCopyWith<_$EventOnAuthStatusChangedImpl>
      get copyWith => __$$EventOnAuthStatusChangedImplCopyWithImpl<
          _$EventOnAuthStatusChangedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AuthStatus val) onAuthStatusChanged,
  }) {
    return onAuthStatusChanged(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AuthStatus val)? onAuthStatusChanged,
  }) {
    return onAuthStatusChanged?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AuthStatus val)? onAuthStatusChanged,
    required TResult orElse(),
  }) {
    if (onAuthStatusChanged != null) {
      return onAuthStatusChanged(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnAuthStatusChanged value)
        onAuthStatusChanged,
  }) {
    return onAuthStatusChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnAuthStatusChanged value)? onAuthStatusChanged,
  }) {
    return onAuthStatusChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_EventOnAuthStatusChanged value)? onAuthStatusChanged,
    required TResult orElse(),
  }) {
    if (onAuthStatusChanged != null) {
      return onAuthStatusChanged(this);
    }
    return orElse();
  }
}

abstract class _EventOnAuthStatusChanged implements AuthEvent {
  const factory _EventOnAuthStatusChanged(final AuthStatus val) =
      _$EventOnAuthStatusChangedImpl;

  @override
  AuthStatus get val;
  @override
  @JsonKey(ignore: true)
  _$$EventOnAuthStatusChangedImplCopyWith<_$EventOnAuthStatusChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AuthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authorized,
    required TResult Function() notAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authorized,
    TResult? Function()? notAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authorized,
    TResult Function()? notAuthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateAuthorized value) authorized,
    required TResult Function(_StateNotAuthorized value) notAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StateAuthorized value)? authorized,
    TResult? Function(_StateNotAuthorized value)? notAuthorized,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateAuthorized value)? authorized,
    TResult Function(_StateNotAuthorized value)? notAuthorized,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res, AuthState>;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res, $Val extends AuthState>
    implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StateAuthorizedImplCopyWith<$Res> {
  factory _$$StateAuthorizedImplCopyWith(_$StateAuthorizedImpl value,
          $Res Function(_$StateAuthorizedImpl) then) =
      __$$StateAuthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StateAuthorizedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$StateAuthorizedImpl>
    implements _$$StateAuthorizedImplCopyWith<$Res> {
  __$$StateAuthorizedImplCopyWithImpl(
      _$StateAuthorizedImpl _value, $Res Function(_$StateAuthorizedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StateAuthorizedImpl implements _StateAuthorized {
  const _$StateAuthorizedImpl();

  @override
  String toString() {
    return 'AuthState.authorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StateAuthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authorized,
    required TResult Function() notAuthorized,
  }) {
    return authorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authorized,
    TResult? Function()? notAuthorized,
  }) {
    return authorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authorized,
    TResult Function()? notAuthorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateAuthorized value) authorized,
    required TResult Function(_StateNotAuthorized value) notAuthorized,
  }) {
    return authorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StateAuthorized value)? authorized,
    TResult? Function(_StateNotAuthorized value)? notAuthorized,
  }) {
    return authorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateAuthorized value)? authorized,
    TResult Function(_StateNotAuthorized value)? notAuthorized,
    required TResult orElse(),
  }) {
    if (authorized != null) {
      return authorized(this);
    }
    return orElse();
  }
}

abstract class _StateAuthorized implements AuthState {
  const factory _StateAuthorized() = _$StateAuthorizedImpl;
}

/// @nodoc
abstract class _$$StateNotAuthorizedImplCopyWith<$Res> {
  factory _$$StateNotAuthorizedImplCopyWith(_$StateNotAuthorizedImpl value,
          $Res Function(_$StateNotAuthorizedImpl) then) =
      __$$StateNotAuthorizedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StateNotAuthorizedImplCopyWithImpl<$Res>
    extends _$AuthStateCopyWithImpl<$Res, _$StateNotAuthorizedImpl>
    implements _$$StateNotAuthorizedImplCopyWith<$Res> {
  __$$StateNotAuthorizedImplCopyWithImpl(_$StateNotAuthorizedImpl _value,
      $Res Function(_$StateNotAuthorizedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StateNotAuthorizedImpl implements _StateNotAuthorized {
  const _$StateNotAuthorizedImpl();

  @override
  String toString() {
    return 'AuthState.notAuthorized()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StateNotAuthorizedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() authorized,
    required TResult Function() notAuthorized,
  }) {
    return notAuthorized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? authorized,
    TResult? Function()? notAuthorized,
  }) {
    return notAuthorized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? authorized,
    TResult Function()? notAuthorized,
    required TResult orElse(),
  }) {
    if (notAuthorized != null) {
      return notAuthorized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StateAuthorized value) authorized,
    required TResult Function(_StateNotAuthorized value) notAuthorized,
  }) {
    return notAuthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StateAuthorized value)? authorized,
    TResult? Function(_StateNotAuthorized value)? notAuthorized,
  }) {
    return notAuthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StateAuthorized value)? authorized,
    TResult Function(_StateNotAuthorized value)? notAuthorized,
    required TResult orElse(),
  }) {
    if (notAuthorized != null) {
      return notAuthorized(this);
    }
    return orElse();
  }
}

abstract class _StateNotAuthorized implements AuthState {
  const factory _StateNotAuthorized() = _$StateNotAuthorizedImpl;
}

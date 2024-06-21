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
    required TResult Function() onLoginTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoginTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoginTapped,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_EventOnLoginTapped value) onLoginTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLoginTapped value)? onLoginTapped,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
    required TResult Function() onLoginTapped,
  }) {
    return onLoginTapped();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoginTapped,
  }) {
    return onLoginTapped?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
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
    required TResult Function(_EventOnLoginTapped value) onLoginTapped,
  }) {
    return onLoginTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_EventOnLoginTapped value)? onLoginTapped,
  }) {
    return onLoginTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
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
            RequiredField passwordField, dynamic isLoading)
        view,
    required TResult Function(LoginError? error) requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailField emailField, RequiredField passwordField,
            dynamic isLoading)?
        view,
    TResult? Function(LoginError? error)? requestError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailField emailField, RequiredField passwordField,
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
}

/// @nodoc
abstract class _$$StateViewImplCopyWith<$Res> {
  factory _$$StateViewImplCopyWith(
          _$StateViewImpl value, $Res Function(_$StateViewImpl) then) =
      __$$StateViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {EmailField emailField, RequiredField passwordField, dynamic isLoading});
}

/// @nodoc
class __$$StateViewImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$StateViewImpl>
    implements _$$StateViewImplCopyWith<$Res> {
  __$$StateViewImplCopyWithImpl(
      _$StateViewImpl _value, $Res Function(_$StateViewImpl) _then)
      : super(_value, _then);

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
              as RequiredField,
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
  final RequiredField passwordField;
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateViewImplCopyWith<_$StateViewImpl> get copyWith =>
      __$$StateViewImplCopyWithImpl<_$StateViewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EmailField emailField,
            RequiredField passwordField, dynamic isLoading)
        view,
    required TResult Function(LoginError? error) requestError,
  }) {
    return view(emailField, passwordField, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailField emailField, RequiredField passwordField,
            dynamic isLoading)?
        view,
    TResult? Function(LoginError? error)? requestError,
  }) {
    return view?.call(emailField, passwordField, isLoading);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailField emailField, RequiredField passwordField,
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
      required final RequiredField passwordField,
      final dynamic isLoading}) = _$StateViewImpl;

  EmailField get emailField;
  RequiredField get passwordField;
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
  $Res call({LoginError? error});
}

/// @nodoc
class __$$StateRequestErrorImplCopyWithImpl<$Res>
    extends _$LoginStateCopyWithImpl<$Res, _$StateRequestErrorImpl>
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
              as LoginError?,
    ));
  }
}

/// @nodoc

class _$StateRequestErrorImpl implements _StateRequestError {
  const _$StateRequestErrorImpl({required this.error});

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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      __$$StateRequestErrorImplCopyWithImpl<_$StateRequestErrorImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(EmailField emailField,
            RequiredField passwordField, dynamic isLoading)
        view,
    required TResult Function(LoginError? error) requestError,
  }) {
    return requestError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(EmailField emailField, RequiredField passwordField,
            dynamic isLoading)?
        view,
    TResult? Function(LoginError? error)? requestError,
  }) {
    return requestError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(EmailField emailField, RequiredField passwordField,
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
  const factory _StateRequestError({required final LoginError? error}) =
      _$StateRequestErrorImpl;

  LoginError? get error;
  @JsonKey(ignore: true)
  _$$StateRequestErrorImplCopyWith<_$StateRequestErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

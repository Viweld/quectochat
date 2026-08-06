// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEffect()';
}


}

/// @nodoc
class $LoginEffectCopyWith<$Res>  {
$LoginEffectCopyWith(LoginEffect _, $Res Function(LoginEffect) __);
}


/// Adds pattern-matching-related methods to [LoginEffect].
extension LoginEffectPatterns on LoginEffect {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginShowErrorEffect value)?  showError,TResult Function( LoginNavigateInviteCodeEffect value)?  navigateInviteCode,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginShowErrorEffect() when showError != null:
return showError(_that);case LoginNavigateInviteCodeEffect() when navigateInviteCode != null:
return navigateInviteCode(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginShowErrorEffect value)  showError,required TResult Function( LoginNavigateInviteCodeEffect value)  navigateInviteCode,}){
final _that = this;
switch (_that) {
case LoginShowErrorEffect():
return showError(_that);case LoginNavigateInviteCodeEffect():
return navigateInviteCode(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginShowErrorEffect value)?  showError,TResult? Function( LoginNavigateInviteCodeEffect value)?  navigateInviteCode,}){
final _that = this;
switch (_that) {
case LoginShowErrorEffect() when showError != null:
return showError(_that);case LoginNavigateInviteCodeEffect() when navigateInviteCode != null:
return navigateInviteCode(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppErrorKind kind)?  showError,TResult Function()?  navigateInviteCode,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginShowErrorEffect() when showError != null:
return showError(_that.kind);case LoginNavigateInviteCodeEffect() when navigateInviteCode != null:
return navigateInviteCode();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppErrorKind kind)  showError,required TResult Function()  navigateInviteCode,}) {final _that = this;
switch (_that) {
case LoginShowErrorEffect():
return showError(_that.kind);case LoginNavigateInviteCodeEffect():
return navigateInviteCode();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppErrorKind kind)?  showError,TResult? Function()?  navigateInviteCode,}) {final _that = this;
switch (_that) {
case LoginShowErrorEffect() when showError != null:
return showError(_that.kind);case LoginNavigateInviteCodeEffect() when navigateInviteCode != null:
return navigateInviteCode();case _:
  return null;

}
}

}

/// @nodoc


class LoginShowErrorEffect implements LoginEffect {
  const LoginShowErrorEffect(this.kind);
  

 final  AppErrorKind kind;

/// Create a copy of LoginEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginShowErrorEffectCopyWith<LoginShowErrorEffect> get copyWith => _$LoginShowErrorEffectCopyWithImpl<LoginShowErrorEffect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginShowErrorEffect&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'LoginEffect.showError(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $LoginShowErrorEffectCopyWith<$Res> implements $LoginEffectCopyWith<$Res> {
  factory $LoginShowErrorEffectCopyWith(LoginShowErrorEffect value, $Res Function(LoginShowErrorEffect) _then) = _$LoginShowErrorEffectCopyWithImpl;
@useResult
$Res call({
 AppErrorKind kind
});




}
/// @nodoc
class _$LoginShowErrorEffectCopyWithImpl<$Res>
    implements $LoginShowErrorEffectCopyWith<$Res> {
  _$LoginShowErrorEffectCopyWithImpl(this._self, this._then);

  final LoginShowErrorEffect _self;
  final $Res Function(LoginShowErrorEffect) _then;

/// Create a copy of LoginEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? kind = null,}) {
  return _then(LoginShowErrorEffect(
null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,
  ));
}


}

/// @nodoc


class LoginNavigateInviteCodeEffect implements LoginEffect {
  const LoginNavigateInviteCodeEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginNavigateInviteCodeEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEffect.navigateInviteCode()';
}


}




/// @nodoc
mixin _$LoginEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent()';
}


}

/// @nodoc
class $LoginEventCopyWith<$Res>  {
$LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}


/// Adds pattern-matching-related methods to [LoginEvent].
extension LoginEventPatterns on LoginEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginEmailChanged value)?  emailChanged,TResult Function( LoginEmailFieldUnfocused value)?  emailFieldUnfocused,TResult Function( LoginPasswordChanged value)?  passwordChanged,TResult Function( LoginPasswordFieldUnfocused value)?  passwordFieldUnfocused,TResult Function( LoginSubmitRequested value)?  submitRequested,TResult Function( LoginRegistrationRequested value)?  registrationRequested,TResult Function( LoginEffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginEmailChanged() when emailChanged != null:
return emailChanged(_that);case LoginEmailFieldUnfocused() when emailFieldUnfocused != null:
return emailFieldUnfocused(_that);case LoginPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case LoginPasswordFieldUnfocused() when passwordFieldUnfocused != null:
return passwordFieldUnfocused(_that);case LoginSubmitRequested() when submitRequested != null:
return submitRequested(_that);case LoginRegistrationRequested() when registrationRequested != null:
return registrationRequested(_that);case LoginEffectHandled() when effectHandled != null:
return effectHandled(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginEmailChanged value)  emailChanged,required TResult Function( LoginEmailFieldUnfocused value)  emailFieldUnfocused,required TResult Function( LoginPasswordChanged value)  passwordChanged,required TResult Function( LoginPasswordFieldUnfocused value)  passwordFieldUnfocused,required TResult Function( LoginSubmitRequested value)  submitRequested,required TResult Function( LoginRegistrationRequested value)  registrationRequested,required TResult Function( LoginEffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case LoginEmailChanged():
return emailChanged(_that);case LoginEmailFieldUnfocused():
return emailFieldUnfocused(_that);case LoginPasswordChanged():
return passwordChanged(_that);case LoginPasswordFieldUnfocused():
return passwordFieldUnfocused(_that);case LoginSubmitRequested():
return submitRequested(_that);case LoginRegistrationRequested():
return registrationRequested(_that);case LoginEffectHandled():
return effectHandled(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginEmailChanged value)?  emailChanged,TResult? Function( LoginEmailFieldUnfocused value)?  emailFieldUnfocused,TResult? Function( LoginPasswordChanged value)?  passwordChanged,TResult? Function( LoginPasswordFieldUnfocused value)?  passwordFieldUnfocused,TResult? Function( LoginSubmitRequested value)?  submitRequested,TResult? Function( LoginRegistrationRequested value)?  registrationRequested,TResult? Function( LoginEffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case LoginEmailChanged() when emailChanged != null:
return emailChanged(_that);case LoginEmailFieldUnfocused() when emailFieldUnfocused != null:
return emailFieldUnfocused(_that);case LoginPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case LoginPasswordFieldUnfocused() when passwordFieldUnfocused != null:
return passwordFieldUnfocused(_that);case LoginSubmitRequested() when submitRequested != null:
return submitRequested(_that);case LoginRegistrationRequested() when registrationRequested != null:
return registrationRequested(_that);case LoginEffectHandled() when effectHandled != null:
return effectHandled(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String value)?  emailChanged,TResult Function()?  emailFieldUnfocused,TResult Function( String value)?  passwordChanged,TResult Function()?  passwordFieldUnfocused,TResult Function()?  submitRequested,TResult Function()?  registrationRequested,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginEmailChanged() when emailChanged != null:
return emailChanged(_that.value);case LoginEmailFieldUnfocused() when emailFieldUnfocused != null:
return emailFieldUnfocused();case LoginPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.value);case LoginPasswordFieldUnfocused() when passwordFieldUnfocused != null:
return passwordFieldUnfocused();case LoginSubmitRequested() when submitRequested != null:
return submitRequested();case LoginRegistrationRequested() when registrationRequested != null:
return registrationRequested();case LoginEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String value)  emailChanged,required TResult Function()  emailFieldUnfocused,required TResult Function( String value)  passwordChanged,required TResult Function()  passwordFieldUnfocused,required TResult Function()  submitRequested,required TResult Function()  registrationRequested,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case LoginEmailChanged():
return emailChanged(_that.value);case LoginEmailFieldUnfocused():
return emailFieldUnfocused();case LoginPasswordChanged():
return passwordChanged(_that.value);case LoginPasswordFieldUnfocused():
return passwordFieldUnfocused();case LoginSubmitRequested():
return submitRequested();case LoginRegistrationRequested():
return registrationRequested();case LoginEffectHandled():
return effectHandled();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String value)?  emailChanged,TResult? Function()?  emailFieldUnfocused,TResult? Function( String value)?  passwordChanged,TResult? Function()?  passwordFieldUnfocused,TResult? Function()?  submitRequested,TResult? Function()?  registrationRequested,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case LoginEmailChanged() when emailChanged != null:
return emailChanged(_that.value);case LoginEmailFieldUnfocused() when emailFieldUnfocused != null:
return emailFieldUnfocused();case LoginPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.value);case LoginPasswordFieldUnfocused() when passwordFieldUnfocused != null:
return passwordFieldUnfocused();case LoginSubmitRequested() when submitRequested != null:
return submitRequested();case LoginRegistrationRequested() when registrationRequested != null:
return registrationRequested();case LoginEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class LoginEmailChanged implements LoginEvent {
  const LoginEmailChanged(this.value);
  

 final  String value;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginEmailChangedCopyWith<LoginEmailChanged> get copyWith => _$LoginEmailChangedCopyWithImpl<LoginEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEmailChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginEvent.emailChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $LoginEmailChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $LoginEmailChangedCopyWith(LoginEmailChanged value, $Res Function(LoginEmailChanged) _then) = _$LoginEmailChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$LoginEmailChangedCopyWithImpl<$Res>
    implements $LoginEmailChangedCopyWith<$Res> {
  _$LoginEmailChangedCopyWithImpl(this._self, this._then);

  final LoginEmailChanged _self;
  final $Res Function(LoginEmailChanged) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(LoginEmailChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginEmailFieldUnfocused implements LoginEvent {
  const LoginEmailFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEmailFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.emailFieldUnfocused()';
}


}




/// @nodoc


class LoginPasswordChanged implements LoginEvent {
  const LoginPasswordChanged(this.value);
  

 final  String value;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginPasswordChangedCopyWith<LoginPasswordChanged> get copyWith => _$LoginPasswordChangedCopyWithImpl<LoginPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPasswordChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'LoginEvent.passwordChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $LoginPasswordChangedCopyWith<$Res> implements $LoginEventCopyWith<$Res> {
  factory $LoginPasswordChangedCopyWith(LoginPasswordChanged value, $Res Function(LoginPasswordChanged) _then) = _$LoginPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$LoginPasswordChangedCopyWithImpl<$Res>
    implements $LoginPasswordChangedCopyWith<$Res> {
  _$LoginPasswordChangedCopyWithImpl(this._self, this._then);

  final LoginPasswordChanged _self;
  final $Res Function(LoginPasswordChanged) _then;

/// Create a copy of LoginEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(LoginPasswordChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class LoginPasswordFieldUnfocused implements LoginEvent {
  const LoginPasswordFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginPasswordFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.passwordFieldUnfocused()';
}


}




/// @nodoc


class LoginSubmitRequested implements LoginEvent {
  const LoginSubmitRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginSubmitRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.submitRequested()';
}


}




/// @nodoc


class LoginRegistrationRequested implements LoginEvent {
  const LoginRegistrationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginRegistrationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.registrationRequested()';
}


}




/// @nodoc


class LoginEffectHandled implements LoginEvent {
  const LoginEffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginEffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LoginEvent.effectHandled()';
}


}




/// @nodoc
mixin _$LoginState {

 EmailField get emailField; PasswordField get passwordField; bool get isLoading; AppErrorViewModel? get inlineError; LoginEffect? get effect;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.emailField, emailField) || other.emailField == emailField)&&(identical(other.passwordField, passwordField) || other.passwordField == passwordField)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.inlineError, inlineError) || other.inlineError == inlineError)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,emailField,passwordField,isLoading,inlineError,effect);

@override
String toString() {
  return 'LoginState(emailField: $emailField, passwordField: $passwordField, isLoading: $isLoading, inlineError: $inlineError, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 EmailField emailField, PasswordField passwordField, bool isLoading, AppErrorViewModel? inlineError, LoginEffect? effect
});


$LoginEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? emailField = null,Object? passwordField = null,Object? isLoading = null,Object? inlineError = freezed,Object? effect = freezed,}) {
  return _then(_self.copyWith(
emailField: null == emailField ? _self.emailField : emailField // ignore: cast_nullable_to_non_nullable
as EmailField,passwordField: null == passwordField ? _self.passwordField : passwordField // ignore: cast_nullable_to_non_nullable
as PasswordField,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,inlineError: freezed == inlineError ? _self.inlineError : inlineError // ignore: cast_nullable_to_non_nullable
as AppErrorViewModel?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as LoginEffect?,
  ));
}
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $LoginEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginState value)  $default,){
final _that = this;
switch (_that) {
case _LoginState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( EmailField emailField,  PasswordField passwordField,  bool isLoading,  AppErrorViewModel? inlineError,  LoginEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.emailField,_that.passwordField,_that.isLoading,_that.inlineError,_that.effect);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( EmailField emailField,  PasswordField passwordField,  bool isLoading,  AppErrorViewModel? inlineError,  LoginEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _LoginState():
return $default(_that.emailField,_that.passwordField,_that.isLoading,_that.inlineError,_that.effect);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( EmailField emailField,  PasswordField passwordField,  bool isLoading,  AppErrorViewModel? inlineError,  LoginEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.emailField,_that.passwordField,_that.isLoading,_that.inlineError,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _LoginState implements LoginState {
  const _LoginState({required this.emailField, required this.passwordField, this.isLoading = false, this.inlineError, this.effect});
  

@override final  EmailField emailField;
@override final  PasswordField passwordField;
@override@JsonKey() final  bool isLoading;
@override final  AppErrorViewModel? inlineError;
@override final  LoginEffect? effect;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.emailField, emailField) || other.emailField == emailField)&&(identical(other.passwordField, passwordField) || other.passwordField == passwordField)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.inlineError, inlineError) || other.inlineError == inlineError)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,emailField,passwordField,isLoading,inlineError,effect);

@override
String toString() {
  return 'LoginState(emailField: $emailField, passwordField: $passwordField, isLoading: $isLoading, inlineError: $inlineError, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 EmailField emailField, PasswordField passwordField, bool isLoading, AppErrorViewModel? inlineError, LoginEffect? effect
});


@override $LoginEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? emailField = null,Object? passwordField = null,Object? isLoading = null,Object? inlineError = freezed,Object? effect = freezed,}) {
  return _then(_LoginState(
emailField: null == emailField ? _self.emailField : emailField // ignore: cast_nullable_to_non_nullable
as EmailField,passwordField: null == passwordField ? _self.passwordField : passwordField // ignore: cast_nullable_to_non_nullable
as PasswordField,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,inlineError: freezed == inlineError ? _self.inlineError : inlineError // ignore: cast_nullable_to_non_nullable
as AppErrorViewModel?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as LoginEffect?,
  ));
}

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $LoginEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on

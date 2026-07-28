// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RegistrationEffect {

 AppErrorKind get kind;
/// Create a copy of RegistrationEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationEffectCopyWith<RegistrationEffect> get copyWith => _$RegistrationEffectCopyWithImpl<RegistrationEffect>(this as RegistrationEffect, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationEffect&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'RegistrationEffect(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $RegistrationEffectCopyWith<$Res>  {
  factory $RegistrationEffectCopyWith(RegistrationEffect value, $Res Function(RegistrationEffect) _then) = _$RegistrationEffectCopyWithImpl;
@useResult
$Res call({
 AppErrorKind kind
});




}
/// @nodoc
class _$RegistrationEffectCopyWithImpl<$Res>
    implements $RegistrationEffectCopyWith<$Res> {
  _$RegistrationEffectCopyWithImpl(this._self, this._then);

  final RegistrationEffect _self;
  final $Res Function(RegistrationEffect) _then;

/// Create a copy of RegistrationEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistrationEffect].
extension RegistrationEffectPatterns on RegistrationEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _ShowError value)?  showError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ShowError() when showError != null:
return showError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _ShowError value)  showError,}){
final _that = this;
switch (_that) {
case _ShowError():
return showError(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _ShowError value)?  showError,}){
final _that = this;
switch (_that) {
case _ShowError() when showError != null:
return showError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppErrorKind kind)?  showError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShowError() when showError != null:
return showError(_that.kind);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppErrorKind kind)  showError,}) {final _that = this;
switch (_that) {
case _ShowError():
return showError(_that.kind);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppErrorKind kind)?  showError,}) {final _that = this;
switch (_that) {
case _ShowError() when showError != null:
return showError(_that.kind);case _:
  return null;

}
}

}

/// @nodoc


class _ShowError implements RegistrationEffect {
  const _ShowError(this.kind);
  

@override final  AppErrorKind kind;

/// Create a copy of RegistrationEffect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowErrorCopyWith<_ShowError> get copyWith => __$ShowErrorCopyWithImpl<_ShowError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowError&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'RegistrationEffect.showError(kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$ShowErrorCopyWith<$Res> implements $RegistrationEffectCopyWith<$Res> {
  factory _$ShowErrorCopyWith(_ShowError value, $Res Function(_ShowError) _then) = __$ShowErrorCopyWithImpl;
@override @useResult
$Res call({
 AppErrorKind kind
});




}
/// @nodoc
class __$ShowErrorCopyWithImpl<$Res>
    implements _$ShowErrorCopyWith<$Res> {
  __$ShowErrorCopyWithImpl(this._self, this._then);

  final _ShowError _self;
  final $Res Function(_ShowError) _then;

/// Create a copy of RegistrationEffect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,}) {
  return _then(_ShowError(
null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,
  ));
}


}

/// @nodoc
mixin _$RegistrationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent()';
}


}

/// @nodoc
class $RegistrationEventCopyWith<$Res>  {
$RegistrationEventCopyWith(RegistrationEvent _, $Res Function(RegistrationEvent) __);
}


/// Adds pattern-matching-related methods to [RegistrationEvent].
extension RegistrationEventPatterns on RegistrationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventOnFirstNameChanged value)?  onFirstNameChanged,TResult Function( _EventOnFirstNameFieldUnfocused value)?  onFirstNameFieldUnfocused,TResult Function( _EventOnLastNameChanged value)?  onLastNameChanged,TResult Function( _EventOnLastNameFieldUnfocused value)?  onLastNameFieldUnfocused,TResult Function( _EventOnEmailChanged value)?  onEmailChanged,TResult Function( _EventOnEmailFieldUnfocused value)?  onEmailFieldUnfocused,TResult Function( _EventOnPasswordChanged value)?  onPasswordChanged,TResult Function( _EventOnPasswordFieldUnfocused value)?  onPasswordFieldUnfocused,TResult Function( _EventOnConfirmPasswordChanged value)?  onConfirmPasswordChanged,TResult Function( _EventOnConfirmPasswordFieldUnfocused value)?  onConfirmPasswordFieldUnfocused,TResult Function( _EventOnLoginTapped value)?  onLoginTapped,TResult Function( _EffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventOnFirstNameChanged() when onFirstNameChanged != null:
return onFirstNameChanged(_that);case _EventOnFirstNameFieldUnfocused() when onFirstNameFieldUnfocused != null:
return onFirstNameFieldUnfocused(_that);case _EventOnLastNameChanged() when onLastNameChanged != null:
return onLastNameChanged(_that);case _EventOnLastNameFieldUnfocused() when onLastNameFieldUnfocused != null:
return onLastNameFieldUnfocused(_that);case _EventOnEmailChanged() when onEmailChanged != null:
return onEmailChanged(_that);case _EventOnEmailFieldUnfocused() when onEmailFieldUnfocused != null:
return onEmailFieldUnfocused(_that);case _EventOnPasswordChanged() when onPasswordChanged != null:
return onPasswordChanged(_that);case _EventOnPasswordFieldUnfocused() when onPasswordFieldUnfocused != null:
return onPasswordFieldUnfocused(_that);case _EventOnConfirmPasswordChanged() when onConfirmPasswordChanged != null:
return onConfirmPasswordChanged(_that);case _EventOnConfirmPasswordFieldUnfocused() when onConfirmPasswordFieldUnfocused != null:
return onConfirmPasswordFieldUnfocused(_that);case _EventOnLoginTapped() when onLoginTapped != null:
return onLoginTapped(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventOnFirstNameChanged value)  onFirstNameChanged,required TResult Function( _EventOnFirstNameFieldUnfocused value)  onFirstNameFieldUnfocused,required TResult Function( _EventOnLastNameChanged value)  onLastNameChanged,required TResult Function( _EventOnLastNameFieldUnfocused value)  onLastNameFieldUnfocused,required TResult Function( _EventOnEmailChanged value)  onEmailChanged,required TResult Function( _EventOnEmailFieldUnfocused value)  onEmailFieldUnfocused,required TResult Function( _EventOnPasswordChanged value)  onPasswordChanged,required TResult Function( _EventOnPasswordFieldUnfocused value)  onPasswordFieldUnfocused,required TResult Function( _EventOnConfirmPasswordChanged value)  onConfirmPasswordChanged,required TResult Function( _EventOnConfirmPasswordFieldUnfocused value)  onConfirmPasswordFieldUnfocused,required TResult Function( _EventOnLoginTapped value)  onLoginTapped,required TResult Function( _EffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case _EventOnFirstNameChanged():
return onFirstNameChanged(_that);case _EventOnFirstNameFieldUnfocused():
return onFirstNameFieldUnfocused(_that);case _EventOnLastNameChanged():
return onLastNameChanged(_that);case _EventOnLastNameFieldUnfocused():
return onLastNameFieldUnfocused(_that);case _EventOnEmailChanged():
return onEmailChanged(_that);case _EventOnEmailFieldUnfocused():
return onEmailFieldUnfocused(_that);case _EventOnPasswordChanged():
return onPasswordChanged(_that);case _EventOnPasswordFieldUnfocused():
return onPasswordFieldUnfocused(_that);case _EventOnConfirmPasswordChanged():
return onConfirmPasswordChanged(_that);case _EventOnConfirmPasswordFieldUnfocused():
return onConfirmPasswordFieldUnfocused(_that);case _EventOnLoginTapped():
return onLoginTapped(_that);case _EffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventOnFirstNameChanged value)?  onFirstNameChanged,TResult? Function( _EventOnFirstNameFieldUnfocused value)?  onFirstNameFieldUnfocused,TResult? Function( _EventOnLastNameChanged value)?  onLastNameChanged,TResult? Function( _EventOnLastNameFieldUnfocused value)?  onLastNameFieldUnfocused,TResult? Function( _EventOnEmailChanged value)?  onEmailChanged,TResult? Function( _EventOnEmailFieldUnfocused value)?  onEmailFieldUnfocused,TResult? Function( _EventOnPasswordChanged value)?  onPasswordChanged,TResult? Function( _EventOnPasswordFieldUnfocused value)?  onPasswordFieldUnfocused,TResult? Function( _EventOnConfirmPasswordChanged value)?  onConfirmPasswordChanged,TResult? Function( _EventOnConfirmPasswordFieldUnfocused value)?  onConfirmPasswordFieldUnfocused,TResult? Function( _EventOnLoginTapped value)?  onLoginTapped,TResult? Function( _EffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case _EventOnFirstNameChanged() when onFirstNameChanged != null:
return onFirstNameChanged(_that);case _EventOnFirstNameFieldUnfocused() when onFirstNameFieldUnfocused != null:
return onFirstNameFieldUnfocused(_that);case _EventOnLastNameChanged() when onLastNameChanged != null:
return onLastNameChanged(_that);case _EventOnLastNameFieldUnfocused() when onLastNameFieldUnfocused != null:
return onLastNameFieldUnfocused(_that);case _EventOnEmailChanged() when onEmailChanged != null:
return onEmailChanged(_that);case _EventOnEmailFieldUnfocused() when onEmailFieldUnfocused != null:
return onEmailFieldUnfocused(_that);case _EventOnPasswordChanged() when onPasswordChanged != null:
return onPasswordChanged(_that);case _EventOnPasswordFieldUnfocused() when onPasswordFieldUnfocused != null:
return onPasswordFieldUnfocused(_that);case _EventOnConfirmPasswordChanged() when onConfirmPasswordChanged != null:
return onConfirmPasswordChanged(_that);case _EventOnConfirmPasswordFieldUnfocused() when onConfirmPasswordFieldUnfocused != null:
return onConfirmPasswordFieldUnfocused(_that);case _EventOnLoginTapped() when onLoginTapped != null:
return onLoginTapped(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String val)?  onFirstNameChanged,TResult Function()?  onFirstNameFieldUnfocused,TResult Function( String val)?  onLastNameChanged,TResult Function()?  onLastNameFieldUnfocused,TResult Function( String val)?  onEmailChanged,TResult Function()?  onEmailFieldUnfocused,TResult Function( String val)?  onPasswordChanged,TResult Function()?  onPasswordFieldUnfocused,TResult Function( String val)?  onConfirmPasswordChanged,TResult Function()?  onConfirmPasswordFieldUnfocused,TResult Function()?  onLoginTapped,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventOnFirstNameChanged() when onFirstNameChanged != null:
return onFirstNameChanged(_that.val);case _EventOnFirstNameFieldUnfocused() when onFirstNameFieldUnfocused != null:
return onFirstNameFieldUnfocused();case _EventOnLastNameChanged() when onLastNameChanged != null:
return onLastNameChanged(_that.val);case _EventOnLastNameFieldUnfocused() when onLastNameFieldUnfocused != null:
return onLastNameFieldUnfocused();case _EventOnEmailChanged() when onEmailChanged != null:
return onEmailChanged(_that.val);case _EventOnEmailFieldUnfocused() when onEmailFieldUnfocused != null:
return onEmailFieldUnfocused();case _EventOnPasswordChanged() when onPasswordChanged != null:
return onPasswordChanged(_that.val);case _EventOnPasswordFieldUnfocused() when onPasswordFieldUnfocused != null:
return onPasswordFieldUnfocused();case _EventOnConfirmPasswordChanged() when onConfirmPasswordChanged != null:
return onConfirmPasswordChanged(_that.val);case _EventOnConfirmPasswordFieldUnfocused() when onConfirmPasswordFieldUnfocused != null:
return onConfirmPasswordFieldUnfocused();case _EventOnLoginTapped() when onLoginTapped != null:
return onLoginTapped();case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String val)  onFirstNameChanged,required TResult Function()  onFirstNameFieldUnfocused,required TResult Function( String val)  onLastNameChanged,required TResult Function()  onLastNameFieldUnfocused,required TResult Function( String val)  onEmailChanged,required TResult Function()  onEmailFieldUnfocused,required TResult Function( String val)  onPasswordChanged,required TResult Function()  onPasswordFieldUnfocused,required TResult Function( String val)  onConfirmPasswordChanged,required TResult Function()  onConfirmPasswordFieldUnfocused,required TResult Function()  onLoginTapped,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case _EventOnFirstNameChanged():
return onFirstNameChanged(_that.val);case _EventOnFirstNameFieldUnfocused():
return onFirstNameFieldUnfocused();case _EventOnLastNameChanged():
return onLastNameChanged(_that.val);case _EventOnLastNameFieldUnfocused():
return onLastNameFieldUnfocused();case _EventOnEmailChanged():
return onEmailChanged(_that.val);case _EventOnEmailFieldUnfocused():
return onEmailFieldUnfocused();case _EventOnPasswordChanged():
return onPasswordChanged(_that.val);case _EventOnPasswordFieldUnfocused():
return onPasswordFieldUnfocused();case _EventOnConfirmPasswordChanged():
return onConfirmPasswordChanged(_that.val);case _EventOnConfirmPasswordFieldUnfocused():
return onConfirmPasswordFieldUnfocused();case _EventOnLoginTapped():
return onLoginTapped();case _EffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String val)?  onFirstNameChanged,TResult? Function()?  onFirstNameFieldUnfocused,TResult? Function( String val)?  onLastNameChanged,TResult? Function()?  onLastNameFieldUnfocused,TResult? Function( String val)?  onEmailChanged,TResult? Function()?  onEmailFieldUnfocused,TResult? Function( String val)?  onPasswordChanged,TResult? Function()?  onPasswordFieldUnfocused,TResult? Function( String val)?  onConfirmPasswordChanged,TResult? Function()?  onConfirmPasswordFieldUnfocused,TResult? Function()?  onLoginTapped,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case _EventOnFirstNameChanged() when onFirstNameChanged != null:
return onFirstNameChanged(_that.val);case _EventOnFirstNameFieldUnfocused() when onFirstNameFieldUnfocused != null:
return onFirstNameFieldUnfocused();case _EventOnLastNameChanged() when onLastNameChanged != null:
return onLastNameChanged(_that.val);case _EventOnLastNameFieldUnfocused() when onLastNameFieldUnfocused != null:
return onLastNameFieldUnfocused();case _EventOnEmailChanged() when onEmailChanged != null:
return onEmailChanged(_that.val);case _EventOnEmailFieldUnfocused() when onEmailFieldUnfocused != null:
return onEmailFieldUnfocused();case _EventOnPasswordChanged() when onPasswordChanged != null:
return onPasswordChanged(_that.val);case _EventOnPasswordFieldUnfocused() when onPasswordFieldUnfocused != null:
return onPasswordFieldUnfocused();case _EventOnConfirmPasswordChanged() when onConfirmPasswordChanged != null:
return onConfirmPasswordChanged(_that.val);case _EventOnConfirmPasswordFieldUnfocused() when onConfirmPasswordFieldUnfocused != null:
return onConfirmPasswordFieldUnfocused();case _EventOnLoginTapped() when onLoginTapped != null:
return onLoginTapped();case _EffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class _EventOnFirstNameChanged implements RegistrationEvent {
  const _EventOnFirstNameChanged(this.val);
  

 final  String val;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnFirstNameChangedCopyWith<_EventOnFirstNameChanged> get copyWith => __$EventOnFirstNameChangedCopyWithImpl<_EventOnFirstNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnFirstNameChanged&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'RegistrationEvent.onFirstNameChanged(val: $val)';
}


}

/// @nodoc
abstract mixin class _$EventOnFirstNameChangedCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory _$EventOnFirstNameChangedCopyWith(_EventOnFirstNameChanged value, $Res Function(_EventOnFirstNameChanged) _then) = __$EventOnFirstNameChangedCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$EventOnFirstNameChangedCopyWithImpl<$Res>
    implements _$EventOnFirstNameChangedCopyWith<$Res> {
  __$EventOnFirstNameChangedCopyWithImpl(this._self, this._then);

  final _EventOnFirstNameChanged _self;
  final $Res Function(_EventOnFirstNameChanged) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_EventOnFirstNameChanged(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventOnFirstNameFieldUnfocused implements RegistrationEvent {
  const _EventOnFirstNameFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnFirstNameFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.onFirstNameFieldUnfocused()';
}


}




/// @nodoc


class _EventOnLastNameChanged implements RegistrationEvent {
  const _EventOnLastNameChanged(this.val);
  

 final  String val;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnLastNameChangedCopyWith<_EventOnLastNameChanged> get copyWith => __$EventOnLastNameChangedCopyWithImpl<_EventOnLastNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnLastNameChanged&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'RegistrationEvent.onLastNameChanged(val: $val)';
}


}

/// @nodoc
abstract mixin class _$EventOnLastNameChangedCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory _$EventOnLastNameChangedCopyWith(_EventOnLastNameChanged value, $Res Function(_EventOnLastNameChanged) _then) = __$EventOnLastNameChangedCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$EventOnLastNameChangedCopyWithImpl<$Res>
    implements _$EventOnLastNameChangedCopyWith<$Res> {
  __$EventOnLastNameChangedCopyWithImpl(this._self, this._then);

  final _EventOnLastNameChanged _self;
  final $Res Function(_EventOnLastNameChanged) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_EventOnLastNameChanged(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventOnLastNameFieldUnfocused implements RegistrationEvent {
  const _EventOnLastNameFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnLastNameFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.onLastNameFieldUnfocused()';
}


}




/// @nodoc


class _EventOnEmailChanged implements RegistrationEvent {
  const _EventOnEmailChanged(this.val);
  

 final  String val;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnEmailChangedCopyWith<_EventOnEmailChanged> get copyWith => __$EventOnEmailChangedCopyWithImpl<_EventOnEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnEmailChanged&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'RegistrationEvent.onEmailChanged(val: $val)';
}


}

/// @nodoc
abstract mixin class _$EventOnEmailChangedCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory _$EventOnEmailChangedCopyWith(_EventOnEmailChanged value, $Res Function(_EventOnEmailChanged) _then) = __$EventOnEmailChangedCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$EventOnEmailChangedCopyWithImpl<$Res>
    implements _$EventOnEmailChangedCopyWith<$Res> {
  __$EventOnEmailChangedCopyWithImpl(this._self, this._then);

  final _EventOnEmailChanged _self;
  final $Res Function(_EventOnEmailChanged) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_EventOnEmailChanged(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventOnEmailFieldUnfocused implements RegistrationEvent {
  const _EventOnEmailFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnEmailFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.onEmailFieldUnfocused()';
}


}




/// @nodoc


class _EventOnPasswordChanged implements RegistrationEvent {
  const _EventOnPasswordChanged(this.val);
  

 final  String val;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnPasswordChangedCopyWith<_EventOnPasswordChanged> get copyWith => __$EventOnPasswordChangedCopyWithImpl<_EventOnPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnPasswordChanged&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'RegistrationEvent.onPasswordChanged(val: $val)';
}


}

/// @nodoc
abstract mixin class _$EventOnPasswordChangedCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory _$EventOnPasswordChangedCopyWith(_EventOnPasswordChanged value, $Res Function(_EventOnPasswordChanged) _then) = __$EventOnPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$EventOnPasswordChangedCopyWithImpl<$Res>
    implements _$EventOnPasswordChangedCopyWith<$Res> {
  __$EventOnPasswordChangedCopyWithImpl(this._self, this._then);

  final _EventOnPasswordChanged _self;
  final $Res Function(_EventOnPasswordChanged) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_EventOnPasswordChanged(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventOnPasswordFieldUnfocused implements RegistrationEvent {
  const _EventOnPasswordFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnPasswordFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.onPasswordFieldUnfocused()';
}


}




/// @nodoc


class _EventOnConfirmPasswordChanged implements RegistrationEvent {
  const _EventOnConfirmPasswordChanged(this.val);
  

 final  String val;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnConfirmPasswordChangedCopyWith<_EventOnConfirmPasswordChanged> get copyWith => __$EventOnConfirmPasswordChangedCopyWithImpl<_EventOnConfirmPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnConfirmPasswordChanged&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'RegistrationEvent.onConfirmPasswordChanged(val: $val)';
}


}

/// @nodoc
abstract mixin class _$EventOnConfirmPasswordChangedCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory _$EventOnConfirmPasswordChangedCopyWith(_EventOnConfirmPasswordChanged value, $Res Function(_EventOnConfirmPasswordChanged) _then) = __$EventOnConfirmPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$EventOnConfirmPasswordChangedCopyWithImpl<$Res>
    implements _$EventOnConfirmPasswordChangedCopyWith<$Res> {
  __$EventOnConfirmPasswordChangedCopyWithImpl(this._self, this._then);

  final _EventOnConfirmPasswordChanged _self;
  final $Res Function(_EventOnConfirmPasswordChanged) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_EventOnConfirmPasswordChanged(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventOnConfirmPasswordFieldUnfocused implements RegistrationEvent {
  const _EventOnConfirmPasswordFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnConfirmPasswordFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.onConfirmPasswordFieldUnfocused()';
}


}




/// @nodoc


class _EventOnLoginTapped implements RegistrationEvent {
  const _EventOnLoginTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnLoginTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.onLoginTapped()';
}


}




/// @nodoc


class _EffectHandled implements RegistrationEvent {
  const _EffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.effectHandled()';
}


}




/// @nodoc
mixin _$RegistrationState {

 RequiredField get firstNameField; RequiredField get lastNameField; EmailField get emailField; PasswordField get passwordField; ConfirmPasswordField get confirmPasswordField; bool get isLoading; RegistrationEffect? get effect;
/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationStateCopyWith<RegistrationState> get copyWith => _$RegistrationStateCopyWithImpl<RegistrationState>(this as RegistrationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationState&&(identical(other.firstNameField, firstNameField) || other.firstNameField == firstNameField)&&(identical(other.lastNameField, lastNameField) || other.lastNameField == lastNameField)&&(identical(other.emailField, emailField) || other.emailField == emailField)&&(identical(other.passwordField, passwordField) || other.passwordField == passwordField)&&(identical(other.confirmPasswordField, confirmPasswordField) || other.confirmPasswordField == confirmPasswordField)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,firstNameField,lastNameField,emailField,passwordField,confirmPasswordField,isLoading,effect);

@override
String toString() {
  return 'RegistrationState(firstNameField: $firstNameField, lastNameField: $lastNameField, emailField: $emailField, passwordField: $passwordField, confirmPasswordField: $confirmPasswordField, isLoading: $isLoading, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $RegistrationStateCopyWith<$Res>  {
  factory $RegistrationStateCopyWith(RegistrationState value, $Res Function(RegistrationState) _then) = _$RegistrationStateCopyWithImpl;
@useResult
$Res call({
 RequiredField firstNameField, RequiredField lastNameField, EmailField emailField, PasswordField passwordField, ConfirmPasswordField confirmPasswordField, bool isLoading, RegistrationEffect? effect
});


$RegistrationEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$RegistrationStateCopyWithImpl<$Res>
    implements $RegistrationStateCopyWith<$Res> {
  _$RegistrationStateCopyWithImpl(this._self, this._then);

  final RegistrationState _self;
  final $Res Function(RegistrationState) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? firstNameField = null,Object? lastNameField = null,Object? emailField = null,Object? passwordField = null,Object? confirmPasswordField = null,Object? isLoading = null,Object? effect = freezed,}) {
  return _then(_self.copyWith(
firstNameField: null == firstNameField ? _self.firstNameField : firstNameField // ignore: cast_nullable_to_non_nullable
as RequiredField,lastNameField: null == lastNameField ? _self.lastNameField : lastNameField // ignore: cast_nullable_to_non_nullable
as RequiredField,emailField: null == emailField ? _self.emailField : emailField // ignore: cast_nullable_to_non_nullable
as EmailField,passwordField: null == passwordField ? _self.passwordField : passwordField // ignore: cast_nullable_to_non_nullable
as PasswordField,confirmPasswordField: null == confirmPasswordField ? _self.confirmPasswordField : confirmPasswordField // ignore: cast_nullable_to_non_nullable
as ConfirmPasswordField,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as RegistrationEffect?,
  ));
}
/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $RegistrationEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegistrationState].
extension RegistrationStatePatterns on RegistrationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationState value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationState value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequiredField firstNameField,  RequiredField lastNameField,  EmailField emailField,  PasswordField passwordField,  ConfirmPasswordField confirmPasswordField,  bool isLoading,  RegistrationEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationState() when $default != null:
return $default(_that.firstNameField,_that.lastNameField,_that.emailField,_that.passwordField,_that.confirmPasswordField,_that.isLoading,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequiredField firstNameField,  RequiredField lastNameField,  EmailField emailField,  PasswordField passwordField,  ConfirmPasswordField confirmPasswordField,  bool isLoading,  RegistrationEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _RegistrationState():
return $default(_that.firstNameField,_that.lastNameField,_that.emailField,_that.passwordField,_that.confirmPasswordField,_that.isLoading,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequiredField firstNameField,  RequiredField lastNameField,  EmailField emailField,  PasswordField passwordField,  ConfirmPasswordField confirmPasswordField,  bool isLoading,  RegistrationEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationState() when $default != null:
return $default(_that.firstNameField,_that.lastNameField,_that.emailField,_that.passwordField,_that.confirmPasswordField,_that.isLoading,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _RegistrationState implements RegistrationState {
  const _RegistrationState({required this.firstNameField, required this.lastNameField, required this.emailField, required this.passwordField, required this.confirmPasswordField, this.isLoading = false, this.effect});
  

@override final  RequiredField firstNameField;
@override final  RequiredField lastNameField;
@override final  EmailField emailField;
@override final  PasswordField passwordField;
@override final  ConfirmPasswordField confirmPasswordField;
@override@JsonKey() final  bool isLoading;
@override final  RegistrationEffect? effect;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationStateCopyWith<_RegistrationState> get copyWith => __$RegistrationStateCopyWithImpl<_RegistrationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationState&&(identical(other.firstNameField, firstNameField) || other.firstNameField == firstNameField)&&(identical(other.lastNameField, lastNameField) || other.lastNameField == lastNameField)&&(identical(other.emailField, emailField) || other.emailField == emailField)&&(identical(other.passwordField, passwordField) || other.passwordField == passwordField)&&(identical(other.confirmPasswordField, confirmPasswordField) || other.confirmPasswordField == confirmPasswordField)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,firstNameField,lastNameField,emailField,passwordField,confirmPasswordField,isLoading,effect);

@override
String toString() {
  return 'RegistrationState(firstNameField: $firstNameField, lastNameField: $lastNameField, emailField: $emailField, passwordField: $passwordField, confirmPasswordField: $confirmPasswordField, isLoading: $isLoading, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$RegistrationStateCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory _$RegistrationStateCopyWith(_RegistrationState value, $Res Function(_RegistrationState) _then) = __$RegistrationStateCopyWithImpl;
@override @useResult
$Res call({
 RequiredField firstNameField, RequiredField lastNameField, EmailField emailField, PasswordField passwordField, ConfirmPasswordField confirmPasswordField, bool isLoading, RegistrationEffect? effect
});


@override $RegistrationEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$RegistrationStateCopyWithImpl<$Res>
    implements _$RegistrationStateCopyWith<$Res> {
  __$RegistrationStateCopyWithImpl(this._self, this._then);

  final _RegistrationState _self;
  final $Res Function(_RegistrationState) _then;

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? firstNameField = null,Object? lastNameField = null,Object? emailField = null,Object? passwordField = null,Object? confirmPasswordField = null,Object? isLoading = null,Object? effect = freezed,}) {
  return _then(_RegistrationState(
firstNameField: null == firstNameField ? _self.firstNameField : firstNameField // ignore: cast_nullable_to_non_nullable
as RequiredField,lastNameField: null == lastNameField ? _self.lastNameField : lastNameField // ignore: cast_nullable_to_non_nullable
as RequiredField,emailField: null == emailField ? _self.emailField : emailField // ignore: cast_nullable_to_non_nullable
as EmailField,passwordField: null == passwordField ? _self.passwordField : passwordField // ignore: cast_nullable_to_non_nullable
as PasswordField,confirmPasswordField: null == confirmPasswordField ? _self.confirmPasswordField : confirmPasswordField // ignore: cast_nullable_to_non_nullable
as ConfirmPasswordField,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as RegistrationEffect?,
  ));
}

/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $RegistrationEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on

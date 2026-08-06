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

 AppErrorKind get kind; String? get detail;
/// Create a copy of RegistrationEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationEffectCopyWith<RegistrationEffect> get copyWith => _$RegistrationEffectCopyWithImpl<RegistrationEffect>(this as RegistrationEffect, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationEffect&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,kind,detail);

@override
String toString() {
  return 'RegistrationEffect(kind: $kind, detail: $detail)';
}


}

/// @nodoc
abstract mixin class $RegistrationEffectCopyWith<$Res>  {
  factory $RegistrationEffectCopyWith(RegistrationEffect value, $Res Function(RegistrationEffect) _then) = _$RegistrationEffectCopyWithImpl;
@useResult
$Res call({
 AppErrorKind kind, String? detail
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
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? detail = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppErrorKind kind,  String? detail)?  showError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShowError() when showError != null:
return showError(_that.kind,_that.detail);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppErrorKind kind,  String? detail)  showError,}) {final _that = this;
switch (_that) {
case _ShowError():
return showError(_that.kind,_that.detail);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppErrorKind kind,  String? detail)?  showError,}) {final _that = this;
switch (_that) {
case _ShowError() when showError != null:
return showError(_that.kind,_that.detail);case _:
  return null;

}
}

}

/// @nodoc


class _ShowError implements RegistrationEffect {
  const _ShowError(this.kind, {this.detail});
  

@override final  AppErrorKind kind;
@override final  String? detail;

/// Create a copy of RegistrationEffect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowErrorCopyWith<_ShowError> get copyWith => __$ShowErrorCopyWithImpl<_ShowError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowError&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.detail, detail) || other.detail == detail));
}


@override
int get hashCode => Object.hash(runtimeType,kind,detail);

@override
String toString() {
  return 'RegistrationEffect.showError(kind: $kind, detail: $detail)';
}


}

/// @nodoc
abstract mixin class _$ShowErrorCopyWith<$Res> implements $RegistrationEffectCopyWith<$Res> {
  factory _$ShowErrorCopyWith(_ShowError value, $Res Function(_ShowError) _then) = __$ShowErrorCopyWithImpl;
@override @useResult
$Res call({
 AppErrorKind kind, String? detail
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
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? detail = freezed,}) {
  return _then(_ShowError(
null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as String?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RegistrationDisplayNameChanged value)?  displayNameChanged,TResult Function( RegistrationDisplayNameFieldUnfocused value)?  displayNameFieldUnfocused,TResult Function( RegistrationEmailChanged value)?  emailChanged,TResult Function( RegistrationEmailFieldUnfocused value)?  emailFieldUnfocused,TResult Function( RegistrationPasswordChanged value)?  passwordChanged,TResult Function( RegistrationPasswordFieldUnfocused value)?  passwordFieldUnfocused,TResult Function( RegistrationConfirmPasswordChanged value)?  confirmPasswordChanged,TResult Function( RegistrationConfirmPasswordFieldUnfocused value)?  confirmPasswordFieldUnfocused,TResult Function( RegistrationSubmitRequested value)?  submitRequested,TResult Function( RegistrationEffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RegistrationDisplayNameChanged() when displayNameChanged != null:
return displayNameChanged(_that);case RegistrationDisplayNameFieldUnfocused() when displayNameFieldUnfocused != null:
return displayNameFieldUnfocused(_that);case RegistrationEmailChanged() when emailChanged != null:
return emailChanged(_that);case RegistrationEmailFieldUnfocused() when emailFieldUnfocused != null:
return emailFieldUnfocused(_that);case RegistrationPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case RegistrationPasswordFieldUnfocused() when passwordFieldUnfocused != null:
return passwordFieldUnfocused(_that);case RegistrationConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that);case RegistrationConfirmPasswordFieldUnfocused() when confirmPasswordFieldUnfocused != null:
return confirmPasswordFieldUnfocused(_that);case RegistrationSubmitRequested() when submitRequested != null:
return submitRequested(_that);case RegistrationEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RegistrationDisplayNameChanged value)  displayNameChanged,required TResult Function( RegistrationDisplayNameFieldUnfocused value)  displayNameFieldUnfocused,required TResult Function( RegistrationEmailChanged value)  emailChanged,required TResult Function( RegistrationEmailFieldUnfocused value)  emailFieldUnfocused,required TResult Function( RegistrationPasswordChanged value)  passwordChanged,required TResult Function( RegistrationPasswordFieldUnfocused value)  passwordFieldUnfocused,required TResult Function( RegistrationConfirmPasswordChanged value)  confirmPasswordChanged,required TResult Function( RegistrationConfirmPasswordFieldUnfocused value)  confirmPasswordFieldUnfocused,required TResult Function( RegistrationSubmitRequested value)  submitRequested,required TResult Function( RegistrationEffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case RegistrationDisplayNameChanged():
return displayNameChanged(_that);case RegistrationDisplayNameFieldUnfocused():
return displayNameFieldUnfocused(_that);case RegistrationEmailChanged():
return emailChanged(_that);case RegistrationEmailFieldUnfocused():
return emailFieldUnfocused(_that);case RegistrationPasswordChanged():
return passwordChanged(_that);case RegistrationPasswordFieldUnfocused():
return passwordFieldUnfocused(_that);case RegistrationConfirmPasswordChanged():
return confirmPasswordChanged(_that);case RegistrationConfirmPasswordFieldUnfocused():
return confirmPasswordFieldUnfocused(_that);case RegistrationSubmitRequested():
return submitRequested(_that);case RegistrationEffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RegistrationDisplayNameChanged value)?  displayNameChanged,TResult? Function( RegistrationDisplayNameFieldUnfocused value)?  displayNameFieldUnfocused,TResult? Function( RegistrationEmailChanged value)?  emailChanged,TResult? Function( RegistrationEmailFieldUnfocused value)?  emailFieldUnfocused,TResult? Function( RegistrationPasswordChanged value)?  passwordChanged,TResult? Function( RegistrationPasswordFieldUnfocused value)?  passwordFieldUnfocused,TResult? Function( RegistrationConfirmPasswordChanged value)?  confirmPasswordChanged,TResult? Function( RegistrationConfirmPasswordFieldUnfocused value)?  confirmPasswordFieldUnfocused,TResult? Function( RegistrationSubmitRequested value)?  submitRequested,TResult? Function( RegistrationEffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case RegistrationDisplayNameChanged() when displayNameChanged != null:
return displayNameChanged(_that);case RegistrationDisplayNameFieldUnfocused() when displayNameFieldUnfocused != null:
return displayNameFieldUnfocused(_that);case RegistrationEmailChanged() when emailChanged != null:
return emailChanged(_that);case RegistrationEmailFieldUnfocused() when emailFieldUnfocused != null:
return emailFieldUnfocused(_that);case RegistrationPasswordChanged() when passwordChanged != null:
return passwordChanged(_that);case RegistrationPasswordFieldUnfocused() when passwordFieldUnfocused != null:
return passwordFieldUnfocused(_that);case RegistrationConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that);case RegistrationConfirmPasswordFieldUnfocused() when confirmPasswordFieldUnfocused != null:
return confirmPasswordFieldUnfocused(_that);case RegistrationSubmitRequested() when submitRequested != null:
return submitRequested(_that);case RegistrationEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String value)?  displayNameChanged,TResult Function()?  displayNameFieldUnfocused,TResult Function( String value)?  emailChanged,TResult Function()?  emailFieldUnfocused,TResult Function( String value)?  passwordChanged,TResult Function()?  passwordFieldUnfocused,TResult Function( String value)?  confirmPasswordChanged,TResult Function()?  confirmPasswordFieldUnfocused,TResult Function()?  submitRequested,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RegistrationDisplayNameChanged() when displayNameChanged != null:
return displayNameChanged(_that.value);case RegistrationDisplayNameFieldUnfocused() when displayNameFieldUnfocused != null:
return displayNameFieldUnfocused();case RegistrationEmailChanged() when emailChanged != null:
return emailChanged(_that.value);case RegistrationEmailFieldUnfocused() when emailFieldUnfocused != null:
return emailFieldUnfocused();case RegistrationPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.value);case RegistrationPasswordFieldUnfocused() when passwordFieldUnfocused != null:
return passwordFieldUnfocused();case RegistrationConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that.value);case RegistrationConfirmPasswordFieldUnfocused() when confirmPasswordFieldUnfocused != null:
return confirmPasswordFieldUnfocused();case RegistrationSubmitRequested() when submitRequested != null:
return submitRequested();case RegistrationEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String value)  displayNameChanged,required TResult Function()  displayNameFieldUnfocused,required TResult Function( String value)  emailChanged,required TResult Function()  emailFieldUnfocused,required TResult Function( String value)  passwordChanged,required TResult Function()  passwordFieldUnfocused,required TResult Function( String value)  confirmPasswordChanged,required TResult Function()  confirmPasswordFieldUnfocused,required TResult Function()  submitRequested,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case RegistrationDisplayNameChanged():
return displayNameChanged(_that.value);case RegistrationDisplayNameFieldUnfocused():
return displayNameFieldUnfocused();case RegistrationEmailChanged():
return emailChanged(_that.value);case RegistrationEmailFieldUnfocused():
return emailFieldUnfocused();case RegistrationPasswordChanged():
return passwordChanged(_that.value);case RegistrationPasswordFieldUnfocused():
return passwordFieldUnfocused();case RegistrationConfirmPasswordChanged():
return confirmPasswordChanged(_that.value);case RegistrationConfirmPasswordFieldUnfocused():
return confirmPasswordFieldUnfocused();case RegistrationSubmitRequested():
return submitRequested();case RegistrationEffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String value)?  displayNameChanged,TResult? Function()?  displayNameFieldUnfocused,TResult? Function( String value)?  emailChanged,TResult? Function()?  emailFieldUnfocused,TResult? Function( String value)?  passwordChanged,TResult? Function()?  passwordFieldUnfocused,TResult? Function( String value)?  confirmPasswordChanged,TResult? Function()?  confirmPasswordFieldUnfocused,TResult? Function()?  submitRequested,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case RegistrationDisplayNameChanged() when displayNameChanged != null:
return displayNameChanged(_that.value);case RegistrationDisplayNameFieldUnfocused() when displayNameFieldUnfocused != null:
return displayNameFieldUnfocused();case RegistrationEmailChanged() when emailChanged != null:
return emailChanged(_that.value);case RegistrationEmailFieldUnfocused() when emailFieldUnfocused != null:
return emailFieldUnfocused();case RegistrationPasswordChanged() when passwordChanged != null:
return passwordChanged(_that.value);case RegistrationPasswordFieldUnfocused() when passwordFieldUnfocused != null:
return passwordFieldUnfocused();case RegistrationConfirmPasswordChanged() when confirmPasswordChanged != null:
return confirmPasswordChanged(_that.value);case RegistrationConfirmPasswordFieldUnfocused() when confirmPasswordFieldUnfocused != null:
return confirmPasswordFieldUnfocused();case RegistrationSubmitRequested() when submitRequested != null:
return submitRequested();case RegistrationEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class RegistrationDisplayNameChanged implements RegistrationEvent {
  const RegistrationDisplayNameChanged(this.value);
  

 final  String value;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationDisplayNameChangedCopyWith<RegistrationDisplayNameChanged> get copyWith => _$RegistrationDisplayNameChangedCopyWithImpl<RegistrationDisplayNameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationDisplayNameChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'RegistrationEvent.displayNameChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $RegistrationDisplayNameChangedCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory $RegistrationDisplayNameChangedCopyWith(RegistrationDisplayNameChanged value, $Res Function(RegistrationDisplayNameChanged) _then) = _$RegistrationDisplayNameChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$RegistrationDisplayNameChangedCopyWithImpl<$Res>
    implements $RegistrationDisplayNameChangedCopyWith<$Res> {
  _$RegistrationDisplayNameChangedCopyWithImpl(this._self, this._then);

  final RegistrationDisplayNameChanged _self;
  final $Res Function(RegistrationDisplayNameChanged) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(RegistrationDisplayNameChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegistrationDisplayNameFieldUnfocused implements RegistrationEvent {
  const RegistrationDisplayNameFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationDisplayNameFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.displayNameFieldUnfocused()';
}


}




/// @nodoc


class RegistrationEmailChanged implements RegistrationEvent {
  const RegistrationEmailChanged(this.value);
  

 final  String value;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationEmailChangedCopyWith<RegistrationEmailChanged> get copyWith => _$RegistrationEmailChangedCopyWithImpl<RegistrationEmailChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationEmailChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'RegistrationEvent.emailChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $RegistrationEmailChangedCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory $RegistrationEmailChangedCopyWith(RegistrationEmailChanged value, $Res Function(RegistrationEmailChanged) _then) = _$RegistrationEmailChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$RegistrationEmailChangedCopyWithImpl<$Res>
    implements $RegistrationEmailChangedCopyWith<$Res> {
  _$RegistrationEmailChangedCopyWithImpl(this._self, this._then);

  final RegistrationEmailChanged _self;
  final $Res Function(RegistrationEmailChanged) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(RegistrationEmailChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegistrationEmailFieldUnfocused implements RegistrationEvent {
  const RegistrationEmailFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationEmailFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.emailFieldUnfocused()';
}


}




/// @nodoc


class RegistrationPasswordChanged implements RegistrationEvent {
  const RegistrationPasswordChanged(this.value);
  

 final  String value;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationPasswordChangedCopyWith<RegistrationPasswordChanged> get copyWith => _$RegistrationPasswordChangedCopyWithImpl<RegistrationPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationPasswordChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'RegistrationEvent.passwordChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $RegistrationPasswordChangedCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory $RegistrationPasswordChangedCopyWith(RegistrationPasswordChanged value, $Res Function(RegistrationPasswordChanged) _then) = _$RegistrationPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$RegistrationPasswordChangedCopyWithImpl<$Res>
    implements $RegistrationPasswordChangedCopyWith<$Res> {
  _$RegistrationPasswordChangedCopyWithImpl(this._self, this._then);

  final RegistrationPasswordChanged _self;
  final $Res Function(RegistrationPasswordChanged) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(RegistrationPasswordChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegistrationPasswordFieldUnfocused implements RegistrationEvent {
  const RegistrationPasswordFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationPasswordFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.passwordFieldUnfocused()';
}


}




/// @nodoc


class RegistrationConfirmPasswordChanged implements RegistrationEvent {
  const RegistrationConfirmPasswordChanged(this.value);
  

 final  String value;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationConfirmPasswordChangedCopyWith<RegistrationConfirmPasswordChanged> get copyWith => _$RegistrationConfirmPasswordChangedCopyWithImpl<RegistrationConfirmPasswordChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationConfirmPasswordChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'RegistrationEvent.confirmPasswordChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $RegistrationConfirmPasswordChangedCopyWith<$Res> implements $RegistrationEventCopyWith<$Res> {
  factory $RegistrationConfirmPasswordChangedCopyWith(RegistrationConfirmPasswordChanged value, $Res Function(RegistrationConfirmPasswordChanged) _then) = _$RegistrationConfirmPasswordChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$RegistrationConfirmPasswordChangedCopyWithImpl<$Res>
    implements $RegistrationConfirmPasswordChangedCopyWith<$Res> {
  _$RegistrationConfirmPasswordChangedCopyWithImpl(this._self, this._then);

  final RegistrationConfirmPasswordChanged _self;
  final $Res Function(RegistrationConfirmPasswordChanged) _then;

/// Create a copy of RegistrationEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(RegistrationConfirmPasswordChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class RegistrationConfirmPasswordFieldUnfocused implements RegistrationEvent {
  const RegistrationConfirmPasswordFieldUnfocused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationConfirmPasswordFieldUnfocused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.confirmPasswordFieldUnfocused()';
}


}




/// @nodoc


class RegistrationSubmitRequested implements RegistrationEvent {
  const RegistrationSubmitRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationSubmitRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'RegistrationEvent.submitRequested()';
}


}




/// @nodoc


class RegistrationEffectHandled implements RegistrationEvent {
  const RegistrationEffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationEffectHandled);
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

 String get inviteCode; RequiredField get displayNameField; EmailField get emailField; PasswordField get passwordField; ConfirmPasswordField get confirmPasswordField; bool get isLoading; RegistrationEffect? get effect;
/// Create a copy of RegistrationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationStateCopyWith<RegistrationState> get copyWith => _$RegistrationStateCopyWithImpl<RegistrationState>(this as RegistrationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationState&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.displayNameField, displayNameField) || other.displayNameField == displayNameField)&&(identical(other.emailField, emailField) || other.emailField == emailField)&&(identical(other.passwordField, passwordField) || other.passwordField == passwordField)&&(identical(other.confirmPasswordField, confirmPasswordField) || other.confirmPasswordField == confirmPasswordField)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,inviteCode,displayNameField,emailField,passwordField,confirmPasswordField,isLoading,effect);

@override
String toString() {
  return 'RegistrationState(inviteCode: $inviteCode, displayNameField: $displayNameField, emailField: $emailField, passwordField: $passwordField, confirmPasswordField: $confirmPasswordField, isLoading: $isLoading, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $RegistrationStateCopyWith<$Res>  {
  factory $RegistrationStateCopyWith(RegistrationState value, $Res Function(RegistrationState) _then) = _$RegistrationStateCopyWithImpl;
@useResult
$Res call({
 String inviteCode, RequiredField displayNameField, EmailField emailField, PasswordField passwordField, ConfirmPasswordField confirmPasswordField, bool isLoading, RegistrationEffect? effect
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
@pragma('vm:prefer-inline') @override $Res call({Object? inviteCode = null,Object? displayNameField = null,Object? emailField = null,Object? passwordField = null,Object? confirmPasswordField = null,Object? isLoading = null,Object? effect = freezed,}) {
  return _then(_self.copyWith(
inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,displayNameField: null == displayNameField ? _self.displayNameField : displayNameField // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String inviteCode,  RequiredField displayNameField,  EmailField emailField,  PasswordField passwordField,  ConfirmPasswordField confirmPasswordField,  bool isLoading,  RegistrationEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationState() when $default != null:
return $default(_that.inviteCode,_that.displayNameField,_that.emailField,_that.passwordField,_that.confirmPasswordField,_that.isLoading,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String inviteCode,  RequiredField displayNameField,  EmailField emailField,  PasswordField passwordField,  ConfirmPasswordField confirmPasswordField,  bool isLoading,  RegistrationEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _RegistrationState():
return $default(_that.inviteCode,_that.displayNameField,_that.emailField,_that.passwordField,_that.confirmPasswordField,_that.isLoading,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String inviteCode,  RequiredField displayNameField,  EmailField emailField,  PasswordField passwordField,  ConfirmPasswordField confirmPasswordField,  bool isLoading,  RegistrationEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationState() when $default != null:
return $default(_that.inviteCode,_that.displayNameField,_that.emailField,_that.passwordField,_that.confirmPasswordField,_that.isLoading,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _RegistrationState implements RegistrationState {
  const _RegistrationState({required this.inviteCode, required this.displayNameField, required this.emailField, required this.passwordField, required this.confirmPasswordField, this.isLoading = false, this.effect});
  

@override final  String inviteCode;
@override final  RequiredField displayNameField;
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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationState&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode)&&(identical(other.displayNameField, displayNameField) || other.displayNameField == displayNameField)&&(identical(other.emailField, emailField) || other.emailField == emailField)&&(identical(other.passwordField, passwordField) || other.passwordField == passwordField)&&(identical(other.confirmPasswordField, confirmPasswordField) || other.confirmPasswordField == confirmPasswordField)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,inviteCode,displayNameField,emailField,passwordField,confirmPasswordField,isLoading,effect);

@override
String toString() {
  return 'RegistrationState(inviteCode: $inviteCode, displayNameField: $displayNameField, emailField: $emailField, passwordField: $passwordField, confirmPasswordField: $confirmPasswordField, isLoading: $isLoading, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$RegistrationStateCopyWith<$Res> implements $RegistrationStateCopyWith<$Res> {
  factory _$RegistrationStateCopyWith(_RegistrationState value, $Res Function(_RegistrationState) _then) = __$RegistrationStateCopyWithImpl;
@override @useResult
$Res call({
 String inviteCode, RequiredField displayNameField, EmailField emailField, PasswordField passwordField, ConfirmPasswordField confirmPasswordField, bool isLoading, RegistrationEffect? effect
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
@override @pragma('vm:prefer-inline') $Res call({Object? inviteCode = null,Object? displayNameField = null,Object? emailField = null,Object? passwordField = null,Object? confirmPasswordField = null,Object? isLoading = null,Object? effect = freezed,}) {
  return _then(_RegistrationState(
inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,displayNameField: null == displayNameField ? _self.displayNameField : displayNameField // ignore: cast_nullable_to_non_nullable
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

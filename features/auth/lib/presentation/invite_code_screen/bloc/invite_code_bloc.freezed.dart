// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invite_code_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$InviteCodeEffect {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCodeEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteCodeEffect()';
}


}

/// @nodoc
class $InviteCodeEffectCopyWith<$Res>  {
$InviteCodeEffectCopyWith(InviteCodeEffect _, $Res Function(InviteCodeEffect) __);
}


/// Adds pattern-matching-related methods to [InviteCodeEffect].
extension InviteCodeEffectPatterns on InviteCodeEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InviteCodeNavigateQrScannerEffect value)?  navigateQrScanner,TResult Function( InviteCodeNavigateRegistrationEffect value)?  navigateRegistration,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InviteCodeNavigateQrScannerEffect() when navigateQrScanner != null:
return navigateQrScanner(_that);case InviteCodeNavigateRegistrationEffect() when navigateRegistration != null:
return navigateRegistration(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InviteCodeNavigateQrScannerEffect value)  navigateQrScanner,required TResult Function( InviteCodeNavigateRegistrationEffect value)  navigateRegistration,}){
final _that = this;
switch (_that) {
case InviteCodeNavigateQrScannerEffect():
return navigateQrScanner(_that);case InviteCodeNavigateRegistrationEffect():
return navigateRegistration(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InviteCodeNavigateQrScannerEffect value)?  navigateQrScanner,TResult? Function( InviteCodeNavigateRegistrationEffect value)?  navigateRegistration,}){
final _that = this;
switch (_that) {
case InviteCodeNavigateQrScannerEffect() when navigateQrScanner != null:
return navigateQrScanner(_that);case InviteCodeNavigateRegistrationEffect() when navigateRegistration != null:
return navigateRegistration(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  navigateQrScanner,TResult Function( String inviteCode)?  navigateRegistration,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InviteCodeNavigateQrScannerEffect() when navigateQrScanner != null:
return navigateQrScanner();case InviteCodeNavigateRegistrationEffect() when navigateRegistration != null:
return navigateRegistration(_that.inviteCode);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  navigateQrScanner,required TResult Function( String inviteCode)  navigateRegistration,}) {final _that = this;
switch (_that) {
case InviteCodeNavigateQrScannerEffect():
return navigateQrScanner();case InviteCodeNavigateRegistrationEffect():
return navigateRegistration(_that.inviteCode);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  navigateQrScanner,TResult? Function( String inviteCode)?  navigateRegistration,}) {final _that = this;
switch (_that) {
case InviteCodeNavigateQrScannerEffect() when navigateQrScanner != null:
return navigateQrScanner();case InviteCodeNavigateRegistrationEffect() when navigateRegistration != null:
return navigateRegistration(_that.inviteCode);case _:
  return null;

}
}

}

/// @nodoc


class InviteCodeNavigateQrScannerEffect implements InviteCodeEffect {
  const InviteCodeNavigateQrScannerEffect();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCodeNavigateQrScannerEffect);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteCodeEffect.navigateQrScanner()';
}


}




/// @nodoc


class InviteCodeNavigateRegistrationEffect implements InviteCodeEffect {
  const InviteCodeNavigateRegistrationEffect({required this.inviteCode});
  

 final  String inviteCode;

/// Create a copy of InviteCodeEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteCodeNavigateRegistrationEffectCopyWith<InviteCodeNavigateRegistrationEffect> get copyWith => _$InviteCodeNavigateRegistrationEffectCopyWithImpl<InviteCodeNavigateRegistrationEffect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCodeNavigateRegistrationEffect&&(identical(other.inviteCode, inviteCode) || other.inviteCode == inviteCode));
}


@override
int get hashCode => Object.hash(runtimeType,inviteCode);

@override
String toString() {
  return 'InviteCodeEffect.navigateRegistration(inviteCode: $inviteCode)';
}


}

/// @nodoc
abstract mixin class $InviteCodeNavigateRegistrationEffectCopyWith<$Res> implements $InviteCodeEffectCopyWith<$Res> {
  factory $InviteCodeNavigateRegistrationEffectCopyWith(InviteCodeNavigateRegistrationEffect value, $Res Function(InviteCodeNavigateRegistrationEffect) _then) = _$InviteCodeNavigateRegistrationEffectCopyWithImpl;
@useResult
$Res call({
 String inviteCode
});




}
/// @nodoc
class _$InviteCodeNavigateRegistrationEffectCopyWithImpl<$Res>
    implements $InviteCodeNavigateRegistrationEffectCopyWith<$Res> {
  _$InviteCodeNavigateRegistrationEffectCopyWithImpl(this._self, this._then);

  final InviteCodeNavigateRegistrationEffect _self;
  final $Res Function(InviteCodeNavigateRegistrationEffect) _then;

/// Create a copy of InviteCodeEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? inviteCode = null,}) {
  return _then(InviteCodeNavigateRegistrationEffect(
inviteCode: null == inviteCode ? _self.inviteCode : inviteCode // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$InviteCodeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCodeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteCodeEvent()';
}


}

/// @nodoc
class $InviteCodeEventCopyWith<$Res>  {
$InviteCodeEventCopyWith(InviteCodeEvent _, $Res Function(InviteCodeEvent) __);
}


/// Adds pattern-matching-related methods to [InviteCodeEvent].
extension InviteCodeEventPatterns on InviteCodeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InviteCodeCodeChanged value)?  codeChanged,TResult Function( InviteCodeFilledFromQr value)?  codeFilledFromQr,TResult Function( InviteCodeSubmitRequested value)?  submitRequested,TResult Function( InviteCodeScanQrRequested value)?  scanQrRequested,TResult Function( InviteCodeEffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InviteCodeCodeChanged() when codeChanged != null:
return codeChanged(_that);case InviteCodeFilledFromQr() when codeFilledFromQr != null:
return codeFilledFromQr(_that);case InviteCodeSubmitRequested() when submitRequested != null:
return submitRequested(_that);case InviteCodeScanQrRequested() when scanQrRequested != null:
return scanQrRequested(_that);case InviteCodeEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InviteCodeCodeChanged value)  codeChanged,required TResult Function( InviteCodeFilledFromQr value)  codeFilledFromQr,required TResult Function( InviteCodeSubmitRequested value)  submitRequested,required TResult Function( InviteCodeScanQrRequested value)  scanQrRequested,required TResult Function( InviteCodeEffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case InviteCodeCodeChanged():
return codeChanged(_that);case InviteCodeFilledFromQr():
return codeFilledFromQr(_that);case InviteCodeSubmitRequested():
return submitRequested(_that);case InviteCodeScanQrRequested():
return scanQrRequested(_that);case InviteCodeEffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InviteCodeCodeChanged value)?  codeChanged,TResult? Function( InviteCodeFilledFromQr value)?  codeFilledFromQr,TResult? Function( InviteCodeSubmitRequested value)?  submitRequested,TResult? Function( InviteCodeScanQrRequested value)?  scanQrRequested,TResult? Function( InviteCodeEffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case InviteCodeCodeChanged() when codeChanged != null:
return codeChanged(_that);case InviteCodeFilledFromQr() when codeFilledFromQr != null:
return codeFilledFromQr(_that);case InviteCodeSubmitRequested() when submitRequested != null:
return submitRequested(_that);case InviteCodeScanQrRequested() when scanQrRequested != null:
return scanQrRequested(_that);case InviteCodeEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String value)?  codeChanged,TResult Function( String value)?  codeFilledFromQr,TResult Function()?  submitRequested,TResult Function()?  scanQrRequested,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InviteCodeCodeChanged() when codeChanged != null:
return codeChanged(_that.value);case InviteCodeFilledFromQr() when codeFilledFromQr != null:
return codeFilledFromQr(_that.value);case InviteCodeSubmitRequested() when submitRequested != null:
return submitRequested();case InviteCodeScanQrRequested() when scanQrRequested != null:
return scanQrRequested();case InviteCodeEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String value)  codeChanged,required TResult Function( String value)  codeFilledFromQr,required TResult Function()  submitRequested,required TResult Function()  scanQrRequested,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case InviteCodeCodeChanged():
return codeChanged(_that.value);case InviteCodeFilledFromQr():
return codeFilledFromQr(_that.value);case InviteCodeSubmitRequested():
return submitRequested();case InviteCodeScanQrRequested():
return scanQrRequested();case InviteCodeEffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String value)?  codeChanged,TResult? Function( String value)?  codeFilledFromQr,TResult? Function()?  submitRequested,TResult? Function()?  scanQrRequested,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case InviteCodeCodeChanged() when codeChanged != null:
return codeChanged(_that.value);case InviteCodeFilledFromQr() when codeFilledFromQr != null:
return codeFilledFromQr(_that.value);case InviteCodeSubmitRequested() when submitRequested != null:
return submitRequested();case InviteCodeScanQrRequested() when scanQrRequested != null:
return scanQrRequested();case InviteCodeEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class InviteCodeCodeChanged implements InviteCodeEvent {
  const InviteCodeCodeChanged(this.value);
  

 final  String value;

/// Create a copy of InviteCodeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteCodeCodeChangedCopyWith<InviteCodeCodeChanged> get copyWith => _$InviteCodeCodeChangedCopyWithImpl<InviteCodeCodeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCodeCodeChanged&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'InviteCodeEvent.codeChanged(value: $value)';
}


}

/// @nodoc
abstract mixin class $InviteCodeCodeChangedCopyWith<$Res> implements $InviteCodeEventCopyWith<$Res> {
  factory $InviteCodeCodeChangedCopyWith(InviteCodeCodeChanged value, $Res Function(InviteCodeCodeChanged) _then) = _$InviteCodeCodeChangedCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$InviteCodeCodeChangedCopyWithImpl<$Res>
    implements $InviteCodeCodeChangedCopyWith<$Res> {
  _$InviteCodeCodeChangedCopyWithImpl(this._self, this._then);

  final InviteCodeCodeChanged _self;
  final $Res Function(InviteCodeCodeChanged) _then;

/// Create a copy of InviteCodeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(InviteCodeCodeChanged(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InviteCodeFilledFromQr implements InviteCodeEvent {
  const InviteCodeFilledFromQr(this.value);
  

 final  String value;

/// Create a copy of InviteCodeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteCodeFilledFromQrCopyWith<InviteCodeFilledFromQr> get copyWith => _$InviteCodeFilledFromQrCopyWithImpl<InviteCodeFilledFromQr>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCodeFilledFromQr&&(identical(other.value, value) || other.value == value));
}


@override
int get hashCode => Object.hash(runtimeType,value);

@override
String toString() {
  return 'InviteCodeEvent.codeFilledFromQr(value: $value)';
}


}

/// @nodoc
abstract mixin class $InviteCodeFilledFromQrCopyWith<$Res> implements $InviteCodeEventCopyWith<$Res> {
  factory $InviteCodeFilledFromQrCopyWith(InviteCodeFilledFromQr value, $Res Function(InviteCodeFilledFromQr) _then) = _$InviteCodeFilledFromQrCopyWithImpl;
@useResult
$Res call({
 String value
});




}
/// @nodoc
class _$InviteCodeFilledFromQrCopyWithImpl<$Res>
    implements $InviteCodeFilledFromQrCopyWith<$Res> {
  _$InviteCodeFilledFromQrCopyWithImpl(this._self, this._then);

  final InviteCodeFilledFromQr _self;
  final $Res Function(InviteCodeFilledFromQr) _then;

/// Create a copy of InviteCodeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? value = null,}) {
  return _then(InviteCodeFilledFromQr(
null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class InviteCodeSubmitRequested implements InviteCodeEvent {
  const InviteCodeSubmitRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCodeSubmitRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteCodeEvent.submitRequested()';
}


}




/// @nodoc


class InviteCodeScanQrRequested implements InviteCodeEvent {
  const InviteCodeScanQrRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCodeScanQrRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteCodeEvent.scanQrRequested()';
}


}




/// @nodoc


class InviteCodeEffectHandled implements InviteCodeEvent {
  const InviteCodeEffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCodeEffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'InviteCodeEvent.effectHandled()';
}


}




/// @nodoc
mixin _$InviteCodeState {

 String get code; bool get isLoading; AppErrorViewModel? get inlineError; InviteCodeEffect? get effect;
/// Create a copy of InviteCodeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InviteCodeStateCopyWith<InviteCodeState> get copyWith => _$InviteCodeStateCopyWithImpl<InviteCodeState>(this as InviteCodeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InviteCodeState&&(identical(other.code, code) || other.code == code)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.inlineError, inlineError) || other.inlineError == inlineError)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,code,isLoading,inlineError,effect);

@override
String toString() {
  return 'InviteCodeState(code: $code, isLoading: $isLoading, inlineError: $inlineError, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $InviteCodeStateCopyWith<$Res>  {
  factory $InviteCodeStateCopyWith(InviteCodeState value, $Res Function(InviteCodeState) _then) = _$InviteCodeStateCopyWithImpl;
@useResult
$Res call({
 String code, bool isLoading, AppErrorViewModel? inlineError, InviteCodeEffect? effect
});


$InviteCodeEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$InviteCodeStateCopyWithImpl<$Res>
    implements $InviteCodeStateCopyWith<$Res> {
  _$InviteCodeStateCopyWithImpl(this._self, this._then);

  final InviteCodeState _self;
  final $Res Function(InviteCodeState) _then;

/// Create a copy of InviteCodeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? isLoading = null,Object? inlineError = freezed,Object? effect = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,inlineError: freezed == inlineError ? _self.inlineError : inlineError // ignore: cast_nullable_to_non_nullable
as AppErrorViewModel?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as InviteCodeEffect?,
  ));
}
/// Create a copy of InviteCodeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InviteCodeEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $InviteCodeEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [InviteCodeState].
extension InviteCodeStatePatterns on InviteCodeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _InviteCodeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _InviteCodeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _InviteCodeState value)  $default,){
final _that = this;
switch (_that) {
case _InviteCodeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _InviteCodeState value)?  $default,){
final _that = this;
switch (_that) {
case _InviteCodeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  bool isLoading,  AppErrorViewModel? inlineError,  InviteCodeEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _InviteCodeState() when $default != null:
return $default(_that.code,_that.isLoading,_that.inlineError,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  bool isLoading,  AppErrorViewModel? inlineError,  InviteCodeEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _InviteCodeState():
return $default(_that.code,_that.isLoading,_that.inlineError,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  bool isLoading,  AppErrorViewModel? inlineError,  InviteCodeEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _InviteCodeState() when $default != null:
return $default(_that.code,_that.isLoading,_that.inlineError,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _InviteCodeState implements InviteCodeState {
  const _InviteCodeState({this.code = '', this.isLoading = false, this.inlineError, this.effect});
  

@override@JsonKey() final  String code;
@override@JsonKey() final  bool isLoading;
@override final  AppErrorViewModel? inlineError;
@override final  InviteCodeEffect? effect;

/// Create a copy of InviteCodeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$InviteCodeStateCopyWith<_InviteCodeState> get copyWith => __$InviteCodeStateCopyWithImpl<_InviteCodeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InviteCodeState&&(identical(other.code, code) || other.code == code)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.inlineError, inlineError) || other.inlineError == inlineError)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,code,isLoading,inlineError,effect);

@override
String toString() {
  return 'InviteCodeState(code: $code, isLoading: $isLoading, inlineError: $inlineError, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$InviteCodeStateCopyWith<$Res> implements $InviteCodeStateCopyWith<$Res> {
  factory _$InviteCodeStateCopyWith(_InviteCodeState value, $Res Function(_InviteCodeState) _then) = __$InviteCodeStateCopyWithImpl;
@override @useResult
$Res call({
 String code, bool isLoading, AppErrorViewModel? inlineError, InviteCodeEffect? effect
});


@override $InviteCodeEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$InviteCodeStateCopyWithImpl<$Res>
    implements _$InviteCodeStateCopyWith<$Res> {
  __$InviteCodeStateCopyWithImpl(this._self, this._then);

  final _InviteCodeState _self;
  final $Res Function(_InviteCodeState) _then;

/// Create a copy of InviteCodeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? isLoading = null,Object? inlineError = freezed,Object? effect = freezed,}) {
  return _then(_InviteCodeState(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,inlineError: freezed == inlineError ? _self.inlineError : inlineError // ignore: cast_nullable_to_non_nullable
as AppErrorViewModel?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as InviteCodeEffect?,
  ));
}

/// Create a copy of InviteCodeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$InviteCodeEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $InviteCodeEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on

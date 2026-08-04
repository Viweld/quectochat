// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChatEffect {

 AppErrorKind get kind; String? get transitMessage;
/// Create a copy of ChatEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatEffectCopyWith<ChatEffect> get copyWith => _$ChatEffectCopyWithImpl<ChatEffect>(this as ChatEffect, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEffect&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.transitMessage, transitMessage) || other.transitMessage == transitMessage));
}


@override
int get hashCode => Object.hash(runtimeType,kind,transitMessage);

@override
String toString() {
  return 'ChatEffect(kind: $kind, transitMessage: $transitMessage)';
}


}

/// @nodoc
abstract mixin class $ChatEffectCopyWith<$Res>  {
  factory $ChatEffectCopyWith(ChatEffect value, $Res Function(ChatEffect) _then) = _$ChatEffectCopyWithImpl;
@useResult
$Res call({
 AppErrorKind kind, String? transitMessage
});




}
/// @nodoc
class _$ChatEffectCopyWithImpl<$Res>
    implements $ChatEffectCopyWith<$Res> {
  _$ChatEffectCopyWithImpl(this._self, this._then);

  final ChatEffect _self;
  final $Res Function(ChatEffect) _then;

/// Create a copy of ChatEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,Object? transitMessage = freezed,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,transitMessage: freezed == transitMessage ? _self.transitMessage : transitMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatEffect].
extension ChatEffectPatterns on ChatEffect {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppErrorKind kind,  String? transitMessage)?  showError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ShowError() when showError != null:
return showError(_that.kind,_that.transitMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppErrorKind kind,  String? transitMessage)  showError,}) {final _that = this;
switch (_that) {
case _ShowError():
return showError(_that.kind,_that.transitMessage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppErrorKind kind,  String? transitMessage)?  showError,}) {final _that = this;
switch (_that) {
case _ShowError() when showError != null:
return showError(_that.kind,_that.transitMessage);case _:
  return null;

}
}

}

/// @nodoc


class _ShowError implements ChatEffect {
  const _ShowError({required this.kind, this.transitMessage});
  

@override final  AppErrorKind kind;
@override final  String? transitMessage;

/// Create a copy of ChatEffect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ShowErrorCopyWith<_ShowError> get copyWith => __$ShowErrorCopyWithImpl<_ShowError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ShowError&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.transitMessage, transitMessage) || other.transitMessage == transitMessage));
}


@override
int get hashCode => Object.hash(runtimeType,kind,transitMessage);

@override
String toString() {
  return 'ChatEffect.showError(kind: $kind, transitMessage: $transitMessage)';
}


}

/// @nodoc
abstract mixin class _$ShowErrorCopyWith<$Res> implements $ChatEffectCopyWith<$Res> {
  factory _$ShowErrorCopyWith(_ShowError value, $Res Function(_ShowError) _then) = __$ShowErrorCopyWithImpl;
@override @useResult
$Res call({
 AppErrorKind kind, String? transitMessage
});




}
/// @nodoc
class __$ShowErrorCopyWithImpl<$Res>
    implements _$ShowErrorCopyWith<$Res> {
  __$ShowErrorCopyWithImpl(this._self, this._then);

  final _ShowError _self;
  final $Res Function(_ShowError) _then;

/// Create a copy of ChatEffect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,Object? transitMessage = freezed,}) {
  return _then(_ShowError(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,transitMessage: freezed == transitMessage ? _self.transitMessage : transitMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
mixin _$ChatEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent()';
}


}

/// @nodoc
class $ChatEventCopyWith<$Res>  {
$ChatEventCopyWith(ChatEvent _, $Res Function(ChatEvent) __);
}


/// Adds pattern-matching-related methods to [ChatEvent].
extension ChatEventPatterns on ChatEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventOnInitializationRequested value)?  onInitializationRequested,TResult Function( _EventOnErrorReceived value)?  onErrorReceived,TResult Function( _EventOnStatusRecomputeRequested value)?  onStatusRecomputeRequested,TResult Function( _EventOnAppPaused value)?  onAppPaused,TResult Function( _EventOnAppResumed value)?  onAppResumed,TResult Function( _EffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case _EventOnErrorReceived() when onErrorReceived != null:
return onErrorReceived(_that);case _EventOnStatusRecomputeRequested() when onStatusRecomputeRequested != null:
return onStatusRecomputeRequested(_that);case _EventOnAppPaused() when onAppPaused != null:
return onAppPaused(_that);case _EventOnAppResumed() when onAppResumed != null:
return onAppResumed(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventOnInitializationRequested value)  onInitializationRequested,required TResult Function( _EventOnErrorReceived value)  onErrorReceived,required TResult Function( _EventOnStatusRecomputeRequested value)  onStatusRecomputeRequested,required TResult Function( _EventOnAppPaused value)  onAppPaused,required TResult Function( _EventOnAppResumed value)  onAppResumed,required TResult Function( _EffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case _EventOnInitializationRequested():
return onInitializationRequested(_that);case _EventOnErrorReceived():
return onErrorReceived(_that);case _EventOnStatusRecomputeRequested():
return onStatusRecomputeRequested(_that);case _EventOnAppPaused():
return onAppPaused(_that);case _EventOnAppResumed():
return onAppResumed(_that);case _EffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( _EventOnErrorReceived value)?  onErrorReceived,TResult? Function( _EventOnStatusRecomputeRequested value)?  onStatusRecomputeRequested,TResult? Function( _EventOnAppPaused value)?  onAppPaused,TResult? Function( _EventOnAppResumed value)?  onAppResumed,TResult? Function( _EffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case _EventOnErrorReceived() when onErrorReceived != null:
return onErrorReceived(_that);case _EventOnStatusRecomputeRequested() when onStatusRecomputeRequested != null:
return onStatusRecomputeRequested(_that);case _EventOnAppPaused() when onAppPaused != null:
return onAppPaused(_that);case _EventOnAppResumed() when onAppResumed != null:
return onAppResumed(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function( ChatRepositoryError error)?  onErrorReceived,TResult Function()?  onStatusRecomputeRequested,TResult Function()?  onAppPaused,TResult Function()?  onAppResumed,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case _EventOnErrorReceived() when onErrorReceived != null:
return onErrorReceived(_that.error);case _EventOnStatusRecomputeRequested() when onStatusRecomputeRequested != null:
return onStatusRecomputeRequested();case _EventOnAppPaused() when onAppPaused != null:
return onAppPaused();case _EventOnAppResumed() when onAppResumed != null:
return onAppResumed();case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function( ChatRepositoryError error)  onErrorReceived,required TResult Function()  onStatusRecomputeRequested,required TResult Function()  onAppPaused,required TResult Function()  onAppResumed,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case _EventOnInitializationRequested():
return onInitializationRequested();case _EventOnErrorReceived():
return onErrorReceived(_that.error);case _EventOnStatusRecomputeRequested():
return onStatusRecomputeRequested();case _EventOnAppPaused():
return onAppPaused();case _EventOnAppResumed():
return onAppResumed();case _EffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function( ChatRepositoryError error)?  onErrorReceived,TResult? Function()?  onStatusRecomputeRequested,TResult? Function()?  onAppPaused,TResult? Function()?  onAppResumed,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case _EventOnErrorReceived() when onErrorReceived != null:
return onErrorReceived(_that.error);case _EventOnStatusRecomputeRequested() when onStatusRecomputeRequested != null:
return onStatusRecomputeRequested();case _EventOnAppPaused() when onAppPaused != null:
return onAppPaused();case _EventOnAppResumed() when onAppResumed != null:
return onAppResumed();case _EffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class _EventOnInitializationRequested implements ChatEvent {
  const _EventOnInitializationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnInitializationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.onInitializationRequested()';
}


}




/// @nodoc


class _EventOnErrorReceived implements ChatEvent {
  const _EventOnErrorReceived({required this.error});
  

 final  ChatRepositoryError error;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnErrorReceivedCopyWith<_EventOnErrorReceived> get copyWith => __$EventOnErrorReceivedCopyWithImpl<_EventOnErrorReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnErrorReceived&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ChatEvent.onErrorReceived(error: $error)';
}


}

/// @nodoc
abstract mixin class _$EventOnErrorReceivedCopyWith<$Res> implements $ChatEventCopyWith<$Res> {
  factory _$EventOnErrorReceivedCopyWith(_EventOnErrorReceived value, $Res Function(_EventOnErrorReceived) _then) = __$EventOnErrorReceivedCopyWithImpl;
@useResult
$Res call({
 ChatRepositoryError error
});




}
/// @nodoc
class __$EventOnErrorReceivedCopyWithImpl<$Res>
    implements _$EventOnErrorReceivedCopyWith<$Res> {
  __$EventOnErrorReceivedCopyWithImpl(this._self, this._then);

  final _EventOnErrorReceived _self;
  final $Res Function(_EventOnErrorReceived) _then;

/// Create a copy of ChatEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_EventOnErrorReceived(
error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ChatRepositoryError,
  ));
}


}

/// @nodoc


class _EventOnStatusRecomputeRequested implements ChatEvent {
  const _EventOnStatusRecomputeRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnStatusRecomputeRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.onStatusRecomputeRequested()';
}


}




/// @nodoc


class _EventOnAppPaused implements ChatEvent {
  const _EventOnAppPaused();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnAppPaused);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.onAppPaused()';
}


}




/// @nodoc


class _EventOnAppResumed implements ChatEvent {
  const _EventOnAppResumed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnAppResumed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.onAppResumed()';
}


}




/// @nodoc


class _EffectHandled implements ChatEvent {
  const _EffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ChatEvent.effectHandled()';
}


}




/// @nodoc
mixin _$ChatState {

 String get interlocutorId; InterlocutorStatus? get interlocutorStatus; ChatEffect? get effect;
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatStateCopyWith<ChatState> get copyWith => _$ChatStateCopyWithImpl<ChatState>(this as ChatState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatState&&(identical(other.interlocutorId, interlocutorId) || other.interlocutorId == interlocutorId)&&(identical(other.interlocutorStatus, interlocutorStatus) || other.interlocutorStatus == interlocutorStatus)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,interlocutorId,interlocutorStatus,effect);

@override
String toString() {
  return 'ChatState(interlocutorId: $interlocutorId, interlocutorStatus: $interlocutorStatus, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $ChatStateCopyWith<$Res>  {
  factory $ChatStateCopyWith(ChatState value, $Res Function(ChatState) _then) = _$ChatStateCopyWithImpl;
@useResult
$Res call({
 String interlocutorId, InterlocutorStatus? interlocutorStatus, ChatEffect? effect
});


$ChatEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$ChatStateCopyWithImpl<$Res>
    implements $ChatStateCopyWith<$Res> {
  _$ChatStateCopyWithImpl(this._self, this._then);

  final ChatState _self;
  final $Res Function(ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interlocutorId = null,Object? interlocutorStatus = freezed,Object? effect = freezed,}) {
  return _then(_self.copyWith(
interlocutorId: null == interlocutorId ? _self.interlocutorId : interlocutorId // ignore: cast_nullable_to_non_nullable
as String,interlocutorStatus: freezed == interlocutorStatus ? _self.interlocutorStatus : interlocutorStatus // ignore: cast_nullable_to_non_nullable
as InterlocutorStatus?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ChatEffect?,
  ));
}
/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ChatEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChatState].
extension ChatStatePatterns on ChatState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatState value)  $default,){
final _that = this;
switch (_that) {
case _ChatState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatState value)?  $default,){
final _that = this;
switch (_that) {
case _ChatState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String interlocutorId,  InterlocutorStatus? interlocutorStatus,  ChatEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.interlocutorId,_that.interlocutorStatus,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String interlocutorId,  InterlocutorStatus? interlocutorStatus,  ChatEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ChatState():
return $default(_that.interlocutorId,_that.interlocutorStatus,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String interlocutorId,  InterlocutorStatus? interlocutorStatus,  ChatEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ChatState() when $default != null:
return $default(_that.interlocutorId,_that.interlocutorStatus,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ChatState implements ChatState {
  const _ChatState({required this.interlocutorId, this.interlocutorStatus, this.effect});
  

@override final  String interlocutorId;
@override final  InterlocutorStatus? interlocutorStatus;
@override final  ChatEffect? effect;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatStateCopyWith<_ChatState> get copyWith => __$ChatStateCopyWithImpl<_ChatState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatState&&(identical(other.interlocutorId, interlocutorId) || other.interlocutorId == interlocutorId)&&(identical(other.interlocutorStatus, interlocutorStatus) || other.interlocutorStatus == interlocutorStatus)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,interlocutorId,interlocutorStatus,effect);

@override
String toString() {
  return 'ChatState(interlocutorId: $interlocutorId, interlocutorStatus: $interlocutorStatus, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ChatStateCopyWith<$Res> implements $ChatStateCopyWith<$Res> {
  factory _$ChatStateCopyWith(_ChatState value, $Res Function(_ChatState) _then) = __$ChatStateCopyWithImpl;
@override @useResult
$Res call({
 String interlocutorId, InterlocutorStatus? interlocutorStatus, ChatEffect? effect
});


@override $ChatEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$ChatStateCopyWithImpl<$Res>
    implements _$ChatStateCopyWith<$Res> {
  __$ChatStateCopyWithImpl(this._self, this._then);

  final _ChatState _self;
  final $Res Function(_ChatState) _then;

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interlocutorId = null,Object? interlocutorStatus = freezed,Object? effect = freezed,}) {
  return _then(_ChatState(
interlocutorId: null == interlocutorId ? _self.interlocutorId : interlocutorId // ignore: cast_nullable_to_non_nullable
as String,interlocutorStatus: freezed == interlocutorStatus ? _self.interlocutorStatus : interlocutorStatus // ignore: cast_nullable_to_non_nullable
as InterlocutorStatus?,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ChatEffect?,
  ));
}

/// Create a copy of ChatState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChatEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ChatEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on

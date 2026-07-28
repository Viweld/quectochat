// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'typing_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TypingViewEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypingViewEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TypingViewEvent()';
}


}

/// @nodoc
class $TypingViewEventCopyWith<$Res>  {
$TypingViewEventCopyWith(TypingViewEvent _, $Res Function(TypingViewEvent) __);
}


/// Adds pattern-matching-related methods to [TypingViewEvent].
extension TypingViewEventPatterns on TypingViewEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventOnMessageChanged value)?  onMessageChanged,TResult Function( _EventOnSendTapped value)?  onSendTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventOnMessageChanged() when onMessageChanged != null:
return onMessageChanged(_that);case _EventOnSendTapped() when onSendTapped != null:
return onSendTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventOnMessageChanged value)  onMessageChanged,required TResult Function( _EventOnSendTapped value)  onSendTapped,}){
final _that = this;
switch (_that) {
case _EventOnMessageChanged():
return onMessageChanged(_that);case _EventOnSendTapped():
return onSendTapped(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventOnMessageChanged value)?  onMessageChanged,TResult? Function( _EventOnSendTapped value)?  onSendTapped,}){
final _that = this;
switch (_that) {
case _EventOnMessageChanged() when onMessageChanged != null:
return onMessageChanged(_that);case _EventOnSendTapped() when onSendTapped != null:
return onSendTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String val)?  onMessageChanged,TResult Function()?  onSendTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventOnMessageChanged() when onMessageChanged != null:
return onMessageChanged(_that.val);case _EventOnSendTapped() when onSendTapped != null:
return onSendTapped();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String val)  onMessageChanged,required TResult Function()  onSendTapped,}) {final _that = this;
switch (_that) {
case _EventOnMessageChanged():
return onMessageChanged(_that.val);case _EventOnSendTapped():
return onSendTapped();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String val)?  onMessageChanged,TResult? Function()?  onSendTapped,}) {final _that = this;
switch (_that) {
case _EventOnMessageChanged() when onMessageChanged != null:
return onMessageChanged(_that.val);case _EventOnSendTapped() when onSendTapped != null:
return onSendTapped();case _:
  return null;

}
}

}

/// @nodoc


class _EventOnMessageChanged implements TypingViewEvent {
  const _EventOnMessageChanged(this.val);
  

 final  String val;

/// Create a copy of TypingViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnMessageChangedCopyWith<_EventOnMessageChanged> get copyWith => __$EventOnMessageChangedCopyWithImpl<_EventOnMessageChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnMessageChanged&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'TypingViewEvent.onMessageChanged(val: $val)';
}


}

/// @nodoc
abstract mixin class _$EventOnMessageChangedCopyWith<$Res> implements $TypingViewEventCopyWith<$Res> {
  factory _$EventOnMessageChangedCopyWith(_EventOnMessageChanged value, $Res Function(_EventOnMessageChanged) _then) = __$EventOnMessageChangedCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$EventOnMessageChangedCopyWithImpl<$Res>
    implements _$EventOnMessageChangedCopyWith<$Res> {
  __$EventOnMessageChangedCopyWithImpl(this._self, this._then);

  final _EventOnMessageChanged _self;
  final $Res Function(_EventOnMessageChanged) _then;

/// Create a copy of TypingViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_EventOnMessageChanged(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventOnSendTapped implements TypingViewEvent {
  const _EventOnSendTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnSendTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TypingViewEvent.onSendTapped()';
}


}




/// @nodoc
mixin _$TypingViewState {

 String get interlocutorId; String get typedMessage; bool get isSending;
/// Create a copy of TypingViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TypingViewStateCopyWith<TypingViewState> get copyWith => _$TypingViewStateCopyWithImpl<TypingViewState>(this as TypingViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TypingViewState&&(identical(other.interlocutorId, interlocutorId) || other.interlocutorId == interlocutorId)&&(identical(other.typedMessage, typedMessage) || other.typedMessage == typedMessage)&&(identical(other.isSending, isSending) || other.isSending == isSending));
}


@override
int get hashCode => Object.hash(runtimeType,interlocutorId,typedMessage,isSending);

@override
String toString() {
  return 'TypingViewState(interlocutorId: $interlocutorId, typedMessage: $typedMessage, isSending: $isSending)';
}


}

/// @nodoc
abstract mixin class $TypingViewStateCopyWith<$Res>  {
  factory $TypingViewStateCopyWith(TypingViewState value, $Res Function(TypingViewState) _then) = _$TypingViewStateCopyWithImpl;
@useResult
$Res call({
 String interlocutorId, String typedMessage, bool isSending
});




}
/// @nodoc
class _$TypingViewStateCopyWithImpl<$Res>
    implements $TypingViewStateCopyWith<$Res> {
  _$TypingViewStateCopyWithImpl(this._self, this._then);

  final TypingViewState _self;
  final $Res Function(TypingViewState) _then;

/// Create a copy of TypingViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interlocutorId = null,Object? typedMessage = null,Object? isSending = null,}) {
  return _then(_self.copyWith(
interlocutorId: null == interlocutorId ? _self.interlocutorId : interlocutorId // ignore: cast_nullable_to_non_nullable
as String,typedMessage: null == typedMessage ? _self.typedMessage : typedMessage // ignore: cast_nullable_to_non_nullable
as String,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TypingViewState].
extension TypingViewStatePatterns on TypingViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TypingViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TypingViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TypingViewState value)  $default,){
final _that = this;
switch (_that) {
case _TypingViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TypingViewState value)?  $default,){
final _that = this;
switch (_that) {
case _TypingViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String interlocutorId,  String typedMessage,  bool isSending)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TypingViewState() when $default != null:
return $default(_that.interlocutorId,_that.typedMessage,_that.isSending);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String interlocutorId,  String typedMessage,  bool isSending)  $default,) {final _that = this;
switch (_that) {
case _TypingViewState():
return $default(_that.interlocutorId,_that.typedMessage,_that.isSending);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String interlocutorId,  String typedMessage,  bool isSending)?  $default,) {final _that = this;
switch (_that) {
case _TypingViewState() when $default != null:
return $default(_that.interlocutorId,_that.typedMessage,_that.isSending);case _:
  return null;

}
}

}

/// @nodoc


class _TypingViewState implements TypingViewState {
  const _TypingViewState({required this.interlocutorId, this.typedMessage = '', this.isSending = false});
  

@override final  String interlocutorId;
@override@JsonKey() final  String typedMessage;
@override@JsonKey() final  bool isSending;

/// Create a copy of TypingViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TypingViewStateCopyWith<_TypingViewState> get copyWith => __$TypingViewStateCopyWithImpl<_TypingViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TypingViewState&&(identical(other.interlocutorId, interlocutorId) || other.interlocutorId == interlocutorId)&&(identical(other.typedMessage, typedMessage) || other.typedMessage == typedMessage)&&(identical(other.isSending, isSending) || other.isSending == isSending));
}


@override
int get hashCode => Object.hash(runtimeType,interlocutorId,typedMessage,isSending);

@override
String toString() {
  return 'TypingViewState(interlocutorId: $interlocutorId, typedMessage: $typedMessage, isSending: $isSending)';
}


}

/// @nodoc
abstract mixin class _$TypingViewStateCopyWith<$Res> implements $TypingViewStateCopyWith<$Res> {
  factory _$TypingViewStateCopyWith(_TypingViewState value, $Res Function(_TypingViewState) _then) = __$TypingViewStateCopyWithImpl;
@override @useResult
$Res call({
 String interlocutorId, String typedMessage, bool isSending
});




}
/// @nodoc
class __$TypingViewStateCopyWithImpl<$Res>
    implements _$TypingViewStateCopyWith<$Res> {
  __$TypingViewStateCopyWithImpl(this._self, this._then);

  final _TypingViewState _self;
  final $Res Function(_TypingViewState) _then;

/// Create a copy of TypingViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interlocutorId = null,Object? typedMessage = null,Object? isSending = null,}) {
  return _then(_TypingViewState(
interlocutorId: null == interlocutorId ? _self.interlocutorId : interlocutorId // ignore: cast_nullable_to_non_nullable
as String,typedMessage: null == typedMessage ? _self.typedMessage : typedMessage // ignore: cast_nullable_to_non_nullable
as String,isSending: null == isSending ? _self.isSending : isSending // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

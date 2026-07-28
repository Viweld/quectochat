// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reading_view_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReadingViewEffect {

 AppErrorKind get kind;
/// Create a copy of ReadingViewEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingViewEffectCopyWith<ReadingViewEffect> get copyWith => _$ReadingViewEffectCopyWithImpl<ReadingViewEffect>(this as ReadingViewEffect, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingViewEffect&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'ReadingViewEffect(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $ReadingViewEffectCopyWith<$Res>  {
  factory $ReadingViewEffectCopyWith(ReadingViewEffect value, $Res Function(ReadingViewEffect) _then) = _$ReadingViewEffectCopyWithImpl;
@useResult
$Res call({
 AppErrorKind kind
});




}
/// @nodoc
class _$ReadingViewEffectCopyWithImpl<$Res>
    implements $ReadingViewEffectCopyWith<$Res> {
  _$ReadingViewEffectCopyWithImpl(this._self, this._then);

  final ReadingViewEffect _self;
  final $Res Function(ReadingViewEffect) _then;

/// Create a copy of ReadingViewEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,
  ));
}

}


/// Adds pattern-matching-related methods to [ReadingViewEffect].
extension ReadingViewEffectPatterns on ReadingViewEffect {
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


class _ShowError implements ReadingViewEffect {
  const _ShowError(this.kind);
  

@override final  AppErrorKind kind;

/// Create a copy of ReadingViewEffect
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
  return 'ReadingViewEffect.showError(kind: $kind)';
}


}

/// @nodoc
abstract mixin class _$ShowErrorCopyWith<$Res> implements $ReadingViewEffectCopyWith<$Res> {
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

/// Create a copy of ReadingViewEffect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,}) {
  return _then(_ShowError(
null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,
  ));
}


}

/// @nodoc
mixin _$ReadingViewEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingViewEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingViewEvent()';
}


}

/// @nodoc
class $ReadingViewEventCopyWith<$Res>  {
$ReadingViewEventCopyWith(ReadingViewEvent _, $Res Function(ReadingViewEvent) __);
}


/// Adds pattern-matching-related methods to [ReadingViewEvent].
extension ReadingViewEventPatterns on ReadingViewEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventOnNextPageRequested value)?  onNextPageRequested,TResult Function( _EventOnMessagesUpdated value)?  onMessagesUpdated,TResult Function( _EffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested(_that);case _EventOnMessagesUpdated() when onMessagesUpdated != null:
return onMessagesUpdated(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventOnNextPageRequested value)  onNextPageRequested,required TResult Function( _EventOnMessagesUpdated value)  onMessagesUpdated,required TResult Function( _EffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case _EventOnNextPageRequested():
return onNextPageRequested(_that);case _EventOnMessagesUpdated():
return onMessagesUpdated(_that);case _EffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventOnNextPageRequested value)?  onNextPageRequested,TResult? Function( _EventOnMessagesUpdated value)?  onMessagesUpdated,TResult? Function( _EffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested(_that);case _EventOnMessagesUpdated() when onMessagesUpdated != null:
return onMessagesUpdated(_that);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onNextPageRequested,TResult Function( Iterable<Message> messages)?  onMessagesUpdated,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested();case _EventOnMessagesUpdated() when onMessagesUpdated != null:
return onMessagesUpdated(_that.messages);case _EffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onNextPageRequested,required TResult Function( Iterable<Message> messages)  onMessagesUpdated,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case _EventOnNextPageRequested():
return onNextPageRequested();case _EventOnMessagesUpdated():
return onMessagesUpdated(_that.messages);case _EffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onNextPageRequested,TResult? Function( Iterable<Message> messages)?  onMessagesUpdated,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested();case _EventOnMessagesUpdated() when onMessagesUpdated != null:
return onMessagesUpdated(_that.messages);case _EffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class _EventOnNextPageRequested implements ReadingViewEvent {
  const _EventOnNextPageRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnNextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingViewEvent.onNextPageRequested()';
}


}




/// @nodoc


class _EventOnMessagesUpdated implements ReadingViewEvent {
  const _EventOnMessagesUpdated({required this.messages});
  

 final  Iterable<Message> messages;

/// Create a copy of ReadingViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnMessagesUpdatedCopyWith<_EventOnMessagesUpdated> get copyWith => __$EventOnMessagesUpdatedCopyWithImpl<_EventOnMessagesUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnMessagesUpdated&&const DeepCollectionEquality().equals(other.messages, messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages));

@override
String toString() {
  return 'ReadingViewEvent.onMessagesUpdated(messages: $messages)';
}


}

/// @nodoc
abstract mixin class _$EventOnMessagesUpdatedCopyWith<$Res> implements $ReadingViewEventCopyWith<$Res> {
  factory _$EventOnMessagesUpdatedCopyWith(_EventOnMessagesUpdated value, $Res Function(_EventOnMessagesUpdated) _then) = __$EventOnMessagesUpdatedCopyWithImpl;
@useResult
$Res call({
 Iterable<Message> messages
});




}
/// @nodoc
class __$EventOnMessagesUpdatedCopyWithImpl<$Res>
    implements _$EventOnMessagesUpdatedCopyWith<$Res> {
  __$EventOnMessagesUpdatedCopyWithImpl(this._self, this._then);

  final _EventOnMessagesUpdated _self;
  final $Res Function(_EventOnMessagesUpdated) _then;

/// Create a copy of ReadingViewEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = null,}) {
  return _then(_EventOnMessagesUpdated(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as Iterable<Message>,
  ));
}


}

/// @nodoc


class _EffectHandled implements ReadingViewEvent {
  const _EffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingViewEvent.effectHandled()';
}


}




/// @nodoc
mixin _$ReadingViewState {

 Iterable<Message> get messages; bool get isPending; ReadingViewEffect? get effect;
/// Create a copy of ReadingViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingViewStateCopyWith<ReadingViewState> get copyWith => _$ReadingViewStateCopyWithImpl<ReadingViewState>(this as ReadingViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingViewState&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),isPending,effect);

@override
String toString() {
  return 'ReadingViewState(messages: $messages, isPending: $isPending, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $ReadingViewStateCopyWith<$Res>  {
  factory $ReadingViewStateCopyWith(ReadingViewState value, $Res Function(ReadingViewState) _then) = _$ReadingViewStateCopyWithImpl;
@useResult
$Res call({
 Iterable<Message> messages, bool isPending, ReadingViewEffect? effect
});


$ReadingViewEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$ReadingViewStateCopyWithImpl<$Res>
    implements $ReadingViewStateCopyWith<$Res> {
  _$ReadingViewStateCopyWithImpl(this._self, this._then);

  final ReadingViewState _self;
  final $Res Function(ReadingViewState) _then;

/// Create a copy of ReadingViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? isPending = null,Object? effect = freezed,}) {
  return _then(_self.copyWith(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as Iterable<Message>,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ReadingViewEffect?,
  ));
}
/// Create a copy of ReadingViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReadingViewEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ReadingViewEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReadingViewState].
extension ReadingViewStatePatterns on ReadingViewState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReadingViewState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReadingViewState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReadingViewState value)  $default,){
final _that = this;
switch (_that) {
case _ReadingViewState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReadingViewState value)?  $default,){
final _that = this;
switch (_that) {
case _ReadingViewState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Iterable<Message> messages,  bool isPending,  ReadingViewEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadingViewState() when $default != null:
return $default(_that.messages,_that.isPending,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Iterable<Message> messages,  bool isPending,  ReadingViewEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _ReadingViewState():
return $default(_that.messages,_that.isPending,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Iterable<Message> messages,  bool isPending,  ReadingViewEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _ReadingViewState() when $default != null:
return $default(_that.messages,_that.isPending,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _ReadingViewState implements ReadingViewState {
  const _ReadingViewState({this.messages = const [], this.isPending = true, this.effect});
  

@override@JsonKey() final  Iterable<Message> messages;
@override@JsonKey() final  bool isPending;
@override final  ReadingViewEffect? effect;

/// Create a copy of ReadingViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadingViewStateCopyWith<_ReadingViewState> get copyWith => __$ReadingViewStateCopyWithImpl<_ReadingViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadingViewState&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(messages),isPending,effect);

@override
String toString() {
  return 'ReadingViewState(messages: $messages, isPending: $isPending, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$ReadingViewStateCopyWith<$Res> implements $ReadingViewStateCopyWith<$Res> {
  factory _$ReadingViewStateCopyWith(_ReadingViewState value, $Res Function(_ReadingViewState) _then) = __$ReadingViewStateCopyWithImpl;
@override @useResult
$Res call({
 Iterable<Message> messages, bool isPending, ReadingViewEffect? effect
});


@override $ReadingViewEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$ReadingViewStateCopyWithImpl<$Res>
    implements _$ReadingViewStateCopyWith<$Res> {
  __$ReadingViewStateCopyWithImpl(this._self, this._then);

  final _ReadingViewState _self;
  final $Res Function(_ReadingViewState) _then;

/// Create a copy of ReadingViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? isPending = null,Object? effect = freezed,}) {
  return _then(_ReadingViewState(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as Iterable<Message>,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as ReadingViewEffect?,
  ));
}

/// Create a copy of ReadingViewState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReadingViewEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $ReadingViewEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on

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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventOnInitializationRequested value)?  onInitializationRequested,TResult Function( _EventOnNextPageRequested value)?  onNextPageRequested,TResult Function( _EventOnMessagesUpdated value)?  onMessagesUpdated,TResult Function( _EventOnChatCleared value)?  onChatCleared,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested(_that);case _EventOnMessagesUpdated() when onMessagesUpdated != null:
return onMessagesUpdated(_that);case _EventOnChatCleared() when onChatCleared != null:
return onChatCleared(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventOnInitializationRequested value)  onInitializationRequested,required TResult Function( _EventOnNextPageRequested value)  onNextPageRequested,required TResult Function( _EventOnMessagesUpdated value)  onMessagesUpdated,required TResult Function( _EventOnChatCleared value)  onChatCleared,}){
final _that = this;
switch (_that) {
case _EventOnInitializationRequested():
return onInitializationRequested(_that);case _EventOnNextPageRequested():
return onNextPageRequested(_that);case _EventOnMessagesUpdated():
return onMessagesUpdated(_that);case _EventOnChatCleared():
return onChatCleared(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( _EventOnNextPageRequested value)?  onNextPageRequested,TResult? Function( _EventOnMessagesUpdated value)?  onMessagesUpdated,TResult? Function( _EventOnChatCleared value)?  onChatCleared,}){
final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested(_that);case _EventOnMessagesUpdated() when onMessagesUpdated != null:
return onMessagesUpdated(_that);case _EventOnChatCleared() when onChatCleared != null:
return onChatCleared(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function()?  onNextPageRequested,TResult Function( List<Message> messages)?  onMessagesUpdated,TResult Function()?  onChatCleared,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested();case _EventOnMessagesUpdated() when onMessagesUpdated != null:
return onMessagesUpdated(_that.messages);case _EventOnChatCleared() when onChatCleared != null:
return onChatCleared();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function()  onNextPageRequested,required TResult Function( List<Message> messages)  onMessagesUpdated,required TResult Function()  onChatCleared,}) {final _that = this;
switch (_that) {
case _EventOnInitializationRequested():
return onInitializationRequested();case _EventOnNextPageRequested():
return onNextPageRequested();case _EventOnMessagesUpdated():
return onMessagesUpdated(_that.messages);case _EventOnChatCleared():
return onChatCleared();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function()?  onNextPageRequested,TResult? Function( List<Message> messages)?  onMessagesUpdated,TResult? Function()?  onChatCleared,}) {final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested();case _EventOnMessagesUpdated() when onMessagesUpdated != null:
return onMessagesUpdated(_that.messages);case _EventOnChatCleared() when onChatCleared != null:
return onChatCleared();case _:
  return null;

}
}

}

/// @nodoc


class _EventOnInitializationRequested implements ReadingViewEvent {
  const _EventOnInitializationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnInitializationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingViewEvent.onInitializationRequested()';
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
  const _EventOnMessagesUpdated({required final  List<Message> messages}): _messages = messages;
  

 final  List<Message> _messages;
 List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}


/// Create a copy of ReadingViewEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnMessagesUpdatedCopyWith<_EventOnMessagesUpdated> get copyWith => __$EventOnMessagesUpdatedCopyWithImpl<_EventOnMessagesUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnMessagesUpdated&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

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
 List<Message> messages
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
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,
  ));
}


}

/// @nodoc


class _EventOnChatCleared implements ReadingViewEvent {
  const _EventOnChatCleared();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnChatCleared);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ReadingViewEvent.onChatCleared()';
}


}




/// @nodoc
mixin _$ReadingViewState {

 String get interlocutorId; List<Message> get messages; bool get isPending; bool get isNextLoading; bool get hasNext;
/// Create a copy of ReadingViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReadingViewStateCopyWith<ReadingViewState> get copyWith => _$ReadingViewStateCopyWithImpl<ReadingViewState>(this as ReadingViewState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReadingViewState&&(identical(other.interlocutorId, interlocutorId) || other.interlocutorId == interlocutorId)&&const DeepCollectionEquality().equals(other.messages, messages)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.isNextLoading, isNextLoading) || other.isNextLoading == isNextLoading)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,interlocutorId,const DeepCollectionEquality().hash(messages),isPending,isNextLoading,hasNext);

@override
String toString() {
  return 'ReadingViewState(interlocutorId: $interlocutorId, messages: $messages, isPending: $isPending, isNextLoading: $isNextLoading, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class $ReadingViewStateCopyWith<$Res>  {
  factory $ReadingViewStateCopyWith(ReadingViewState value, $Res Function(ReadingViewState) _then) = _$ReadingViewStateCopyWithImpl;
@useResult
$Res call({
 String interlocutorId, List<Message> messages, bool isPending, bool isNextLoading, bool hasNext
});




}
/// @nodoc
class _$ReadingViewStateCopyWithImpl<$Res>
    implements $ReadingViewStateCopyWith<$Res> {
  _$ReadingViewStateCopyWithImpl(this._self, this._then);

  final ReadingViewState _self;
  final $Res Function(ReadingViewState) _then;

/// Create a copy of ReadingViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interlocutorId = null,Object? messages = null,Object? isPending = null,Object? isNextLoading = null,Object? hasNext = null,}) {
  return _then(_self.copyWith(
interlocutorId: null == interlocutorId ? _self.interlocutorId : interlocutorId // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,isNextLoading: null == isNextLoading ? _self.isNextLoading : isNextLoading // ignore: cast_nullable_to_non_nullable
as bool,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String interlocutorId,  List<Message> messages,  bool isPending,  bool isNextLoading,  bool hasNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReadingViewState() when $default != null:
return $default(_that.interlocutorId,_that.messages,_that.isPending,_that.isNextLoading,_that.hasNext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String interlocutorId,  List<Message> messages,  bool isPending,  bool isNextLoading,  bool hasNext)  $default,) {final _that = this;
switch (_that) {
case _ReadingViewState():
return $default(_that.interlocutorId,_that.messages,_that.isPending,_that.isNextLoading,_that.hasNext);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String interlocutorId,  List<Message> messages,  bool isPending,  bool isNextLoading,  bool hasNext)?  $default,) {final _that = this;
switch (_that) {
case _ReadingViewState() when $default != null:
return $default(_that.interlocutorId,_that.messages,_that.isPending,_that.isNextLoading,_that.hasNext);case _:
  return null;

}
}

}

/// @nodoc


class _ReadingViewState implements ReadingViewState {
  const _ReadingViewState({required this.interlocutorId, final  List<Message> messages = const <Message>[], this.isPending = true, this.isNextLoading = false, this.hasNext = true}): _messages = messages;
  

@override final  String interlocutorId;
 final  List<Message> _messages;
@override@JsonKey() List<Message> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  bool isPending;
@override@JsonKey() final  bool isNextLoading;
@override@JsonKey() final  bool hasNext;

/// Create a copy of ReadingViewState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReadingViewStateCopyWith<_ReadingViewState> get copyWith => __$ReadingViewStateCopyWithImpl<_ReadingViewState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReadingViewState&&(identical(other.interlocutorId, interlocutorId) || other.interlocutorId == interlocutorId)&&const DeepCollectionEquality().equals(other._messages, _messages)&&(identical(other.isPending, isPending) || other.isPending == isPending)&&(identical(other.isNextLoading, isNextLoading) || other.isNextLoading == isNextLoading)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext));
}


@override
int get hashCode => Object.hash(runtimeType,interlocutorId,const DeepCollectionEquality().hash(_messages),isPending,isNextLoading,hasNext);

@override
String toString() {
  return 'ReadingViewState(interlocutorId: $interlocutorId, messages: $messages, isPending: $isPending, isNextLoading: $isNextLoading, hasNext: $hasNext)';
}


}

/// @nodoc
abstract mixin class _$ReadingViewStateCopyWith<$Res> implements $ReadingViewStateCopyWith<$Res> {
  factory _$ReadingViewStateCopyWith(_ReadingViewState value, $Res Function(_ReadingViewState) _then) = __$ReadingViewStateCopyWithImpl;
@override @useResult
$Res call({
 String interlocutorId, List<Message> messages, bool isPending, bool isNextLoading, bool hasNext
});




}
/// @nodoc
class __$ReadingViewStateCopyWithImpl<$Res>
    implements _$ReadingViewStateCopyWith<$Res> {
  __$ReadingViewStateCopyWithImpl(this._self, this._then);

  final _ReadingViewState _self;
  final $Res Function(_ReadingViewState) _then;

/// Create a copy of ReadingViewState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interlocutorId = null,Object? messages = null,Object? isPending = null,Object? isNextLoading = null,Object? hasNext = null,}) {
  return _then(_ReadingViewState(
interlocutorId: null == interlocutorId ? _self.interlocutorId : interlocutorId // ignore: cast_nullable_to_non_nullable
as String,messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<Message>,isPending: null == isPending ? _self.isPending : isPending // ignore: cast_nullable_to_non_nullable
as bool,isNextLoading: null == isNextLoading ? _self.isNextLoading : isNextLoading // ignore: cast_nullable_to_non_nullable
as bool,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on

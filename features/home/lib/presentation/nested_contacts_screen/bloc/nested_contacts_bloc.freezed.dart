// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nested_contacts_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NestedContactsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NestedContactsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NestedContactsEvent()';
}


}

/// @nodoc
class $NestedContactsEventCopyWith<$Res>  {
$NestedContactsEventCopyWith(NestedContactsEvent _, $Res Function(NestedContactsEvent) __);
}


/// Adds pattern-matching-related methods to [NestedContactsEvent].
extension NestedContactsEventPatterns on NestedContactsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NestedContactsInit value)?  init,TResult Function( NestedContactsRetryRequested value)?  retryRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NestedContactsInit() when init != null:
return init(_that);case NestedContactsRetryRequested() when retryRequested != null:
return retryRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NestedContactsInit value)  init,required TResult Function( NestedContactsRetryRequested value)  retryRequested,}){
final _that = this;
switch (_that) {
case NestedContactsInit():
return init(_that);case NestedContactsRetryRequested():
return retryRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NestedContactsInit value)?  init,TResult? Function( NestedContactsRetryRequested value)?  retryRequested,}){
final _that = this;
switch (_that) {
case NestedContactsInit() when init != null:
return init(_that);case NestedContactsRetryRequested() when retryRequested != null:
return retryRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  retryRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NestedContactsInit() when init != null:
return init();case NestedContactsRetryRequested() when retryRequested != null:
return retryRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  retryRequested,}) {final _that = this;
switch (_that) {
case NestedContactsInit():
return init();case NestedContactsRetryRequested():
return retryRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  retryRequested,}) {final _that = this;
switch (_that) {
case NestedContactsInit() when init != null:
return init();case NestedContactsRetryRequested() when retryRequested != null:
return retryRequested();case _:
  return null;

}
}

}

/// @nodoc


class NestedContactsInit implements NestedContactsEvent {
  const NestedContactsInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NestedContactsInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NestedContactsEvent.init()';
}


}




/// @nodoc


class NestedContactsRetryRequested implements NestedContactsEvent {
  const NestedContactsRetryRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NestedContactsRetryRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NestedContactsEvent.retryRequested()';
}


}




/// @nodoc
mixin _$NestedContactsState {

 String get anchorUserId; String get anchorDisplayName; bool get isFriendsOfRelative; List<Interlocutor> get contacts; bool get isLoading; AppErrorViewModel? get loadError;
/// Create a copy of NestedContactsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NestedContactsStateCopyWith<NestedContactsState> get copyWith => _$NestedContactsStateCopyWithImpl<NestedContactsState>(this as NestedContactsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NestedContactsState&&(identical(other.anchorUserId, anchorUserId) || other.anchorUserId == anchorUserId)&&(identical(other.anchorDisplayName, anchorDisplayName) || other.anchorDisplayName == anchorDisplayName)&&(identical(other.isFriendsOfRelative, isFriendsOfRelative) || other.isFriendsOfRelative == isFriendsOfRelative)&&const DeepCollectionEquality().equals(other.contacts, contacts)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.loadError, loadError) || other.loadError == loadError));
}


@override
int get hashCode => Object.hash(runtimeType,anchorUserId,anchorDisplayName,isFriendsOfRelative,const DeepCollectionEquality().hash(contacts),isLoading,loadError);

@override
String toString() {
  return 'NestedContactsState(anchorUserId: $anchorUserId, anchorDisplayName: $anchorDisplayName, isFriendsOfRelative: $isFriendsOfRelative, contacts: $contacts, isLoading: $isLoading, loadError: $loadError)';
}


}

/// @nodoc
abstract mixin class $NestedContactsStateCopyWith<$Res>  {
  factory $NestedContactsStateCopyWith(NestedContactsState value, $Res Function(NestedContactsState) _then) = _$NestedContactsStateCopyWithImpl;
@useResult
$Res call({
 String anchorUserId, String anchorDisplayName, bool isFriendsOfRelative, List<Interlocutor> contacts, bool isLoading, AppErrorViewModel? loadError
});




}
/// @nodoc
class _$NestedContactsStateCopyWithImpl<$Res>
    implements $NestedContactsStateCopyWith<$Res> {
  _$NestedContactsStateCopyWithImpl(this._self, this._then);

  final NestedContactsState _self;
  final $Res Function(NestedContactsState) _then;

/// Create a copy of NestedContactsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? anchorUserId = null,Object? anchorDisplayName = null,Object? isFriendsOfRelative = null,Object? contacts = null,Object? isLoading = null,Object? loadError = freezed,}) {
  return _then(_self.copyWith(
anchorUserId: null == anchorUserId ? _self.anchorUserId : anchorUserId // ignore: cast_nullable_to_non_nullable
as String,anchorDisplayName: null == anchorDisplayName ? _self.anchorDisplayName : anchorDisplayName // ignore: cast_nullable_to_non_nullable
as String,isFriendsOfRelative: null == isFriendsOfRelative ? _self.isFriendsOfRelative : isFriendsOfRelative // ignore: cast_nullable_to_non_nullable
as bool,contacts: null == contacts ? _self.contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Interlocutor>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as AppErrorViewModel?,
  ));
}

}


/// Adds pattern-matching-related methods to [NestedContactsState].
extension NestedContactsStatePatterns on NestedContactsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NestedContactsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NestedContactsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NestedContactsState value)  $default,){
final _that = this;
switch (_that) {
case _NestedContactsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NestedContactsState value)?  $default,){
final _that = this;
switch (_that) {
case _NestedContactsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String anchorUserId,  String anchorDisplayName,  bool isFriendsOfRelative,  List<Interlocutor> contacts,  bool isLoading,  AppErrorViewModel? loadError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NestedContactsState() when $default != null:
return $default(_that.anchorUserId,_that.anchorDisplayName,_that.isFriendsOfRelative,_that.contacts,_that.isLoading,_that.loadError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String anchorUserId,  String anchorDisplayName,  bool isFriendsOfRelative,  List<Interlocutor> contacts,  bool isLoading,  AppErrorViewModel? loadError)  $default,) {final _that = this;
switch (_that) {
case _NestedContactsState():
return $default(_that.anchorUserId,_that.anchorDisplayName,_that.isFriendsOfRelative,_that.contacts,_that.isLoading,_that.loadError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String anchorUserId,  String anchorDisplayName,  bool isFriendsOfRelative,  List<Interlocutor> contacts,  bool isLoading,  AppErrorViewModel? loadError)?  $default,) {final _that = this;
switch (_that) {
case _NestedContactsState() when $default != null:
return $default(_that.anchorUserId,_that.anchorDisplayName,_that.isFriendsOfRelative,_that.contacts,_that.isLoading,_that.loadError);case _:
  return null;

}
}

}

/// @nodoc


class _NestedContactsState implements NestedContactsState {
  const _NestedContactsState({required this.anchorUserId, required this.anchorDisplayName, required this.isFriendsOfRelative, final  List<Interlocutor> contacts = const <Interlocutor>[], this.isLoading = false, this.loadError}): _contacts = contacts;
  

@override final  String anchorUserId;
@override final  String anchorDisplayName;
@override final  bool isFriendsOfRelative;
 final  List<Interlocutor> _contacts;
@override@JsonKey() List<Interlocutor> get contacts {
  if (_contacts is EqualUnmodifiableListView) return _contacts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_contacts);
}

@override@JsonKey() final  bool isLoading;
@override final  AppErrorViewModel? loadError;

/// Create a copy of NestedContactsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NestedContactsStateCopyWith<_NestedContactsState> get copyWith => __$NestedContactsStateCopyWithImpl<_NestedContactsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NestedContactsState&&(identical(other.anchorUserId, anchorUserId) || other.anchorUserId == anchorUserId)&&(identical(other.anchorDisplayName, anchorDisplayName) || other.anchorDisplayName == anchorDisplayName)&&(identical(other.isFriendsOfRelative, isFriendsOfRelative) || other.isFriendsOfRelative == isFriendsOfRelative)&&const DeepCollectionEquality().equals(other._contacts, _contacts)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.loadError, loadError) || other.loadError == loadError));
}


@override
int get hashCode => Object.hash(runtimeType,anchorUserId,anchorDisplayName,isFriendsOfRelative,const DeepCollectionEquality().hash(_contacts),isLoading,loadError);

@override
String toString() {
  return 'NestedContactsState(anchorUserId: $anchorUserId, anchorDisplayName: $anchorDisplayName, isFriendsOfRelative: $isFriendsOfRelative, contacts: $contacts, isLoading: $isLoading, loadError: $loadError)';
}


}

/// @nodoc
abstract mixin class _$NestedContactsStateCopyWith<$Res> implements $NestedContactsStateCopyWith<$Res> {
  factory _$NestedContactsStateCopyWith(_NestedContactsState value, $Res Function(_NestedContactsState) _then) = __$NestedContactsStateCopyWithImpl;
@override @useResult
$Res call({
 String anchorUserId, String anchorDisplayName, bool isFriendsOfRelative, List<Interlocutor> contacts, bool isLoading, AppErrorViewModel? loadError
});




}
/// @nodoc
class __$NestedContactsStateCopyWithImpl<$Res>
    implements _$NestedContactsStateCopyWith<$Res> {
  __$NestedContactsStateCopyWithImpl(this._self, this._then);

  final _NestedContactsState _self;
  final $Res Function(_NestedContactsState) _then;

/// Create a copy of NestedContactsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? anchorUserId = null,Object? anchorDisplayName = null,Object? isFriendsOfRelative = null,Object? contacts = null,Object? isLoading = null,Object? loadError = freezed,}) {
  return _then(_NestedContactsState(
anchorUserId: null == anchorUserId ? _self.anchorUserId : anchorUserId // ignore: cast_nullable_to_non_nullable
as String,anchorDisplayName: null == anchorDisplayName ? _self.anchorDisplayName : anchorDisplayName // ignore: cast_nullable_to_non_nullable
as String,isFriendsOfRelative: null == isFriendsOfRelative ? _self.isFriendsOfRelative : isFriendsOfRelative // ignore: cast_nullable_to_non_nullable
as bool,contacts: null == contacts ? _self._contacts : contacts // ignore: cast_nullable_to_non_nullable
as List<Interlocutor>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,loadError: freezed == loadError ? _self.loadError : loadError // ignore: cast_nullable_to_non_nullable
as AppErrorViewModel?,
  ));
}


}

// dart format on

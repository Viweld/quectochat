// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _EventOnInitializationRequested value)?  onInitializationRequested,TResult Function( _EventOnFetchRequested value)?  onFetchRequested,TResult Function( _EventOnSearchRequested value)?  onSearchRequested,TResult Function( _EventOnSearchFieldClearTapped value)?  onSearchFieldClearTapped,TResult Function( _EventOnNextPageRequested value)?  onNextPageRequested,TResult Function( _EventOnSearchTextChanged value)?  onSearchTextChanged,TResult Function( _EventOnLogoutTapped value)?  onLogoutTapped,TResult Function( _EventOnClearChatRequested value)?  onClearChatRequested,TResult Function( _EventOnInterlocutorsStreamUpdated value)?  onInterlocutorsStreamUpdated,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case _EventOnFetchRequested() when onFetchRequested != null:
return onFetchRequested(_that);case _EventOnSearchRequested() when onSearchRequested != null:
return onSearchRequested(_that);case _EventOnSearchFieldClearTapped() when onSearchFieldClearTapped != null:
return onSearchFieldClearTapped(_that);case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested(_that);case _EventOnSearchTextChanged() when onSearchTextChanged != null:
return onSearchTextChanged(_that);case _EventOnLogoutTapped() when onLogoutTapped != null:
return onLogoutTapped(_that);case _EventOnClearChatRequested() when onClearChatRequested != null:
return onClearChatRequested(_that);case _EventOnInterlocutorsStreamUpdated() when onInterlocutorsStreamUpdated != null:
return onInterlocutorsStreamUpdated(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _EventOnInitializationRequested value)  onInitializationRequested,required TResult Function( _EventOnFetchRequested value)  onFetchRequested,required TResult Function( _EventOnSearchRequested value)  onSearchRequested,required TResult Function( _EventOnSearchFieldClearTapped value)  onSearchFieldClearTapped,required TResult Function( _EventOnNextPageRequested value)  onNextPageRequested,required TResult Function( _EventOnSearchTextChanged value)  onSearchTextChanged,required TResult Function( _EventOnLogoutTapped value)  onLogoutTapped,required TResult Function( _EventOnClearChatRequested value)  onClearChatRequested,required TResult Function( _EventOnInterlocutorsStreamUpdated value)  onInterlocutorsStreamUpdated,}){
final _that = this;
switch (_that) {
case _EventOnInitializationRequested():
return onInitializationRequested(_that);case _EventOnFetchRequested():
return onFetchRequested(_that);case _EventOnSearchRequested():
return onSearchRequested(_that);case _EventOnSearchFieldClearTapped():
return onSearchFieldClearTapped(_that);case _EventOnNextPageRequested():
return onNextPageRequested(_that);case _EventOnSearchTextChanged():
return onSearchTextChanged(_that);case _EventOnLogoutTapped():
return onLogoutTapped(_that);case _EventOnClearChatRequested():
return onClearChatRequested(_that);case _EventOnInterlocutorsStreamUpdated():
return onInterlocutorsStreamUpdated(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _EventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( _EventOnFetchRequested value)?  onFetchRequested,TResult? Function( _EventOnSearchRequested value)?  onSearchRequested,TResult? Function( _EventOnSearchFieldClearTapped value)?  onSearchFieldClearTapped,TResult? Function( _EventOnNextPageRequested value)?  onNextPageRequested,TResult? Function( _EventOnSearchTextChanged value)?  onSearchTextChanged,TResult? Function( _EventOnLogoutTapped value)?  onLogoutTapped,TResult? Function( _EventOnClearChatRequested value)?  onClearChatRequested,TResult? Function( _EventOnInterlocutorsStreamUpdated value)?  onInterlocutorsStreamUpdated,}){
final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case _EventOnFetchRequested() when onFetchRequested != null:
return onFetchRequested(_that);case _EventOnSearchRequested() when onSearchRequested != null:
return onSearchRequested(_that);case _EventOnSearchFieldClearTapped() when onSearchFieldClearTapped != null:
return onSearchFieldClearTapped(_that);case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested(_that);case _EventOnSearchTextChanged() when onSearchTextChanged != null:
return onSearchTextChanged(_that);case _EventOnLogoutTapped() when onLogoutTapped != null:
return onLogoutTapped(_that);case _EventOnClearChatRequested() when onClearChatRequested != null:
return onClearChatRequested(_that);case _EventOnInterlocutorsStreamUpdated() when onInterlocutorsStreamUpdated != null:
return onInterlocutorsStreamUpdated(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function()?  onFetchRequested,TResult Function()?  onSearchRequested,TResult Function()?  onSearchFieldClearTapped,TResult Function()?  onNextPageRequested,TResult Function( String val)?  onSearchTextChanged,TResult Function()?  onLogoutTapped,TResult Function( String interlocutorId)?  onClearChatRequested,TResult Function( Set<Interlocutor> updated)?  onInterlocutorsStreamUpdated,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case _EventOnFetchRequested() when onFetchRequested != null:
return onFetchRequested();case _EventOnSearchRequested() when onSearchRequested != null:
return onSearchRequested();case _EventOnSearchFieldClearTapped() when onSearchFieldClearTapped != null:
return onSearchFieldClearTapped();case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested();case _EventOnSearchTextChanged() when onSearchTextChanged != null:
return onSearchTextChanged(_that.val);case _EventOnLogoutTapped() when onLogoutTapped != null:
return onLogoutTapped();case _EventOnClearChatRequested() when onClearChatRequested != null:
return onClearChatRequested(_that.interlocutorId);case _EventOnInterlocutorsStreamUpdated() when onInterlocutorsStreamUpdated != null:
return onInterlocutorsStreamUpdated(_that.updated);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function()  onFetchRequested,required TResult Function()  onSearchRequested,required TResult Function()  onSearchFieldClearTapped,required TResult Function()  onNextPageRequested,required TResult Function( String val)  onSearchTextChanged,required TResult Function()  onLogoutTapped,required TResult Function( String interlocutorId)  onClearChatRequested,required TResult Function( Set<Interlocutor> updated)  onInterlocutorsStreamUpdated,}) {final _that = this;
switch (_that) {
case _EventOnInitializationRequested():
return onInitializationRequested();case _EventOnFetchRequested():
return onFetchRequested();case _EventOnSearchRequested():
return onSearchRequested();case _EventOnSearchFieldClearTapped():
return onSearchFieldClearTapped();case _EventOnNextPageRequested():
return onNextPageRequested();case _EventOnSearchTextChanged():
return onSearchTextChanged(_that.val);case _EventOnLogoutTapped():
return onLogoutTapped();case _EventOnClearChatRequested():
return onClearChatRequested(_that.interlocutorId);case _EventOnInterlocutorsStreamUpdated():
return onInterlocutorsStreamUpdated(_that.updated);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function()?  onFetchRequested,TResult? Function()?  onSearchRequested,TResult? Function()?  onSearchFieldClearTapped,TResult? Function()?  onNextPageRequested,TResult? Function( String val)?  onSearchTextChanged,TResult? Function()?  onLogoutTapped,TResult? Function( String interlocutorId)?  onClearChatRequested,TResult? Function( Set<Interlocutor> updated)?  onInterlocutorsStreamUpdated,}) {final _that = this;
switch (_that) {
case _EventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case _EventOnFetchRequested() when onFetchRequested != null:
return onFetchRequested();case _EventOnSearchRequested() when onSearchRequested != null:
return onSearchRequested();case _EventOnSearchFieldClearTapped() when onSearchFieldClearTapped != null:
return onSearchFieldClearTapped();case _EventOnNextPageRequested() when onNextPageRequested != null:
return onNextPageRequested();case _EventOnSearchTextChanged() when onSearchTextChanged != null:
return onSearchTextChanged(_that.val);case _EventOnLogoutTapped() when onLogoutTapped != null:
return onLogoutTapped();case _EventOnClearChatRequested() when onClearChatRequested != null:
return onClearChatRequested(_that.interlocutorId);case _EventOnInterlocutorsStreamUpdated() when onInterlocutorsStreamUpdated != null:
return onInterlocutorsStreamUpdated(_that.updated);case _:
  return null;

}
}

}

/// @nodoc


class _EventOnInitializationRequested implements HomeEvent {
  const _EventOnInitializationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnInitializationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onInitializationRequested()';
}


}




/// @nodoc


class _EventOnFetchRequested implements HomeEvent {
  const _EventOnFetchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnFetchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onFetchRequested()';
}


}




/// @nodoc


class _EventOnSearchRequested implements HomeEvent {
  const _EventOnSearchRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnSearchRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onSearchRequested()';
}


}




/// @nodoc


class _EventOnSearchFieldClearTapped implements HomeEvent {
  const _EventOnSearchFieldClearTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnSearchFieldClearTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onSearchFieldClearTapped()';
}


}




/// @nodoc


class _EventOnNextPageRequested implements HomeEvent {
  const _EventOnNextPageRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnNextPageRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onNextPageRequested()';
}


}




/// @nodoc


class _EventOnSearchTextChanged implements HomeEvent {
  const _EventOnSearchTextChanged(this.val);
  

 final  String val;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnSearchTextChangedCopyWith<_EventOnSearchTextChanged> get copyWith => __$EventOnSearchTextChangedCopyWithImpl<_EventOnSearchTextChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnSearchTextChanged&&(identical(other.val, val) || other.val == val));
}


@override
int get hashCode => Object.hash(runtimeType,val);

@override
String toString() {
  return 'HomeEvent.onSearchTextChanged(val: $val)';
}


}

/// @nodoc
abstract mixin class _$EventOnSearchTextChangedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$EventOnSearchTextChangedCopyWith(_EventOnSearchTextChanged value, $Res Function(_EventOnSearchTextChanged) _then) = __$EventOnSearchTextChangedCopyWithImpl;
@useResult
$Res call({
 String val
});




}
/// @nodoc
class __$EventOnSearchTextChangedCopyWithImpl<$Res>
    implements _$EventOnSearchTextChangedCopyWith<$Res> {
  __$EventOnSearchTextChangedCopyWithImpl(this._self, this._then);

  final _EventOnSearchTextChanged _self;
  final $Res Function(_EventOnSearchTextChanged) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? val = null,}) {
  return _then(_EventOnSearchTextChanged(
null == val ? _self.val : val // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventOnLogoutTapped implements HomeEvent {
  const _EventOnLogoutTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnLogoutTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onLogoutTapped()';
}


}




/// @nodoc


class _EventOnClearChatRequested implements HomeEvent {
  const _EventOnClearChatRequested({required this.interlocutorId});
  

 final  String interlocutorId;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnClearChatRequestedCopyWith<_EventOnClearChatRequested> get copyWith => __$EventOnClearChatRequestedCopyWithImpl<_EventOnClearChatRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnClearChatRequested&&(identical(other.interlocutorId, interlocutorId) || other.interlocutorId == interlocutorId));
}


@override
int get hashCode => Object.hash(runtimeType,interlocutorId);

@override
String toString() {
  return 'HomeEvent.onClearChatRequested(interlocutorId: $interlocutorId)';
}


}

/// @nodoc
abstract mixin class _$EventOnClearChatRequestedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$EventOnClearChatRequestedCopyWith(_EventOnClearChatRequested value, $Res Function(_EventOnClearChatRequested) _then) = __$EventOnClearChatRequestedCopyWithImpl;
@useResult
$Res call({
 String interlocutorId
});




}
/// @nodoc
class __$EventOnClearChatRequestedCopyWithImpl<$Res>
    implements _$EventOnClearChatRequestedCopyWith<$Res> {
  __$EventOnClearChatRequestedCopyWithImpl(this._self, this._then);

  final _EventOnClearChatRequested _self;
  final $Res Function(_EventOnClearChatRequested) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? interlocutorId = null,}) {
  return _then(_EventOnClearChatRequested(
interlocutorId: null == interlocutorId ? _self.interlocutorId : interlocutorId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _EventOnInterlocutorsStreamUpdated implements HomeEvent {
  const _EventOnInterlocutorsStreamUpdated({required final  Set<Interlocutor> updated}): _updated = updated;
  

 final  Set<Interlocutor> _updated;
 Set<Interlocutor> get updated {
  if (_updated is EqualUnmodifiableSetView) return _updated;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_updated);
}


/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EventOnInterlocutorsStreamUpdatedCopyWith<_EventOnInterlocutorsStreamUpdated> get copyWith => __$EventOnInterlocutorsStreamUpdatedCopyWithImpl<_EventOnInterlocutorsStreamUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EventOnInterlocutorsStreamUpdated&&const DeepCollectionEquality().equals(other._updated, _updated));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_updated));

@override
String toString() {
  return 'HomeEvent.onInterlocutorsStreamUpdated(updated: $updated)';
}


}

/// @nodoc
abstract mixin class _$EventOnInterlocutorsStreamUpdatedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$EventOnInterlocutorsStreamUpdatedCopyWith(_EventOnInterlocutorsStreamUpdated value, $Res Function(_EventOnInterlocutorsStreamUpdated) _then) = __$EventOnInterlocutorsStreamUpdatedCopyWithImpl;
@useResult
$Res call({
 Set<Interlocutor> updated
});




}
/// @nodoc
class __$EventOnInterlocutorsStreamUpdatedCopyWithImpl<$Res>
    implements _$EventOnInterlocutorsStreamUpdatedCopyWith<$Res> {
  __$EventOnInterlocutorsStreamUpdatedCopyWithImpl(this._self, this._then);

  final _EventOnInterlocutorsStreamUpdated _self;
  final $Res Function(_EventOnInterlocutorsStreamUpdated) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updated = null,}) {
  return _then(_EventOnInterlocutorsStreamUpdated(
updated: null == updated ? _self._updated : updated // ignore: cast_nullable_to_non_nullable
as Set<Interlocutor>,
  ));
}


}

/// @nodoc
mixin _$HomeState {

 Iterable<Interlocutor> get interlocutors; bool get hasNext; bool get isFirstLoading; bool get isNextLoading; bool get isLogoutLoading; bool get isSearchMode; String get searchText; int get searchId;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&const DeepCollectionEquality().equals(other.interlocutors, interlocutors)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.isFirstLoading, isFirstLoading) || other.isFirstLoading == isFirstLoading)&&(identical(other.isNextLoading, isNextLoading) || other.isNextLoading == isNextLoading)&&(identical(other.isLogoutLoading, isLogoutLoading) || other.isLogoutLoading == isLogoutLoading)&&(identical(other.isSearchMode, isSearchMode) || other.isSearchMode == isSearchMode)&&(identical(other.searchText, searchText) || other.searchText == searchText)&&(identical(other.searchId, searchId) || other.searchId == searchId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(interlocutors),hasNext,isFirstLoading,isNextLoading,isLogoutLoading,isSearchMode,searchText,searchId);

@override
String toString() {
  return 'HomeState(interlocutors: $interlocutors, hasNext: $hasNext, isFirstLoading: $isFirstLoading, isNextLoading: $isNextLoading, isLogoutLoading: $isLogoutLoading, isSearchMode: $isSearchMode, searchText: $searchText, searchId: $searchId)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 Iterable<Interlocutor> interlocutors, bool hasNext, bool isFirstLoading, bool isNextLoading, bool isLogoutLoading, bool isSearchMode, String searchText, int searchId
});




}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? interlocutors = null,Object? hasNext = null,Object? isFirstLoading = null,Object? isNextLoading = null,Object? isLogoutLoading = null,Object? isSearchMode = null,Object? searchText = null,Object? searchId = null,}) {
  return _then(_self.copyWith(
interlocutors: null == interlocutors ? _self.interlocutors : interlocutors // ignore: cast_nullable_to_non_nullable
as Iterable<Interlocutor>,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,isFirstLoading: null == isFirstLoading ? _self.isFirstLoading : isFirstLoading // ignore: cast_nullable_to_non_nullable
as bool,isNextLoading: null == isNextLoading ? _self.isNextLoading : isNextLoading // ignore: cast_nullable_to_non_nullable
as bool,isLogoutLoading: null == isLogoutLoading ? _self.isLogoutLoading : isLogoutLoading // ignore: cast_nullable_to_non_nullable
as bool,isSearchMode: null == isSearchMode ? _self.isSearchMode : isSearchMode // ignore: cast_nullable_to_non_nullable
as bool,searchText: null == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String,searchId: null == searchId ? _self.searchId : searchId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Iterable<Interlocutor> interlocutors,  bool hasNext,  bool isFirstLoading,  bool isNextLoading,  bool isLogoutLoading,  bool isSearchMode,  String searchText,  int searchId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.interlocutors,_that.hasNext,_that.isFirstLoading,_that.isNextLoading,_that.isLogoutLoading,_that.isSearchMode,_that.searchText,_that.searchId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Iterable<Interlocutor> interlocutors,  bool hasNext,  bool isFirstLoading,  bool isNextLoading,  bool isLogoutLoading,  bool isSearchMode,  String searchText,  int searchId)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.interlocutors,_that.hasNext,_that.isFirstLoading,_that.isNextLoading,_that.isLogoutLoading,_that.isSearchMode,_that.searchText,_that.searchId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Iterable<Interlocutor> interlocutors,  bool hasNext,  bool isFirstLoading,  bool isNextLoading,  bool isLogoutLoading,  bool isSearchMode,  String searchText,  int searchId)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.interlocutors,_that.hasNext,_that.isFirstLoading,_that.isNextLoading,_that.isLogoutLoading,_that.isSearchMode,_that.searchText,_that.searchId);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState implements HomeState {
  const _HomeState({this.interlocutors = const [], this.hasNext = true, this.isFirstLoading = true, this.isNextLoading = false, this.isLogoutLoading = false, this.isSearchMode = false, this.searchText = '', this.searchId = 0});
  

@override@JsonKey() final  Iterable<Interlocutor> interlocutors;
@override@JsonKey() final  bool hasNext;
@override@JsonKey() final  bool isFirstLoading;
@override@JsonKey() final  bool isNextLoading;
@override@JsonKey() final  bool isLogoutLoading;
@override@JsonKey() final  bool isSearchMode;
@override@JsonKey() final  String searchText;
@override@JsonKey() final  int searchId;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&const DeepCollectionEquality().equals(other.interlocutors, interlocutors)&&(identical(other.hasNext, hasNext) || other.hasNext == hasNext)&&(identical(other.isFirstLoading, isFirstLoading) || other.isFirstLoading == isFirstLoading)&&(identical(other.isNextLoading, isNextLoading) || other.isNextLoading == isNextLoading)&&(identical(other.isLogoutLoading, isLogoutLoading) || other.isLogoutLoading == isLogoutLoading)&&(identical(other.isSearchMode, isSearchMode) || other.isSearchMode == isSearchMode)&&(identical(other.searchText, searchText) || other.searchText == searchText)&&(identical(other.searchId, searchId) || other.searchId == searchId));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(interlocutors),hasNext,isFirstLoading,isNextLoading,isLogoutLoading,isSearchMode,searchText,searchId);

@override
String toString() {
  return 'HomeState(interlocutors: $interlocutors, hasNext: $hasNext, isFirstLoading: $isFirstLoading, isNextLoading: $isNextLoading, isLogoutLoading: $isLogoutLoading, isSearchMode: $isSearchMode, searchText: $searchText, searchId: $searchId)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 Iterable<Interlocutor> interlocutors, bool hasNext, bool isFirstLoading, bool isNextLoading, bool isLogoutLoading, bool isSearchMode, String searchText, int searchId
});




}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? interlocutors = null,Object? hasNext = null,Object? isFirstLoading = null,Object? isNextLoading = null,Object? isLogoutLoading = null,Object? isSearchMode = null,Object? searchText = null,Object? searchId = null,}) {
  return _then(_HomeState(
interlocutors: null == interlocutors ? _self.interlocutors : interlocutors // ignore: cast_nullable_to_non_nullable
as Iterable<Interlocutor>,hasNext: null == hasNext ? _self.hasNext : hasNext // ignore: cast_nullable_to_non_nullable
as bool,isFirstLoading: null == isFirstLoading ? _self.isFirstLoading : isFirstLoading // ignore: cast_nullable_to_non_nullable
as bool,isNextLoading: null == isNextLoading ? _self.isNextLoading : isNextLoading // ignore: cast_nullable_to_non_nullable
as bool,isLogoutLoading: null == isLogoutLoading ? _self.isLogoutLoading : isLogoutLoading // ignore: cast_nullable_to_non_nullable
as bool,isSearchMode: null == isSearchMode ? _self.isSearchMode : isSearchMode // ignore: cast_nullable_to_non_nullable
as bool,searchText: null == searchText ? _self.searchText : searchText // ignore: cast_nullable_to_non_nullable
as String,searchId: null == searchId ? _self.searchId : searchId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on

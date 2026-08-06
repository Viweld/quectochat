// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_invitation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CreateInvitationEffect {

 AppErrorKind get kind;
/// Create a copy of CreateInvitationEffect
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateInvitationEffectCopyWith<CreateInvitationEffect> get copyWith => _$CreateInvitationEffectCopyWithImpl<CreateInvitationEffect>(this as CreateInvitationEffect, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvitationEffect&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'CreateInvitationEffect(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $CreateInvitationEffectCopyWith<$Res>  {
  factory $CreateInvitationEffectCopyWith(CreateInvitationEffect value, $Res Function(CreateInvitationEffect) _then) = _$CreateInvitationEffectCopyWithImpl;
@useResult
$Res call({
 AppErrorKind kind
});




}
/// @nodoc
class _$CreateInvitationEffectCopyWithImpl<$Res>
    implements $CreateInvitationEffectCopyWith<$Res> {
  _$CreateInvitationEffectCopyWithImpl(this._self, this._then);

  final CreateInvitationEffect _self;
  final $Res Function(CreateInvitationEffect) _then;

/// Create a copy of CreateInvitationEffect
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? kind = null,}) {
  return _then(_self.copyWith(
kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateInvitationEffect].
extension CreateInvitationEffectPatterns on CreateInvitationEffect {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateInvitationShowErrorEffect value)?  showError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateInvitationShowErrorEffect() when showError != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateInvitationShowErrorEffect value)  showError,}){
final _that = this;
switch (_that) {
case CreateInvitationShowErrorEffect():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateInvitationShowErrorEffect value)?  showError,}){
final _that = this;
switch (_that) {
case CreateInvitationShowErrorEffect() when showError != null:
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
case CreateInvitationShowErrorEffect() when showError != null:
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
case CreateInvitationShowErrorEffect():
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
case CreateInvitationShowErrorEffect() when showError != null:
return showError(_that.kind);case _:
  return null;

}
}

}

/// @nodoc


class CreateInvitationShowErrorEffect implements CreateInvitationEffect {
  const CreateInvitationShowErrorEffect(this.kind);
  

@override final  AppErrorKind kind;

/// Create a copy of CreateInvitationEffect
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateInvitationShowErrorEffectCopyWith<CreateInvitationShowErrorEffect> get copyWith => _$CreateInvitationShowErrorEffectCopyWithImpl<CreateInvitationShowErrorEffect>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvitationShowErrorEffect&&(identical(other.kind, kind) || other.kind == kind));
}


@override
int get hashCode => Object.hash(runtimeType,kind);

@override
String toString() {
  return 'CreateInvitationEffect.showError(kind: $kind)';
}


}

/// @nodoc
abstract mixin class $CreateInvitationShowErrorEffectCopyWith<$Res> implements $CreateInvitationEffectCopyWith<$Res> {
  factory $CreateInvitationShowErrorEffectCopyWith(CreateInvitationShowErrorEffect value, $Res Function(CreateInvitationShowErrorEffect) _then) = _$CreateInvitationShowErrorEffectCopyWithImpl;
@override @useResult
$Res call({
 AppErrorKind kind
});




}
/// @nodoc
class _$CreateInvitationShowErrorEffectCopyWithImpl<$Res>
    implements $CreateInvitationShowErrorEffectCopyWith<$Res> {
  _$CreateInvitationShowErrorEffectCopyWithImpl(this._self, this._then);

  final CreateInvitationShowErrorEffect _self;
  final $Res Function(CreateInvitationShowErrorEffect) _then;

/// Create a copy of CreateInvitationEffect
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? kind = null,}) {
  return _then(CreateInvitationShowErrorEffect(
null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as AppErrorKind,
  ));
}


}

/// @nodoc
mixin _$CreateInvitationEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvitationEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateInvitationEvent()';
}


}

/// @nodoc
class $CreateInvitationEventCopyWith<$Res>  {
$CreateInvitationEventCopyWith(CreateInvitationEvent _, $Res Function(CreateInvitationEvent) __);
}


/// Adds pattern-matching-related methods to [CreateInvitationEvent].
extension CreateInvitationEventPatterns on CreateInvitationEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateInvitationInit value)?  init,TResult Function( CreateInvitationEffectHandled value)?  effectHandled,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateInvitationInit() when init != null:
return init(_that);case CreateInvitationEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateInvitationInit value)  init,required TResult Function( CreateInvitationEffectHandled value)  effectHandled,}){
final _that = this;
switch (_that) {
case CreateInvitationInit():
return init(_that);case CreateInvitationEffectHandled():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateInvitationInit value)?  init,TResult? Function( CreateInvitationEffectHandled value)?  effectHandled,}){
final _that = this;
switch (_that) {
case CreateInvitationInit() when init != null:
return init(_that);case CreateInvitationEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  init,TResult Function()?  effectHandled,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateInvitationInit() when init != null:
return init();case CreateInvitationEffectHandled() when effectHandled != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  init,required TResult Function()  effectHandled,}) {final _that = this;
switch (_that) {
case CreateInvitationInit():
return init();case CreateInvitationEffectHandled():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  init,TResult? Function()?  effectHandled,}) {final _that = this;
switch (_that) {
case CreateInvitationInit() when init != null:
return init();case CreateInvitationEffectHandled() when effectHandled != null:
return effectHandled();case _:
  return null;

}
}

}

/// @nodoc


class CreateInvitationInit implements CreateInvitationEvent {
  const CreateInvitationInit();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvitationInit);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateInvitationEvent.init()';
}


}




/// @nodoc


class CreateInvitationEffectHandled implements CreateInvitationEvent {
  const CreateInvitationEffectHandled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvitationEffectHandled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CreateInvitationEvent.effectHandled()';
}


}




/// @nodoc
mixin _$CreateInvitationState {

 String get targetRole; CreatedInvitation? get invitation; bool get isLoading; CreateInvitationEffect? get effect;
/// Create a copy of CreateInvitationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateInvitationStateCopyWith<CreateInvitationState> get copyWith => _$CreateInvitationStateCopyWithImpl<CreateInvitationState>(this as CreateInvitationState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateInvitationState&&(identical(other.targetRole, targetRole) || other.targetRole == targetRole)&&(identical(other.invitation, invitation) || other.invitation == invitation)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,targetRole,invitation,isLoading,effect);

@override
String toString() {
  return 'CreateInvitationState(targetRole: $targetRole, invitation: $invitation, isLoading: $isLoading, effect: $effect)';
}


}

/// @nodoc
abstract mixin class $CreateInvitationStateCopyWith<$Res>  {
  factory $CreateInvitationStateCopyWith(CreateInvitationState value, $Res Function(CreateInvitationState) _then) = _$CreateInvitationStateCopyWithImpl;
@useResult
$Res call({
 String targetRole, CreatedInvitation? invitation, bool isLoading, CreateInvitationEffect? effect
});


$CreateInvitationEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class _$CreateInvitationStateCopyWithImpl<$Res>
    implements $CreateInvitationStateCopyWith<$Res> {
  _$CreateInvitationStateCopyWithImpl(this._self, this._then);

  final CreateInvitationState _self;
  final $Res Function(CreateInvitationState) _then;

/// Create a copy of CreateInvitationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? targetRole = null,Object? invitation = freezed,Object? isLoading = null,Object? effect = freezed,}) {
  return _then(_self.copyWith(
targetRole: null == targetRole ? _self.targetRole : targetRole // ignore: cast_nullable_to_non_nullable
as String,invitation: freezed == invitation ? _self.invitation : invitation // ignore: cast_nullable_to_non_nullable
as CreatedInvitation?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as CreateInvitationEffect?,
  ));
}
/// Create a copy of CreateInvitationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateInvitationEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $CreateInvitationEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateInvitationState].
extension CreateInvitationStatePatterns on CreateInvitationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreateInvitationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreateInvitationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreateInvitationState value)  $default,){
final _that = this;
switch (_that) {
case _CreateInvitationState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreateInvitationState value)?  $default,){
final _that = this;
switch (_that) {
case _CreateInvitationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String targetRole,  CreatedInvitation? invitation,  bool isLoading,  CreateInvitationEffect? effect)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreateInvitationState() when $default != null:
return $default(_that.targetRole,_that.invitation,_that.isLoading,_that.effect);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String targetRole,  CreatedInvitation? invitation,  bool isLoading,  CreateInvitationEffect? effect)  $default,) {final _that = this;
switch (_that) {
case _CreateInvitationState():
return $default(_that.targetRole,_that.invitation,_that.isLoading,_that.effect);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String targetRole,  CreatedInvitation? invitation,  bool isLoading,  CreateInvitationEffect? effect)?  $default,) {final _that = this;
switch (_that) {
case _CreateInvitationState() when $default != null:
return $default(_that.targetRole,_that.invitation,_that.isLoading,_that.effect);case _:
  return null;

}
}

}

/// @nodoc


class _CreateInvitationState implements CreateInvitationState {
  const _CreateInvitationState({required this.targetRole, this.invitation, this.isLoading = false, this.effect});
  

@override final  String targetRole;
@override final  CreatedInvitation? invitation;
@override@JsonKey() final  bool isLoading;
@override final  CreateInvitationEffect? effect;

/// Create a copy of CreateInvitationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreateInvitationStateCopyWith<_CreateInvitationState> get copyWith => __$CreateInvitationStateCopyWithImpl<_CreateInvitationState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreateInvitationState&&(identical(other.targetRole, targetRole) || other.targetRole == targetRole)&&(identical(other.invitation, invitation) || other.invitation == invitation)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.effect, effect) || other.effect == effect));
}


@override
int get hashCode => Object.hash(runtimeType,targetRole,invitation,isLoading,effect);

@override
String toString() {
  return 'CreateInvitationState(targetRole: $targetRole, invitation: $invitation, isLoading: $isLoading, effect: $effect)';
}


}

/// @nodoc
abstract mixin class _$CreateInvitationStateCopyWith<$Res> implements $CreateInvitationStateCopyWith<$Res> {
  factory _$CreateInvitationStateCopyWith(_CreateInvitationState value, $Res Function(_CreateInvitationState) _then) = __$CreateInvitationStateCopyWithImpl;
@override @useResult
$Res call({
 String targetRole, CreatedInvitation? invitation, bool isLoading, CreateInvitationEffect? effect
});


@override $CreateInvitationEffectCopyWith<$Res>? get effect;

}
/// @nodoc
class __$CreateInvitationStateCopyWithImpl<$Res>
    implements _$CreateInvitationStateCopyWith<$Res> {
  __$CreateInvitationStateCopyWithImpl(this._self, this._then);

  final _CreateInvitationState _self;
  final $Res Function(_CreateInvitationState) _then;

/// Create a copy of CreateInvitationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? targetRole = null,Object? invitation = freezed,Object? isLoading = null,Object? effect = freezed,}) {
  return _then(_CreateInvitationState(
targetRole: null == targetRole ? _self.targetRole : targetRole // ignore: cast_nullable_to_non_nullable
as String,invitation: freezed == invitation ? _self.invitation : invitation // ignore: cast_nullable_to_non_nullable
as CreatedInvitation?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,effect: freezed == effect ? _self.effect : effect // ignore: cast_nullable_to_non_nullable
as CreateInvitationEffect?,
  ));
}

/// Create a copy of CreateInvitationState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CreateInvitationEffectCopyWith<$Res>? get effect {
    if (_self.effect == null) {
    return null;
  }

  return $CreateInvitationEffectCopyWith<$Res>(_self.effect!, (value) {
    return _then(_self.copyWith(effect: value));
  });
}
}

// dart format on

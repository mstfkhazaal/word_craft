// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'application_start_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApplicationStartState {

 bool get isLoadingLanguage; bool get isFirstTime; bool get isSetupComplete; ThemeMode get themeMode; String? get locale; ApplicationStartupStatus get startupStatus; String? get startupError;
/// Create a copy of ApplicationStartState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApplicationStartStateCopyWith<ApplicationStartState> get copyWith => _$ApplicationStartStateCopyWithImpl<ApplicationStartState>(this as ApplicationStartState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApplicationStartState&&(identical(other.isLoadingLanguage, isLoadingLanguage) || other.isLoadingLanguage == isLoadingLanguage)&&(identical(other.isFirstTime, isFirstTime) || other.isFirstTime == isFirstTime)&&(identical(other.isSetupComplete, isSetupComplete) || other.isSetupComplete == isSetupComplete)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.startupStatus, startupStatus) || other.startupStatus == startupStatus)&&(identical(other.startupError, startupError) || other.startupError == startupError));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingLanguage,isFirstTime,isSetupComplete,themeMode,locale,startupStatus,startupError);

@override
String toString() {
  return 'ApplicationStartState(isLoadingLanguage: $isLoadingLanguage, isFirstTime: $isFirstTime, isSetupComplete: $isSetupComplete, themeMode: $themeMode, locale: $locale, startupStatus: $startupStatus, startupError: $startupError)';
}


}

/// @nodoc
abstract mixin class $ApplicationStartStateCopyWith<$Res>  {
  factory $ApplicationStartStateCopyWith(ApplicationStartState value, $Res Function(ApplicationStartState) _then) = _$ApplicationStartStateCopyWithImpl;
@useResult
$Res call({
 bool isLoadingLanguage, bool isFirstTime, bool isSetupComplete, ThemeMode themeMode, String? locale, ApplicationStartupStatus startupStatus, String? startupError
});




}
/// @nodoc
class _$ApplicationStartStateCopyWithImpl<$Res>
    implements $ApplicationStartStateCopyWith<$Res> {
  _$ApplicationStartStateCopyWithImpl(this._self, this._then);

  final ApplicationStartState _self;
  final $Res Function(ApplicationStartState) _then;

/// Create a copy of ApplicationStartState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoadingLanguage = null,Object? isFirstTime = null,Object? isSetupComplete = null,Object? themeMode = null,Object? locale = freezed,Object? startupStatus = null,Object? startupError = freezed,}) {
  return _then(_self.copyWith(
isLoadingLanguage: null == isLoadingLanguage ? _self.isLoadingLanguage : isLoadingLanguage // ignore: cast_nullable_to_non_nullable
as bool,isFirstTime: null == isFirstTime ? _self.isFirstTime : isFirstTime // ignore: cast_nullable_to_non_nullable
as bool,isSetupComplete: null == isSetupComplete ? _self.isSetupComplete : isSetupComplete // ignore: cast_nullable_to_non_nullable
as bool,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,startupStatus: null == startupStatus ? _self.startupStatus : startupStatus // ignore: cast_nullable_to_non_nullable
as ApplicationStartupStatus,startupError: freezed == startupError ? _self.startupError : startupError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ApplicationStartState].
extension ApplicationStartStatePatterns on ApplicationStartState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ApplicationStartState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ApplicationStartState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ApplicationStartState value)  $default,){
final _that = this;
switch (_that) {
case _ApplicationStartState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ApplicationStartState value)?  $default,){
final _that = this;
switch (_that) {
case _ApplicationStartState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoadingLanguage,  bool isFirstTime,  bool isSetupComplete,  ThemeMode themeMode,  String? locale,  ApplicationStartupStatus startupStatus,  String? startupError)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ApplicationStartState() when $default != null:
return $default(_that.isLoadingLanguage,_that.isFirstTime,_that.isSetupComplete,_that.themeMode,_that.locale,_that.startupStatus,_that.startupError);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoadingLanguage,  bool isFirstTime,  bool isSetupComplete,  ThemeMode themeMode,  String? locale,  ApplicationStartupStatus startupStatus,  String? startupError)  $default,) {final _that = this;
switch (_that) {
case _ApplicationStartState():
return $default(_that.isLoadingLanguage,_that.isFirstTime,_that.isSetupComplete,_that.themeMode,_that.locale,_that.startupStatus,_that.startupError);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoadingLanguage,  bool isFirstTime,  bool isSetupComplete,  ThemeMode themeMode,  String? locale,  ApplicationStartupStatus startupStatus,  String? startupError)?  $default,) {final _that = this;
switch (_that) {
case _ApplicationStartState() when $default != null:
return $default(_that.isLoadingLanguage,_that.isFirstTime,_that.isSetupComplete,_that.themeMode,_that.locale,_that.startupStatus,_that.startupError);case _:
  return null;

}
}

}

/// @nodoc


class _ApplicationStartState implements ApplicationStartState {
  const _ApplicationStartState({this.isLoadingLanguage = false, this.isFirstTime = false, this.isSetupComplete = false, this.themeMode = ThemeMode.system, this.locale, this.startupStatus = ApplicationStartupStatus.initial, this.startupError});
  

@override@JsonKey() final  bool isLoadingLanguage;
@override@JsonKey() final  bool isFirstTime;
@override@JsonKey() final  bool isSetupComplete;
@override@JsonKey() final  ThemeMode themeMode;
@override final  String? locale;
@override@JsonKey() final  ApplicationStartupStatus startupStatus;
@override final  String? startupError;

/// Create a copy of ApplicationStartState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApplicationStartStateCopyWith<_ApplicationStartState> get copyWith => __$ApplicationStartStateCopyWithImpl<_ApplicationStartState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApplicationStartState&&(identical(other.isLoadingLanguage, isLoadingLanguage) || other.isLoadingLanguage == isLoadingLanguage)&&(identical(other.isFirstTime, isFirstTime) || other.isFirstTime == isFirstTime)&&(identical(other.isSetupComplete, isSetupComplete) || other.isSetupComplete == isSetupComplete)&&(identical(other.themeMode, themeMode) || other.themeMode == themeMode)&&(identical(other.locale, locale) || other.locale == locale)&&(identical(other.startupStatus, startupStatus) || other.startupStatus == startupStatus)&&(identical(other.startupError, startupError) || other.startupError == startupError));
}


@override
int get hashCode => Object.hash(runtimeType,isLoadingLanguage,isFirstTime,isSetupComplete,themeMode,locale,startupStatus,startupError);

@override
String toString() {
  return 'ApplicationStartState(isLoadingLanguage: $isLoadingLanguage, isFirstTime: $isFirstTime, isSetupComplete: $isSetupComplete, themeMode: $themeMode, locale: $locale, startupStatus: $startupStatus, startupError: $startupError)';
}


}

/// @nodoc
abstract mixin class _$ApplicationStartStateCopyWith<$Res> implements $ApplicationStartStateCopyWith<$Res> {
  factory _$ApplicationStartStateCopyWith(_ApplicationStartState value, $Res Function(_ApplicationStartState) _then) = __$ApplicationStartStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoadingLanguage, bool isFirstTime, bool isSetupComplete, ThemeMode themeMode, String? locale, ApplicationStartupStatus startupStatus, String? startupError
});




}
/// @nodoc
class __$ApplicationStartStateCopyWithImpl<$Res>
    implements _$ApplicationStartStateCopyWith<$Res> {
  __$ApplicationStartStateCopyWithImpl(this._self, this._then);

  final _ApplicationStartState _self;
  final $Res Function(_ApplicationStartState) _then;

/// Create a copy of ApplicationStartState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoadingLanguage = null,Object? isFirstTime = null,Object? isSetupComplete = null,Object? themeMode = null,Object? locale = freezed,Object? startupStatus = null,Object? startupError = freezed,}) {
  return _then(_ApplicationStartState(
isLoadingLanguage: null == isLoadingLanguage ? _self.isLoadingLanguage : isLoadingLanguage // ignore: cast_nullable_to_non_nullable
as bool,isFirstTime: null == isFirstTime ? _self.isFirstTime : isFirstTime // ignore: cast_nullable_to_non_nullable
as bool,isSetupComplete: null == isSetupComplete ? _self.isSetupComplete : isSetupComplete // ignore: cast_nullable_to_non_nullable
as bool,themeMode: null == themeMode ? _self.themeMode : themeMode // ignore: cast_nullable_to_non_nullable
as ThemeMode,locale: freezed == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as String?,startupStatus: null == startupStatus ? _self.startupStatus : startupStatus // ignore: cast_nullable_to_non_nullable
as ApplicationStartupStatus,startupError: freezed == startupError ? _self.startupError : startupError // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on

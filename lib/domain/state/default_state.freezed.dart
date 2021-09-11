// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'default_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DefaultStateTearOff {
  const _$DefaultStateTearOff();

  DefaultStateInitial initial() {
    return const DefaultStateInitial();
  }

  DefaultStateLoading loading() {
    return const DefaultStateLoading();
  }

  DefaultStateLoaded loaded([dynamic object = null]) {
    return DefaultStateLoaded(
      object,
    );
  }

  DefaultStateError error(Exception error) {
    return DefaultStateError(
      error,
    );
  }
}

/// @nodoc
const $DefaultState = _$DefaultStateTearOff();

/// @nodoc
mixin _$DefaultState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic object) loaded,
    required TResult Function(Exception error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic object)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DefaultStateInitial value) initial,
    required TResult Function(DefaultStateLoading value) loading,
    required TResult Function(DefaultStateLoaded value) loaded,
    required TResult Function(DefaultStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DefaultStateInitial value)? initial,
    TResult Function(DefaultStateLoading value)? loading,
    TResult Function(DefaultStateLoaded value)? loaded,
    TResult Function(DefaultStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultStateCopyWith<$Res> {
  factory $DefaultStateCopyWith(
          DefaultState value, $Res Function(DefaultState) then) =
      _$DefaultStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$DefaultStateCopyWithImpl<$Res> implements $DefaultStateCopyWith<$Res> {
  _$DefaultStateCopyWithImpl(this._value, this._then);

  final DefaultState _value;
  // ignore: unused_field
  final $Res Function(DefaultState) _then;
}

/// @nodoc
abstract class $DefaultStateInitialCopyWith<$Res> {
  factory $DefaultStateInitialCopyWith(
          DefaultStateInitial value, $Res Function(DefaultStateInitial) then) =
      _$DefaultStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class _$DefaultStateInitialCopyWithImpl<$Res>
    extends _$DefaultStateCopyWithImpl<$Res>
    implements $DefaultStateInitialCopyWith<$Res> {
  _$DefaultStateInitialCopyWithImpl(
      DefaultStateInitial _value, $Res Function(DefaultStateInitial) _then)
      : super(_value, (v) => _then(v as DefaultStateInitial));

  @override
  DefaultStateInitial get _value => super._value as DefaultStateInitial;
}

/// @nodoc

class _$DefaultStateInitial implements DefaultStateInitial {
  const _$DefaultStateInitial();

  @override
  String toString() {
    return 'DefaultState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DefaultStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic object) loaded,
    required TResult Function(Exception error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic object)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DefaultStateInitial value) initial,
    required TResult Function(DefaultStateLoading value) loading,
    required TResult Function(DefaultStateLoaded value) loaded,
    required TResult Function(DefaultStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DefaultStateInitial value)? initial,
    TResult Function(DefaultStateLoading value)? loading,
    TResult Function(DefaultStateLoaded value)? loaded,
    TResult Function(DefaultStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class DefaultStateInitial implements DefaultState {
  const factory DefaultStateInitial() = _$DefaultStateInitial;
}

/// @nodoc
abstract class $DefaultStateLoadingCopyWith<$Res> {
  factory $DefaultStateLoadingCopyWith(
          DefaultStateLoading value, $Res Function(DefaultStateLoading) then) =
      _$DefaultStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$DefaultStateLoadingCopyWithImpl<$Res>
    extends _$DefaultStateCopyWithImpl<$Res>
    implements $DefaultStateLoadingCopyWith<$Res> {
  _$DefaultStateLoadingCopyWithImpl(
      DefaultStateLoading _value, $Res Function(DefaultStateLoading) _then)
      : super(_value, (v) => _then(v as DefaultStateLoading));

  @override
  DefaultStateLoading get _value => super._value as DefaultStateLoading;
}

/// @nodoc

class _$DefaultStateLoading implements DefaultStateLoading {
  const _$DefaultStateLoading();

  @override
  String toString() {
    return 'DefaultState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DefaultStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic object) loaded,
    required TResult Function(Exception error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic object)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DefaultStateInitial value) initial,
    required TResult Function(DefaultStateLoading value) loading,
    required TResult Function(DefaultStateLoaded value) loaded,
    required TResult Function(DefaultStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DefaultStateInitial value)? initial,
    TResult Function(DefaultStateLoading value)? loading,
    TResult Function(DefaultStateLoaded value)? loaded,
    TResult Function(DefaultStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DefaultStateLoading implements DefaultState {
  const factory DefaultStateLoading() = _$DefaultStateLoading;
}

/// @nodoc
abstract class $DefaultStateLoadedCopyWith<$Res> {
  factory $DefaultStateLoadedCopyWith(
          DefaultStateLoaded value, $Res Function(DefaultStateLoaded) then) =
      _$DefaultStateLoadedCopyWithImpl<$Res>;
  $Res call({dynamic object});
}

/// @nodoc
class _$DefaultStateLoadedCopyWithImpl<$Res>
    extends _$DefaultStateCopyWithImpl<$Res>
    implements $DefaultStateLoadedCopyWith<$Res> {
  _$DefaultStateLoadedCopyWithImpl(
      DefaultStateLoaded _value, $Res Function(DefaultStateLoaded) _then)
      : super(_value, (v) => _then(v as DefaultStateLoaded));

  @override
  DefaultStateLoaded get _value => super._value as DefaultStateLoaded;

  @override
  $Res call({
    Object? object = freezed,
  }) {
    return _then(DefaultStateLoaded(
      object == freezed
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$DefaultStateLoaded implements DefaultStateLoaded {
  const _$DefaultStateLoaded([this.object = null]);

  @JsonKey(defaultValue: null)
  @override
  final dynamic object;

  @override
  String toString() {
    return 'DefaultState.loaded(object: $object)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DefaultStateLoaded &&
            (identical(other.object, object) ||
                const DeepCollectionEquality().equals(other.object, object)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(object);

  @JsonKey(ignore: true)
  @override
  $DefaultStateLoadedCopyWith<DefaultStateLoaded> get copyWith =>
      _$DefaultStateLoadedCopyWithImpl<DefaultStateLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic object) loaded,
    required TResult Function(Exception error) error,
  }) {
    return loaded(object);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic object)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(object);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DefaultStateInitial value) initial,
    required TResult Function(DefaultStateLoading value) loading,
    required TResult Function(DefaultStateLoaded value) loaded,
    required TResult Function(DefaultStateError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DefaultStateInitial value)? initial,
    TResult Function(DefaultStateLoading value)? loading,
    TResult Function(DefaultStateLoaded value)? loaded,
    TResult Function(DefaultStateError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DefaultStateLoaded implements DefaultState {
  const factory DefaultStateLoaded([dynamic object]) = _$DefaultStateLoaded;

  dynamic get object => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultStateLoadedCopyWith<DefaultStateLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefaultStateErrorCopyWith<$Res> {
  factory $DefaultStateErrorCopyWith(
          DefaultStateError value, $Res Function(DefaultStateError) then) =
      _$DefaultStateErrorCopyWithImpl<$Res>;
  $Res call({Exception error});
}

/// @nodoc
class _$DefaultStateErrorCopyWithImpl<$Res>
    extends _$DefaultStateCopyWithImpl<$Res>
    implements $DefaultStateErrorCopyWith<$Res> {
  _$DefaultStateErrorCopyWithImpl(
      DefaultStateError _value, $Res Function(DefaultStateError) _then)
      : super(_value, (v) => _then(v as DefaultStateError));

  @override
  DefaultStateError get _value => super._value as DefaultStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(DefaultStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$DefaultStateError implements DefaultStateError {
  const _$DefaultStateError(this.error);

  @override
  final Exception error;

  @override
  String toString() {
    return 'DefaultState.error(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DefaultStateError &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(error);

  @JsonKey(ignore: true)
  @override
  $DefaultStateErrorCopyWith<DefaultStateError> get copyWith =>
      _$DefaultStateErrorCopyWithImpl<DefaultStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(dynamic object) loaded,
    required TResult Function(Exception error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(dynamic object)? loaded,
    TResult Function(Exception error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DefaultStateInitial value) initial,
    required TResult Function(DefaultStateLoading value) loading,
    required TResult Function(DefaultStateLoaded value) loaded,
    required TResult Function(DefaultStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DefaultStateInitial value)? initial,
    TResult Function(DefaultStateLoading value)? loading,
    TResult Function(DefaultStateLoaded value)? loaded,
    TResult Function(DefaultStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DefaultStateError implements DefaultState {
  const factory DefaultStateError(Exception error) = _$DefaultStateError;

  Exception get error => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DefaultStateErrorCopyWith<DefaultStateError> get copyWith =>
      throw _privateConstructorUsedError;
}

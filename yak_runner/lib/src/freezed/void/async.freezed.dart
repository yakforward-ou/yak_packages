// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'async.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TryAsyncTearOff {
  const _$TryAsyncTearOff();

// ignore: unused_element
  _TryAsyncLoading loading() {
    return const _TryAsyncLoading();
  }

// ignore: unused_element
  _TryAsyncSuccess success() {
    return const _TryAsyncSuccess();
  }

// ignore: unused_element
  _TryAsyncFailure failure(Object e, StackTrace s) {
    return _TryAsyncFailure(
      e,
      s,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TryAsync = _$TryAsyncTearOff();

/// @nodoc
mixin _$TryAsync {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult success(),
    @required TResult failure(Object e, StackTrace s),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult success(),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(_TryAsyncLoading value),
    @required TResult success(_TryAsyncSuccess value),
    @required TResult failure(_TryAsyncFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(_TryAsyncLoading value),
    TResult success(_TryAsyncSuccess value),
    TResult failure(_TryAsyncFailure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $TryAsyncCopyWith<$Res> {
  factory $TryAsyncCopyWith(TryAsync value, $Res Function(TryAsync) then) =
      _$TryAsyncCopyWithImpl<$Res>;
}

/// @nodoc
class _$TryAsyncCopyWithImpl<$Res> implements $TryAsyncCopyWith<$Res> {
  _$TryAsyncCopyWithImpl(this._value, this._then);

  final TryAsync _value;
  // ignore: unused_field
  final $Res Function(TryAsync) _then;
}

/// @nodoc
abstract class _$TryAsyncLoadingCopyWith<$Res> {
  factory _$TryAsyncLoadingCopyWith(
          _TryAsyncLoading value, $Res Function(_TryAsyncLoading) then) =
      __$TryAsyncLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$TryAsyncLoadingCopyWithImpl<$Res> extends _$TryAsyncCopyWithImpl<$Res>
    implements _$TryAsyncLoadingCopyWith<$Res> {
  __$TryAsyncLoadingCopyWithImpl(
      _TryAsyncLoading _value, $Res Function(_TryAsyncLoading) _then)
      : super(_value, (v) => _then(v as _TryAsyncLoading));

  @override
  _TryAsyncLoading get _value => super._value as _TryAsyncLoading;
}

@Implements(Loading)

/// @nodoc
class _$_TryAsyncLoading implements _TryAsyncLoading {
  const _$_TryAsyncLoading();

  @override
  String toString() {
    return 'TryAsync.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TryAsyncLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult success(),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult success(),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(_TryAsyncLoading value),
    @required TResult success(_TryAsyncSuccess value),
    @required TResult failure(_TryAsyncFailure value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(_TryAsyncLoading value),
    TResult success(_TryAsyncSuccess value),
    TResult failure(_TryAsyncFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _TryAsyncLoading implements TryAsync, Loading {
  const factory _TryAsyncLoading() = _$_TryAsyncLoading;
}

/// @nodoc
abstract class _$TryAsyncSuccessCopyWith<$Res> {
  factory _$TryAsyncSuccessCopyWith(
          _TryAsyncSuccess value, $Res Function(_TryAsyncSuccess) then) =
      __$TryAsyncSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$TryAsyncSuccessCopyWithImpl<$Res> extends _$TryAsyncCopyWithImpl<$Res>
    implements _$TryAsyncSuccessCopyWith<$Res> {
  __$TryAsyncSuccessCopyWithImpl(
      _TryAsyncSuccess _value, $Res Function(_TryAsyncSuccess) _then)
      : super(_value, (v) => _then(v as _TryAsyncSuccess));

  @override
  _TryAsyncSuccess get _value => super._value as _TryAsyncSuccess;
}

@Implements(Success)

/// @nodoc
class _$_TryAsyncSuccess implements _TryAsyncSuccess {
  const _$_TryAsyncSuccess();

  @override
  String toString() {
    return 'TryAsync.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TryAsyncSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult success(),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult success(),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(_TryAsyncLoading value),
    @required TResult success(_TryAsyncSuccess value),
    @required TResult failure(_TryAsyncFailure value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(_TryAsyncLoading value),
    TResult success(_TryAsyncSuccess value),
    TResult failure(_TryAsyncFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _TryAsyncSuccess implements TryAsync, Success {
  const factory _TryAsyncSuccess() = _$_TryAsyncSuccess;
}

/// @nodoc
abstract class _$TryAsyncFailureCopyWith<$Res> {
  factory _$TryAsyncFailureCopyWith(
          _TryAsyncFailure value, $Res Function(_TryAsyncFailure) then) =
      __$TryAsyncFailureCopyWithImpl<$Res>;
  $Res call({Object e, StackTrace s});
}

/// @nodoc
class __$TryAsyncFailureCopyWithImpl<$Res> extends _$TryAsyncCopyWithImpl<$Res>
    implements _$TryAsyncFailureCopyWith<$Res> {
  __$TryAsyncFailureCopyWithImpl(
      _TryAsyncFailure _value, $Res Function(_TryAsyncFailure) _then)
      : super(_value, (v) => _then(v as _TryAsyncFailure));

  @override
  _TryAsyncFailure get _value => super._value as _TryAsyncFailure;

  @override
  $Res call({
    Object e = freezed,
    Object s = freezed,
  }) {
    return _then(_TryAsyncFailure(
      e == freezed ? _value.e : e,
      s == freezed ? _value.s : s as StackTrace,
    ));
  }
}

@Implements(Failure)

/// @nodoc
class _$_TryAsyncFailure implements _TryAsyncFailure {
  const _$_TryAsyncFailure(this.e, this.s)
      : assert(e != null),
        assert(s != null);

  @override
  final Object e;
  @override
  final StackTrace s;

  @override
  String toString() {
    return 'TryAsync.failure(e: $e, s: $s)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TryAsyncFailure &&
            (identical(other.e, e) ||
                const DeepCollectionEquality().equals(other.e, e)) &&
            (identical(other.s, s) ||
                const DeepCollectionEquality().equals(other.s, s)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(e) ^
      const DeepCollectionEquality().hash(s);

  @override
  _$TryAsyncFailureCopyWith<_TryAsyncFailure> get copyWith =>
      __$TryAsyncFailureCopyWithImpl<_TryAsyncFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult success(),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(e, s);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult success(),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(e, s);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(_TryAsyncLoading value),
    @required TResult success(_TryAsyncSuccess value),
    @required TResult failure(_TryAsyncFailure value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(_TryAsyncLoading value),
    TResult success(_TryAsyncSuccess value),
    TResult failure(_TryAsyncFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _TryAsyncFailure implements TryAsync, Failure {
  const factory _TryAsyncFailure(Object e, StackTrace s) = _$_TryAsyncFailure;

  Object get e;
  StackTrace get s;
  _$TryAsyncFailureCopyWith<_TryAsyncFailure> get copyWith;
}

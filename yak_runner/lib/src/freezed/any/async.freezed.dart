// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'async.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TryAnyAsyncTearOff {
  const _$TryAnyAsyncTearOff();

// ignore: unused_element
  _TryAnyAsyncLoading<T> loading<T>() {
    return _TryAnyAsyncLoading<T>();
  }

// ignore: unused_element
  _TryAnyAsyncResult<T> result<T>(T result) {
    return _TryAnyAsyncResult<T>(
      result,
    );
  }

// ignore: unused_element
  _TryAnyAsyncFailure<T> failure<T>(Object e, StackTrace s) {
    return _TryAnyAsyncFailure<T>(
      e,
      s,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TryAnyAsync = _$TryAnyAsyncTearOff();

/// @nodoc
mixin _$TryAnyAsync<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult result(T result),
    @required TResult failure(Object e, StackTrace s),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult result(T result),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(_TryAnyAsyncLoading<T> value),
    @required TResult result(_TryAnyAsyncResult<T> value),
    @required TResult failure(_TryAnyAsyncFailure<T> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(_TryAnyAsyncLoading<T> value),
    TResult result(_TryAnyAsyncResult<T> value),
    TResult failure(_TryAnyAsyncFailure<T> value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $TryAnyAsyncCopyWith<T, $Res> {
  factory $TryAnyAsyncCopyWith(
          TryAnyAsync<T> value, $Res Function(TryAnyAsync<T>) then) =
      _$TryAnyAsyncCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements $TryAnyAsyncCopyWith<T, $Res> {
  _$TryAnyAsyncCopyWithImpl(this._value, this._then);

  final TryAnyAsync<T> _value;
  // ignore: unused_field
  final $Res Function(TryAnyAsync<T>) _then;
}

/// @nodoc
abstract class _$TryAnyAsyncLoadingCopyWith<T, $Res> {
  factory _$TryAnyAsyncLoadingCopyWith(_TryAnyAsyncLoading<T> value,
          $Res Function(_TryAnyAsyncLoading<T>) then) =
      __$TryAnyAsyncLoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$TryAnyAsyncLoadingCopyWithImpl<T, $Res>
    extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements _$TryAnyAsyncLoadingCopyWith<T, $Res> {
  __$TryAnyAsyncLoadingCopyWithImpl(_TryAnyAsyncLoading<T> _value,
      $Res Function(_TryAnyAsyncLoading<T>) _then)
      : super(_value, (v) => _then(v as _TryAnyAsyncLoading<T>));

  @override
  _TryAnyAsyncLoading<T> get _value => super._value as _TryAnyAsyncLoading<T>;
}

@Implements(Loading)

/// @nodoc
class _$_TryAnyAsyncLoading<T> implements _TryAnyAsyncLoading<T> {
  const _$_TryAnyAsyncLoading();

  @override
  String toString() {
    return 'TryAnyAsync<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TryAnyAsyncLoading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult result(T result),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(loading != null);
    assert(result != null);
    assert(failure != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult result(T result),
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
    @required TResult loading(_TryAnyAsyncLoading<T> value),
    @required TResult result(_TryAnyAsyncResult<T> value),
    @required TResult failure(_TryAnyAsyncFailure<T> value),
  }) {
    assert(loading != null);
    assert(result != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(_TryAnyAsyncLoading<T> value),
    TResult result(_TryAnyAsyncResult<T> value),
    TResult failure(_TryAnyAsyncFailure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _TryAnyAsyncLoading<T> implements TryAnyAsync<T>, Loading {
  const factory _TryAnyAsyncLoading() = _$_TryAnyAsyncLoading<T>;
}

/// @nodoc
abstract class _$TryAnyAsyncResultCopyWith<T, $Res> {
  factory _$TryAnyAsyncResultCopyWith(_TryAnyAsyncResult<T> value,
          $Res Function(_TryAnyAsyncResult<T>) then) =
      __$TryAnyAsyncResultCopyWithImpl<T, $Res>;
  $Res call({T result});
}

/// @nodoc
class __$TryAnyAsyncResultCopyWithImpl<T, $Res>
    extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements _$TryAnyAsyncResultCopyWith<T, $Res> {
  __$TryAnyAsyncResultCopyWithImpl(
      _TryAnyAsyncResult<T> _value, $Res Function(_TryAnyAsyncResult<T>) _then)
      : super(_value, (v) => _then(v as _TryAnyAsyncResult<T>));

  @override
  _TryAnyAsyncResult<T> get _value => super._value as _TryAnyAsyncResult<T>;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(_TryAnyAsyncResult<T>(
      result == freezed ? _value.result : result as T,
    ));
  }
}

@Implements(Result)

/// @nodoc
class _$_TryAnyAsyncResult<T> implements _TryAnyAsyncResult<T> {
  const _$_TryAnyAsyncResult(this.result) : assert(result != null);

  @override
  final T result;

  @override
  String toString() {
    return 'TryAnyAsync<$T>.result(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TryAnyAsyncResult<T> &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @override
  _$TryAnyAsyncResultCopyWith<T, _TryAnyAsyncResult<T>> get copyWith =>
      __$TryAnyAsyncResultCopyWithImpl<T, _TryAnyAsyncResult<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult result(T result),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(loading != null);
    assert(result != null);
    assert(failure != null);
    return result(this.result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult result(T result),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (result != null) {
      return result(this.result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult loading(_TryAnyAsyncLoading<T> value),
    @required TResult result(_TryAnyAsyncResult<T> value),
    @required TResult failure(_TryAnyAsyncFailure<T> value),
  }) {
    assert(loading != null);
    assert(result != null);
    assert(failure != null);
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(_TryAnyAsyncLoading<T> value),
    TResult result(_TryAnyAsyncResult<T> value),
    TResult failure(_TryAnyAsyncFailure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (result != null) {
      return result(this);
    }
    return orElse();
  }
}

abstract class _TryAnyAsyncResult<T>
    implements TryAnyAsync<T>, Result<dynamic> {
  const factory _TryAnyAsyncResult(T result) = _$_TryAnyAsyncResult<T>;

  T get result;
  _$TryAnyAsyncResultCopyWith<T, _TryAnyAsyncResult<T>> get copyWith;
}

/// @nodoc
abstract class _$TryAnyAsyncFailureCopyWith<T, $Res> {
  factory _$TryAnyAsyncFailureCopyWith(_TryAnyAsyncFailure<T> value,
          $Res Function(_TryAnyAsyncFailure<T>) then) =
      __$TryAnyAsyncFailureCopyWithImpl<T, $Res>;
  $Res call({Object e, StackTrace s});
}

/// @nodoc
class __$TryAnyAsyncFailureCopyWithImpl<T, $Res>
    extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements _$TryAnyAsyncFailureCopyWith<T, $Res> {
  __$TryAnyAsyncFailureCopyWithImpl(_TryAnyAsyncFailure<T> _value,
      $Res Function(_TryAnyAsyncFailure<T>) _then)
      : super(_value, (v) => _then(v as _TryAnyAsyncFailure<T>));

  @override
  _TryAnyAsyncFailure<T> get _value => super._value as _TryAnyAsyncFailure<T>;

  @override
  $Res call({
    Object e = freezed,
    Object s = freezed,
  }) {
    return _then(_TryAnyAsyncFailure<T>(
      e == freezed ? _value.e : e,
      s == freezed ? _value.s : s as StackTrace,
    ));
  }
}

@Implements(Failure)

/// @nodoc
class _$_TryAnyAsyncFailure<T> implements _TryAnyAsyncFailure<T> {
  const _$_TryAnyAsyncFailure(this.e, this.s)
      : assert(e != null),
        assert(s != null);

  @override
  final Object e;
  @override
  final StackTrace s;

  @override
  String toString() {
    return 'TryAnyAsync<$T>.failure(e: $e, s: $s)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TryAnyAsyncFailure<T> &&
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
  _$TryAnyAsyncFailureCopyWith<T, _TryAnyAsyncFailure<T>> get copyWith =>
      __$TryAnyAsyncFailureCopyWithImpl<T, _TryAnyAsyncFailure<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult loading(),
    @required TResult result(T result),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(loading != null);
    assert(result != null);
    assert(failure != null);
    return failure(e, s);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult loading(),
    TResult result(T result),
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
    @required TResult loading(_TryAnyAsyncLoading<T> value),
    @required TResult result(_TryAnyAsyncResult<T> value),
    @required TResult failure(_TryAnyAsyncFailure<T> value),
  }) {
    assert(loading != null);
    assert(result != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(_TryAnyAsyncLoading<T> value),
    TResult result(_TryAnyAsyncResult<T> value),
    TResult failure(_TryAnyAsyncFailure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _TryAnyAsyncFailure<T> implements TryAnyAsync<T>, Failure {
  const factory _TryAnyAsyncFailure(Object e, StackTrace s) =
      _$_TryAnyAsyncFailure<T>;

  Object get e;
  StackTrace get s;
  _$TryAnyAsyncFailureCopyWith<T, _TryAnyAsyncFailure<T>> get copyWith;
}

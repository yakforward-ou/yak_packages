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
  _Empty<T> empty<T>() {
    return _Empty<T>();
  }

// ignore: unused_element
  _Loading<T> loading<T>() {
    return _Loading<T>();
  }

// ignore: unused_element
  _Success<T> success<T>(T result) {
    return _Success<T>(
      result,
    );
  }

// ignore: unused_element
  _Failure<T> failure<T>(Object e, StackTrace s) {
    return _Failure<T>(
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
    @required TResult empty(),
    @required TResult loading(),
    @required TResult success(T result),
    @required TResult failure(Object e, StackTrace s),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(),
    TResult loading(),
    TResult success(T result),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult empty(_Empty<T> value),
    @required TResult loading(_Loading<T> value),
    @required TResult success(_Success<T> value),
    @required TResult failure(_Failure<T> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(_Empty<T> value),
    TResult loading(_Loading<T> value),
    TResult success(_Success<T> value),
    TResult failure(_Failure<T> value),
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
abstract class _$EmptyCopyWith<T, $Res> {
  factory _$EmptyCopyWith(_Empty<T> value, $Res Function(_Empty<T>) then) =
      __$EmptyCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$EmptyCopyWithImpl<T, $Res> extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements _$EmptyCopyWith<T, $Res> {
  __$EmptyCopyWithImpl(_Empty<T> _value, $Res Function(_Empty<T>) _then)
      : super(_value, (v) => _then(v as _Empty<T>));

  @override
  _Empty<T> get _value => super._value as _Empty<T>;
}

/// @nodoc
class _$_Empty<T> implements _Empty<T> {
  const _$_Empty();

  @override
  String toString() {
    return 'TryAnyAsync<$T>.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Empty<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult empty(),
    @required TResult loading(),
    @required TResult success(T result),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return empty();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(),
    TResult loading(),
    TResult success(T result),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult empty(_Empty<T> value),
    @required TResult loading(_Loading<T> value),
    @required TResult success(_Success<T> value),
    @required TResult failure(_Failure<T> value),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return empty(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(_Empty<T> value),
    TResult loading(_Loading<T> value),
    TResult success(_Success<T> value),
    TResult failure(_Failure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class _Empty<T> implements TryAnyAsync<T> {
  const factory _Empty() = _$_Empty<T>;
}

/// @nodoc
abstract class _$LoadingCopyWith<T, $Res> {
  factory _$LoadingCopyWith(
          _Loading<T> value, $Res Function(_Loading<T>) then) =
      __$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<T, $Res> extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements _$LoadingCopyWith<T, $Res> {
  __$LoadingCopyWithImpl(_Loading<T> _value, $Res Function(_Loading<T>) _then)
      : super(_value, (v) => _then(v as _Loading<T>));

  @override
  _Loading<T> get _value => super._value as _Loading<T>;
}

/// @nodoc
class _$_Loading<T> implements _Loading<T> {
  const _$_Loading();

  @override
  String toString() {
    return 'TryAnyAsync<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Loading<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult empty(),
    @required TResult loading(),
    @required TResult success(T result),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(),
    TResult loading(),
    TResult success(T result),
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
    @required TResult empty(_Empty<T> value),
    @required TResult loading(_Loading<T> value),
    @required TResult success(_Success<T> value),
    @required TResult failure(_Failure<T> value),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(_Empty<T> value),
    TResult loading(_Loading<T> value),
    TResult success(_Success<T> value),
    TResult failure(_Failure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading<T> implements TryAnyAsync<T> {
  const factory _Loading() = _$_Loading<T>;
}

/// @nodoc
abstract class _$SuccessCopyWith<T, $Res> {
  factory _$SuccessCopyWith(
          _Success<T> value, $Res Function(_Success<T>) then) =
      __$SuccessCopyWithImpl<T, $Res>;
  $Res call({T result});
}

/// @nodoc
class __$SuccessCopyWithImpl<T, $Res> extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements _$SuccessCopyWith<T, $Res> {
  __$SuccessCopyWithImpl(_Success<T> _value, $Res Function(_Success<T>) _then)
      : super(_value, (v) => _then(v as _Success<T>));

  @override
  _Success<T> get _value => super._value as _Success<T>;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(_Success<T>(
      result == freezed ? _value.result : result as T,
    ));
  }
}

/// @nodoc
class _$_Success<T> implements _Success<T> {
  const _$_Success(this.result) : assert(result != null);

  @override
  final T result;

  @override
  String toString() {
    return 'TryAnyAsync<$T>.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Success<T> &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @override
  _$SuccessCopyWith<T, _Success<T>> get copyWith =>
      __$SuccessCopyWithImpl<T, _Success<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult empty(),
    @required TResult loading(),
    @required TResult success(T result),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(),
    TResult loading(),
    TResult success(T result),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(result);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult empty(_Empty<T> value),
    @required TResult loading(_Loading<T> value),
    @required TResult success(_Success<T> value),
    @required TResult failure(_Failure<T> value),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(_Empty<T> value),
    TResult loading(_Loading<T> value),
    TResult success(_Success<T> value),
    TResult failure(_Failure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success<T> implements TryAnyAsync<T> {
  const factory _Success(T result) = _$_Success<T>;

  T get result;
  _$SuccessCopyWith<T, _Success<T>> get copyWith;
}

/// @nodoc
abstract class _$FailureCopyWith<T, $Res> {
  factory _$FailureCopyWith(
          _Failure<T> value, $Res Function(_Failure<T>) then) =
      __$FailureCopyWithImpl<T, $Res>;
  $Res call({Object e, StackTrace s});
}

/// @nodoc
class __$FailureCopyWithImpl<T, $Res> extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements _$FailureCopyWith<T, $Res> {
  __$FailureCopyWithImpl(_Failure<T> _value, $Res Function(_Failure<T>) _then)
      : super(_value, (v) => _then(v as _Failure<T>));

  @override
  _Failure<T> get _value => super._value as _Failure<T>;

  @override
  $Res call({
    Object e = freezed,
    Object s = freezed,
  }) {
    return _then(_Failure<T>(
      e == freezed ? _value.e : e,
      s == freezed ? _value.s : s as StackTrace,
    ));
  }
}

/// @nodoc
class _$_Failure<T> implements _Failure<T> {
  const _$_Failure(this.e, this.s)
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
        (other is _Failure<T> &&
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
  _$FailureCopyWith<T, _Failure<T>> get copyWith =>
      __$FailureCopyWithImpl<T, _Failure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult empty(),
    @required TResult loading(),
    @required TResult success(T result),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(e, s);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult empty(),
    TResult loading(),
    TResult success(T result),
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
    @required TResult empty(_Empty<T> value),
    @required TResult loading(_Loading<T> value),
    @required TResult success(_Success<T> value),
    @required TResult failure(_Failure<T> value),
  }) {
    assert(empty != null);
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(_Empty<T> value),
    TResult loading(_Loading<T> value),
    TResult success(_Success<T> value),
    TResult failure(_Failure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure<T> implements TryAnyAsync<T> {
  const factory _Failure(Object e, StackTrace s) = _$_Failure<T>;

  Object get e;
  StackTrace get s;
  _$FailureCopyWith<T, _Failure<T>> get copyWith;
}

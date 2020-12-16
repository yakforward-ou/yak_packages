// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TryAnyTearOff {
  const _$TryAnyTearOff();

// ignore: unused_element
  _TryAnyResult<T> result<T>(T result) {
    return _TryAnyResult<T>(
      result,
    );
  }

// ignore: unused_element
  _TryAnyFailure<T> failure<T>(Object e, StackTrace s) {
    return _TryAnyFailure<T>(
      e,
      s,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TryAny = _$TryAnyTearOff();

/// @nodoc
mixin _$TryAny<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult result(T result),
    @required TResult failure(Object e, StackTrace s),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult result(T result),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult result(_TryAnyResult<T> value),
    @required TResult failure(_TryAnyFailure<T> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult result(_TryAnyResult<T> value),
    TResult failure(_TryAnyFailure<T> value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $TryAnyCopyWith<T, $Res> {
  factory $TryAnyCopyWith(TryAny<T> value, $Res Function(TryAny<T>) then) =
      _$TryAnyCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$TryAnyCopyWithImpl<T, $Res> implements $TryAnyCopyWith<T, $Res> {
  _$TryAnyCopyWithImpl(this._value, this._then);

  final TryAny<T> _value;
  // ignore: unused_field
  final $Res Function(TryAny<T>) _then;
}

/// @nodoc
abstract class _$TryAnyResultCopyWith<T, $Res> {
  factory _$TryAnyResultCopyWith(
          _TryAnyResult<T> value, $Res Function(_TryAnyResult<T>) then) =
      __$TryAnyResultCopyWithImpl<T, $Res>;
  $Res call({T result});
}

/// @nodoc
class __$TryAnyResultCopyWithImpl<T, $Res> extends _$TryAnyCopyWithImpl<T, $Res>
    implements _$TryAnyResultCopyWith<T, $Res> {
  __$TryAnyResultCopyWithImpl(
      _TryAnyResult<T> _value, $Res Function(_TryAnyResult<T>) _then)
      : super(_value, (v) => _then(v as _TryAnyResult<T>));

  @override
  _TryAnyResult<T> get _value => super._value as _TryAnyResult<T>;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(_TryAnyResult<T>(
      result == freezed ? _value.result : result as T,
    ));
  }
}

@Implements(Result)

/// @nodoc
class _$_TryAnyResult<T> implements _TryAnyResult<T> {
  const _$_TryAnyResult(this.result) : assert(result != null);

  @override
  final T result;

  @override
  String toString() {
    return 'TryAny<$T>.result(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TryAnyResult<T> &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @override
  _$TryAnyResultCopyWith<T, _TryAnyResult<T>> get copyWith =>
      __$TryAnyResultCopyWithImpl<T, _TryAnyResult<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult result(T result),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(result != null);
    assert(failure != null);
    return result(this.result);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
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
    @required TResult result(_TryAnyResult<T> value),
    @required TResult failure(_TryAnyFailure<T> value),
  }) {
    assert(result != null);
    assert(failure != null);
    return result(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult result(_TryAnyResult<T> value),
    TResult failure(_TryAnyFailure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (result != null) {
      return result(this);
    }
    return orElse();
  }
}

abstract class _TryAnyResult<T> implements TryAny<T>, Result<dynamic> {
  const factory _TryAnyResult(T result) = _$_TryAnyResult<T>;

  T get result;
  _$TryAnyResultCopyWith<T, _TryAnyResult<T>> get copyWith;
}

/// @nodoc
abstract class _$TryAnyFailureCopyWith<T, $Res> {
  factory _$TryAnyFailureCopyWith(
          _TryAnyFailure<T> value, $Res Function(_TryAnyFailure<T>) then) =
      __$TryAnyFailureCopyWithImpl<T, $Res>;
  $Res call({Object e, StackTrace s});
}

/// @nodoc
class __$TryAnyFailureCopyWithImpl<T, $Res>
    extends _$TryAnyCopyWithImpl<T, $Res>
    implements _$TryAnyFailureCopyWith<T, $Res> {
  __$TryAnyFailureCopyWithImpl(
      _TryAnyFailure<T> _value, $Res Function(_TryAnyFailure<T>) _then)
      : super(_value, (v) => _then(v as _TryAnyFailure<T>));

  @override
  _TryAnyFailure<T> get _value => super._value as _TryAnyFailure<T>;

  @override
  $Res call({
    Object e = freezed,
    Object s = freezed,
  }) {
    return _then(_TryAnyFailure<T>(
      e == freezed ? _value.e : e,
      s == freezed ? _value.s : s as StackTrace,
    ));
  }
}

@Implements(Failure)

/// @nodoc
class _$_TryAnyFailure<T> implements _TryAnyFailure<T> {
  const _$_TryAnyFailure(this.e, this.s)
      : assert(e != null),
        assert(s != null);

  @override
  final Object e;
  @override
  final StackTrace s;

  @override
  String toString() {
    return 'TryAny<$T>.failure(e: $e, s: $s)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TryAnyFailure<T> &&
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
  _$TryAnyFailureCopyWith<T, _TryAnyFailure<T>> get copyWith =>
      __$TryAnyFailureCopyWithImpl<T, _TryAnyFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult result(T result),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(result != null);
    assert(failure != null);
    return failure(e, s);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
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
    @required TResult result(_TryAnyResult<T> value),
    @required TResult failure(_TryAnyFailure<T> value),
  }) {
    assert(result != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult result(_TryAnyResult<T> value),
    TResult failure(_TryAnyFailure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _TryAnyFailure<T> implements TryAny<T>, Failure {
  const factory _TryAnyFailure(Object e, StackTrace s) = _$_TryAnyFailure<T>;

  Object get e;
  StackTrace get s;
  _$TryAnyFailureCopyWith<T, _TryAnyFailure<T>> get copyWith;
}

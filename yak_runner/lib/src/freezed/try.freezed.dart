// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'try.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TryTearOff {
  const _$TryTearOff();

// ignore: unused_element
  _TryResult<T> success<T>(T data) {
    return _TryResult<T>(
      data,
    );
  }

// ignore: unused_element
  _TryFailure<T> failure<T>(Object e, StackTrace s) {
    return _TryFailure<T>(
      e,
      s,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $Try = _$TryTearOff();

/// @nodoc
mixin _$Try<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult success(T data),
    @required TResult failure(Object e, StackTrace s),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult success(T data),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult success(_TryResult<T> value),
    @required TResult failure(_TryFailure<T> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult success(_TryResult<T> value),
    TResult failure(_TryFailure<T> value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $TryCopyWith<T, $Res> {
  factory $TryCopyWith(Try<T> value, $Res Function(Try<T>) then) =
      _$TryCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$TryCopyWithImpl<T, $Res> implements $TryCopyWith<T, $Res> {
  _$TryCopyWithImpl(this._value, this._then);

  final Try<T> _value;
  // ignore: unused_field
  final $Res Function(Try<T>) _then;
}

/// @nodoc
abstract class _$TryResultCopyWith<T, $Res> {
  factory _$TryResultCopyWith(
          _TryResult<T> value, $Res Function(_TryResult<T>) then) =
      __$TryResultCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$TryResultCopyWithImpl<T, $Res> extends _$TryCopyWithImpl<T, $Res>
    implements _$TryResultCopyWith<T, $Res> {
  __$TryResultCopyWithImpl(
      _TryResult<T> _value, $Res Function(_TryResult<T>) _then)
      : super(_value, (v) => _then(v as _TryResult<T>));

  @override
  _TryResult<T> get _value => super._value as _TryResult<T>;

  @override
  $Res call({
    Object data = freezed,
  }) {
    return _then(_TryResult<T>(
      data == freezed ? _value.data : data as T,
    ));
  }
}

/// @nodoc
class _$_TryResult<T> implements _TryResult<T> {
  const _$_TryResult(this.data) : assert(data != null);

  @override
  final T data;

  @override
  String toString() {
    return 'Try<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TryResult<T> &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(data);

  @override
  _$TryResultCopyWith<T, _TryResult<T>> get copyWith =>
      __$TryResultCopyWithImpl<T, _TryResult<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult success(T data),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(success != null);
    assert(failure != null);
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult success(T data),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult success(_TryResult<T> value),
    @required TResult failure(_TryFailure<T> value),
  }) {
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult success(_TryResult<T> value),
    TResult failure(_TryFailure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _TryResult<T> implements Try<T> {
  const factory _TryResult(T data) = _$_TryResult<T>;

  T get data;
  _$TryResultCopyWith<T, _TryResult<T>> get copyWith;
}

/// @nodoc
abstract class _$TryFailureCopyWith<T, $Res> {
  factory _$TryFailureCopyWith(
          _TryFailure<T> value, $Res Function(_TryFailure<T>) then) =
      __$TryFailureCopyWithImpl<T, $Res>;
  $Res call({Object e, StackTrace s});
}

/// @nodoc
class __$TryFailureCopyWithImpl<T, $Res> extends _$TryCopyWithImpl<T, $Res>
    implements _$TryFailureCopyWith<T, $Res> {
  __$TryFailureCopyWithImpl(
      _TryFailure<T> _value, $Res Function(_TryFailure<T>) _then)
      : super(_value, (v) => _then(v as _TryFailure<T>));

  @override
  _TryFailure<T> get _value => super._value as _TryFailure<T>;

  @override
  $Res call({
    Object e = freezed,
    Object s = freezed,
  }) {
    return _then(_TryFailure<T>(
      e == freezed ? _value.e : e,
      s == freezed ? _value.s : s as StackTrace,
    ));
  }
}

/// @nodoc
class _$_TryFailure<T> implements _TryFailure<T> {
  const _$_TryFailure(this.e, this.s)
      : assert(e != null),
        assert(s != null);

  @override
  final Object e;
  @override
  final StackTrace s;

  @override
  String toString() {
    return 'Try<$T>.failure(e: $e, s: $s)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TryFailure<T> &&
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
  _$TryFailureCopyWith<T, _TryFailure<T>> get copyWith =>
      __$TryFailureCopyWithImpl<T, _TryFailure<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult success(T data),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(e, s);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult success(T data),
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
    @required TResult success(_TryResult<T> value),
    @required TResult failure(_TryFailure<T> value),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult success(_TryResult<T> value),
    TResult failure(_TryFailure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _TryFailure<T> implements Try<T> {
  const factory _TryFailure(Object e, StackTrace s) = _$_TryFailure<T>;

  Object get e;
  StackTrace get s;
  _$TryFailureCopyWith<T, _TryFailure<T>> get copyWith;
}

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
  Empty<T> empty<T>() {
    return Empty<T>();
  }

// ignore: unused_element
  Loading<T> loading<T>() {
    return Loading<T>();
  }

// ignore: unused_element
  Success<T> success<T>(T result) {
    return Success<T>(
      result,
    );
  }

// ignore: unused_element
  Failure<T> failure<T>(Object e, StackTrace s) {
    return Failure<T>(
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
    @required TResult empty(Empty<T> value),
    @required TResult loading(Loading<T> value),
    @required TResult success(Success<T> value),
    @required TResult failure(Failure<T> value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult empty(Empty<T> value),
    TResult loading(Loading<T> value),
    TResult success(Success<T> value),
    TResult failure(Failure<T> value),
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
abstract class $EmptyCopyWith<T, $Res> {
  factory $EmptyCopyWith(Empty<T> value, $Res Function(Empty<T>) then) =
      _$EmptyCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$EmptyCopyWithImpl<T, $Res> extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements $EmptyCopyWith<T, $Res> {
  _$EmptyCopyWithImpl(Empty<T> _value, $Res Function(Empty<T>) _then)
      : super(_value, (v) => _then(v as Empty<T>));

  @override
  Empty<T> get _value => super._value as Empty<T>;
}

/// @nodoc
class _$Empty<T> implements Empty<T> {
  const _$Empty();

  @override
  String toString() {
    return 'TryAnyAsync<$T>.empty()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Empty<T>);
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
    @required TResult empty(Empty<T> value),
    @required TResult loading(Loading<T> value),
    @required TResult success(Success<T> value),
    @required TResult failure(Failure<T> value),
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
    TResult empty(Empty<T> value),
    TResult loading(Loading<T> value),
    TResult success(Success<T> value),
    TResult failure(Failure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (empty != null) {
      return empty(this);
    }
    return orElse();
  }
}

abstract class Empty<T> implements TryAnyAsync<T> {
  const factory Empty() = _$Empty<T>;
}

/// @nodoc
abstract class $LoadingCopyWith<T, $Res> {
  factory $LoadingCopyWith(Loading<T> value, $Res Function(Loading<T>) then) =
      _$LoadingCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<T, $Res> extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements $LoadingCopyWith<T, $Res> {
  _$LoadingCopyWithImpl(Loading<T> _value, $Res Function(Loading<T>) _then)
      : super(_value, (v) => _then(v as Loading<T>));

  @override
  Loading<T> get _value => super._value as Loading<T>;
}

/// @nodoc
class _$Loading<T> implements Loading<T> {
  const _$Loading();

  @override
  String toString() {
    return 'TryAnyAsync<$T>.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading<T>);
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
    @required TResult empty(Empty<T> value),
    @required TResult loading(Loading<T> value),
    @required TResult success(Success<T> value),
    @required TResult failure(Failure<T> value),
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
    TResult empty(Empty<T> value),
    TResult loading(Loading<T> value),
    TResult success(Success<T> value),
    TResult failure(Failure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading<T> implements TryAnyAsync<T> {
  const factory Loading() = _$Loading<T>;
}

/// @nodoc
abstract class $SuccessCopyWith<T, $Res> {
  factory $SuccessCopyWith(Success<T> value, $Res Function(Success<T>) then) =
      _$SuccessCopyWithImpl<T, $Res>;
  $Res call({T result});
}

/// @nodoc
class _$SuccessCopyWithImpl<T, $Res> extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements $SuccessCopyWith<T, $Res> {
  _$SuccessCopyWithImpl(Success<T> _value, $Res Function(Success<T>) _then)
      : super(_value, (v) => _then(v as Success<T>));

  @override
  Success<T> get _value => super._value as Success<T>;

  @override
  $Res call({
    Object result = freezed,
  }) {
    return _then(Success<T>(
      result == freezed ? _value.result : result as T,
    ));
  }
}

/// @nodoc
class _$Success<T> implements Success<T> {
  const _$Success(this.result) : assert(result != null);

  @override
  final T result;

  @override
  String toString() {
    return 'TryAnyAsync<$T>.success(result: $result)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Success<T> &&
            (identical(other.result, result) ||
                const DeepCollectionEquality().equals(other.result, result)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(result);

  @override
  $SuccessCopyWith<T, Success<T>> get copyWith =>
      _$SuccessCopyWithImpl<T, Success<T>>(this, _$identity);

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
    @required TResult empty(Empty<T> value),
    @required TResult loading(Loading<T> value),
    @required TResult success(Success<T> value),
    @required TResult failure(Failure<T> value),
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
    TResult empty(Empty<T> value),
    TResult loading(Loading<T> value),
    TResult success(Success<T> value),
    TResult failure(Failure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success<T> implements TryAnyAsync<T> {
  const factory Success(T result) = _$Success<T>;

  T get result;
  $SuccessCopyWith<T, Success<T>> get copyWith;
}

/// @nodoc
abstract class $FailureCopyWith<T, $Res> {
  factory $FailureCopyWith(Failure<T> value, $Res Function(Failure<T>) then) =
      _$FailureCopyWithImpl<T, $Res>;
  $Res call({Object e, StackTrace s});
}

/// @nodoc
class _$FailureCopyWithImpl<T, $Res> extends _$TryAnyAsyncCopyWithImpl<T, $Res>
    implements $FailureCopyWith<T, $Res> {
  _$FailureCopyWithImpl(Failure<T> _value, $Res Function(Failure<T>) _then)
      : super(_value, (v) => _then(v as Failure<T>));

  @override
  Failure<T> get _value => super._value as Failure<T>;

  @override
  $Res call({
    Object e = freezed,
    Object s = freezed,
  }) {
    return _then(Failure<T>(
      e == freezed ? _value.e : e,
      s == freezed ? _value.s : s as StackTrace,
    ));
  }
}

/// @nodoc
class _$Failure<T> implements Failure<T> {
  const _$Failure(this.e, this.s)
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
        (other is Failure<T> &&
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
  $FailureCopyWith<T, Failure<T>> get copyWith =>
      _$FailureCopyWithImpl<T, Failure<T>>(this, _$identity);

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
    @required TResult empty(Empty<T> value),
    @required TResult loading(Loading<T> value),
    @required TResult success(Success<T> value),
    @required TResult failure(Failure<T> value),
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
    TResult empty(Empty<T> value),
    TResult loading(Loading<T> value),
    TResult success(Success<T> value),
    TResult failure(Failure<T> value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure<T> implements TryAnyAsync<T> {
  const factory Failure(Object e, StackTrace s) = _$Failure<T>;

  Object get e;
  StackTrace get s;
  $FailureCopyWith<T, Failure<T>> get copyWith;
}

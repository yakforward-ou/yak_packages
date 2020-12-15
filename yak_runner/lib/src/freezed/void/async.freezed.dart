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
  Loading loading() {
    return const Loading();
  }

// ignore: unused_element
  Success success() {
    return const Success();
  }

// ignore: unused_element
  Failure failure(Object e, StackTrace s) {
    return Failure(
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
    @required TResult loading(Loading value),
    @required TResult success(Success value),
    @required TResult failure(Failure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(Loading value),
    TResult success(Success value),
    TResult failure(Failure value),
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
abstract class $LoadingCopyWith<$Res> {
  factory $LoadingCopyWith(Loading value, $Res Function(Loading) then) =
      _$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$LoadingCopyWithImpl<$Res> extends _$TryAsyncCopyWithImpl<$Res>
    implements $LoadingCopyWith<$Res> {
  _$LoadingCopyWithImpl(Loading _value, $Res Function(Loading) _then)
      : super(_value, (v) => _then(v as Loading));

  @override
  Loading get _value => super._value as Loading;
}

/// @nodoc
class _$Loading implements Loading {
  const _$Loading();

  @override
  String toString() {
    return 'TryAsync.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Loading);
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
    @required TResult loading(Loading value),
    @required TResult success(Success value),
    @required TResult failure(Failure value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(Loading value),
    TResult success(Success value),
    TResult failure(Failure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading implements TryAsync {
  const factory Loading() = _$Loading;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$TryAsyncCopyWithImpl<$Res>
    implements $SuccessCopyWith<$Res> {
  _$SuccessCopyWithImpl(Success _value, $Res Function(Success) _then)
      : super(_value, (v) => _then(v as Success));

  @override
  Success get _value => super._value as Success;
}

/// @nodoc
class _$Success implements Success {
  const _$Success();

  @override
  String toString() {
    return 'TryAsync.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Success);
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
    @required TResult loading(Loading value),
    @required TResult success(Success value),
    @required TResult failure(Failure value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(Loading value),
    TResult success(Success value),
    TResult failure(Failure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class Success implements TryAsync {
  const factory Success() = _$Success;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({Object e, StackTrace s});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> extends _$TryAsyncCopyWithImpl<$Res>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(Failure _value, $Res Function(Failure) _then)
      : super(_value, (v) => _then(v as Failure));

  @override
  Failure get _value => super._value as Failure;

  @override
  $Res call({
    Object e = freezed,
    Object s = freezed,
  }) {
    return _then(Failure(
      e == freezed ? _value.e : e,
      s == freezed ? _value.s : s as StackTrace,
    ));
  }
}

/// @nodoc
class _$Failure implements Failure {
  const _$Failure(this.e, this.s)
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
        (other is Failure &&
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
  $FailureCopyWith<Failure> get copyWith =>
      _$FailureCopyWithImpl<Failure>(this, _$identity);

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
    @required TResult loading(Loading value),
    @required TResult success(Success value),
    @required TResult failure(Failure value),
  }) {
    assert(loading != null);
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult loading(Loading value),
    TResult success(Success value),
    TResult failure(Failure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure implements TryAsync {
  const factory Failure(Object e, StackTrace s) = _$Failure;

  Object get e;
  StackTrace get s;
  $FailureCopyWith<Failure> get copyWith;
}

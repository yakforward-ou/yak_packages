// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'sync.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TryTearOff {
  const _$TryTearOff();

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
const $Try = _$TryTearOff();

/// @nodoc
mixin _$Try {
  @optionalTypeArgs
  TResult when<TResult extends Object>({
    @required TResult success(),
    @required TResult failure(Object e, StackTrace s),
  });
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
    TResult success(),
    TResult failure(Object e, StackTrace s),
    @required TResult orElse(),
  });
  @optionalTypeArgs
  TResult map<TResult extends Object>({
    @required TResult success(Success value),
    @required TResult failure(Failure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult success(Success value),
    TResult failure(Failure value),
    @required TResult orElse(),
  });
}

/// @nodoc
abstract class $TryCopyWith<$Res> {
  factory $TryCopyWith(Try value, $Res Function(Try) then) =
      _$TryCopyWithImpl<$Res>;
}

/// @nodoc
class _$TryCopyWithImpl<$Res> implements $TryCopyWith<$Res> {
  _$TryCopyWithImpl(this._value, this._then);

  final Try _value;
  // ignore: unused_field
  final $Res Function(Try) _then;
}

/// @nodoc
abstract class $SuccessCopyWith<$Res> {
  factory $SuccessCopyWith(Success value, $Res Function(Success) then) =
      _$SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class _$SuccessCopyWithImpl<$Res> extends _$TryCopyWithImpl<$Res>
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
    return 'Try.success()';
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
    @required TResult success(),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(success != null);
    assert(failure != null);
    return success();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
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
    @required TResult success(Success value),
    @required TResult failure(Failure value),
  }) {
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
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

abstract class Success implements Try {
  const factory Success() = _$Success;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res>;
  $Res call({Object e, StackTrace s});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res> extends _$TryCopyWithImpl<$Res>
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
    return 'Try.failure(e: $e, s: $s)';
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
    @required TResult success(),
    @required TResult failure(Object e, StackTrace s),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(e, s);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object>({
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
    @required TResult success(Success value),
    @required TResult failure(Failure value),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
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

abstract class Failure implements Try {
  const factory Failure(Object e, StackTrace s) = _$Failure;

  Object get e;
  StackTrace get s;
  $FailureCopyWith<Failure> get copyWith;
}

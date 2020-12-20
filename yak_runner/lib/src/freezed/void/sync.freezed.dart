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
  _TrySuccess success() {
    return const _TrySuccess();
  }

// ignore: unused_element
  _TryFailure failure(Object e, StackTrace s) {
    return _TryFailure(
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
    @required TResult success(_TrySuccess value),
    @required TResult failure(_TryFailure value),
  });
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult success(_TrySuccess value),
    TResult failure(_TryFailure value),
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
abstract class _$TrySuccessCopyWith<$Res> {
  factory _$TrySuccessCopyWith(
          _TrySuccess value, $Res Function(_TrySuccess) then) =
      __$TrySuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$TrySuccessCopyWithImpl<$Res> extends _$TryCopyWithImpl<$Res>
    implements _$TrySuccessCopyWith<$Res> {
  __$TrySuccessCopyWithImpl(
      _TrySuccess _value, $Res Function(_TrySuccess) _then)
      : super(_value, (v) => _then(v as _TrySuccess));

  @override
  _TrySuccess get _value => super._value as _TrySuccess;
}

@Implements(Success)

/// @nodoc
class _$_TrySuccess implements _TrySuccess {
  const _$_TrySuccess();

  @override
  String toString() {
    return 'Try.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TrySuccess);
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
    @required TResult success(_TrySuccess value),
    @required TResult failure(_TryFailure value),
  }) {
    assert(success != null);
    assert(failure != null);
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult success(_TrySuccess value),
    TResult failure(_TryFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _TrySuccess implements Try, Success {
  const factory _TrySuccess() = _$_TrySuccess;
}

/// @nodoc
abstract class _$TryFailureCopyWith<$Res> {
  factory _$TryFailureCopyWith(
          _TryFailure value, $Res Function(_TryFailure) then) =
      __$TryFailureCopyWithImpl<$Res>;
  $Res call({Object e, StackTrace s});
}

/// @nodoc
class __$TryFailureCopyWithImpl<$Res> extends _$TryCopyWithImpl<$Res>
    implements _$TryFailureCopyWith<$Res> {
  __$TryFailureCopyWithImpl(
      _TryFailure _value, $Res Function(_TryFailure) _then)
      : super(_value, (v) => _then(v as _TryFailure));

  @override
  _TryFailure get _value => super._value as _TryFailure;

  @override
  $Res call({
    Object e = freezed,
    Object s = freezed,
  }) {
    return _then(_TryFailure(
      e == freezed ? _value.e : e,
      s == freezed ? _value.s : s as StackTrace,
    ));
  }
}

@Implements(Failure)

/// @nodoc
class _$_TryFailure implements _TryFailure {
  const _$_TryFailure(this.e, this.s)
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
        (other is _TryFailure &&
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
  _$TryFailureCopyWith<_TryFailure> get copyWith =>
      __$TryFailureCopyWithImpl<_TryFailure>(this, _$identity);

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
    @required TResult success(_TrySuccess value),
    @required TResult failure(_TryFailure value),
  }) {
    assert(success != null);
    assert(failure != null);
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object>({
    TResult success(_TrySuccess value),
    TResult failure(_TryFailure value),
    @required TResult orElse(),
  }) {
    assert(orElse != null);
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _TryFailure implements Try, Failure {
  const factory _TryFailure(Object e, StackTrace s) = _$_TryFailure;

  Object get e;
  StackTrace get s;
  _$TryFailureCopyWith<_TryFailure> get copyWith;
}

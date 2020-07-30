import 'dart:async';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'interfaces.dart';

/// [YakUnarySafetyMixin] is meant to asychronously catch failures
/// for the provided function and calling [onFailure] callback on that occurrence

mixin YakAsyncUnarySafetyMixin<T, S>
    implements YakAsyncUnarySafetyInterface<T, S> {
  @protected
  @override
  Future<Either<Failure, T>> safe({
    @required Future<T> Function(S arg) function,
    @required S arg,
    void Function() onFunctionFailure,
  }) async {
    try {
      return Right(
        await function(arg),
      );
    } catch (_) {
      if (onFunctionFailure != null) {
        onFunctionFailure();
      }
      return Left(
        const FunctionFailure(),
      );
    }
  }
}

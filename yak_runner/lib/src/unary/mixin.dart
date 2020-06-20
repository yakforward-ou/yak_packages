import 'dart:async';

import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:dartz/dartz.dart';
import 'interfaces.dart';

/// [YakUnarySafetyMixin] is meant to catch failures for the provided function
/// and calling [onFailure] callback on that occurrence
 
mixin YakUnarySafetyMixin<T,S> implements YakUnarySafetyInterface<T,S> {
  @protected
  @override
  Either<Failure, T> safe({
    @required T Function(S arg) function,
    @required S arg,
    void Function() onFailure,
  }) {
    try {
      return Right(
        function(arg),
      );
    } catch (_) {
      if(onFailure != null) {
        onFailure();
      }
      return Left(
        FunctionFailure(),
      );
    }
  }
}

/// [YakUnarySafetyMixin] is meant to asychronously catch failures 
/// for the provided function and calling [onFailure] callback on that occurrence

mixin YakUnaryAsyncSafetyMixin<T,S> implements YakUnarySafetyAsyncInterface<T,S> {
  @protected
  @override
  Future<Either<Failure, T>> safe({
    @required Future<T> Function(S arg) function, 
    @required S arg,
    void Function() onFailure,
  }) async {
    try {
      return Right(
        await function(arg),
      );
    } catch (_) {
      if(onFailure != null) {
        onFailure();
      }
      return Left(
        FunctionFailure(),
      );
    }
  }
}
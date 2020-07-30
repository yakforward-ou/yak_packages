import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';

/// [YakUnaryRunnerAsyncInterface] is extended in [YakUnaryRunnerAsync]
/// this class is created for abstraction and mockability

abstract class YakAsyncUnaryInterface<S, T> {
  const YakAsyncUnaryInterface();
  Future<Either<Failure, S>> call(FutureOr<T> arg);
}

/// [YakUnarySafetyAsyncInterface] is implemented in [YakUnarySafetyAsyncMixin]
/// this class is created for abstraction and mockability

abstract class YakAsyncUnarySafetyInterface<S, T> {
  const YakAsyncUnarySafetyInterface();
  Future<Either<Failure, S>> safe({
    @required Future<S> Function(FutureOr<T> arg) function,
    @required T arg,
    void Function() onFunctionFailure,
  });
}

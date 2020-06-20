import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';

/// [YakUnaryRunnerInterface] is extended in [YakUnaryAsyncRunner]
/// this class is created for abstraction and mockability

abstract class YakUnaryRunnerInterface<T, S> {
  Either<Failure, T> call(S arg);
}

/// [YakUnarySafetyInterface] is implemented in [YakUnarySafetyMixin]
/// this class is created for abstraction and mockability

abstract class YakUnarySafetyInterface<T, S> {
  Either<Failure, T> safe({
    @required T Function(S arg) function,
    @required S arg,
    void Function() onFailure,
  });
}

/// [YakUnaryRunnerAsyncInterface] is extended in [YakUnaryRunnerAsync]
/// this class is created for abstraction and mockability

abstract class YakUnaryRunnerAsyncInterface<T, S> {
  Future<Either<Failure, T>> call(FutureOr<S> arg);
}

/// [YakUnarySafetyAsyncInterface] is implemented in [YakUnarySafetyAsyncMixin]
/// this class is created for abstraction and mockability

abstract class YakUnarySafetyAsyncInterface<T, S> {
  Future<Either<Failure, T>> safe({
    @required Future<T> Function(FutureOr<S> arg) function,
    @required S arg,
    void Function() onFailure,
  });
}

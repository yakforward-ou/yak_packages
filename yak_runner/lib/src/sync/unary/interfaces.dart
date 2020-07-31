import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';

/// [YakUnaryRunnerInterface] is extended in [YakUnaryAsyncRunner]
/// this class is created for abstraction and mockability

abstract class YakUnaryInterface<T, S> {
  const YakUnaryInterface();
  Either<Failure, T> call(S arg);
}

/// [YakUnarySafetyInterface] is implemented in [YakUnarySafetyMixin]
/// this class is created for abstraction and mockability

abstract class YakUnarySafetyInterface<T, S> {
  const YakUnarySafetyInterface();
  Either<Failure, T> safe({
    @required T Function(S arg) function,
    @required S arg,
    void Function() onFunctionFailure,
  });
}

import 'package:dartz/dartz.dart';
import 'package:yak_runner/src/utils/failure.dart';

/// [YakNullaryRunnerInterface] is extended in [YakNullaryAsyncRunner]
/// this class is created for abstraction and mockability

abstract class YakNullaryInterface<T> {
  const YakNullaryInterface();
  Either<Failure, T> call();
}

/// [YakNullarySafetyInterface] is implemented in [YakNullarySafetyMixin]
/// this class is created for abstraction and mockability

abstract class YakNullarySafetyInterface<T> {
  const YakNullarySafetyInterface();
  Either<Failure, T> safe(
      {T Function() function, void Function() onFunctionFailure});
}

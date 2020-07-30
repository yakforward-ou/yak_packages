import 'package:dartz/dartz.dart';
import 'package:yak_runner/src/utils/failure.dart';

/// [YakNullaryRunnerAsyncInterface] is extended in [YakNullaryRunnerAsync]
/// this class is created for abstraction and mockability

abstract class YakAsyncNullaryInterface<T> {
  const YakAsyncNullaryInterface();
  Future<Either<Failure, T>> call();
}

/// [YakNullarySafetyAsyncInterface] is implemented in [YakNullarySafetyAsyncMixin]
/// this class is created for abstraction and mockability

abstract class YakAsyncNullarySafetyInterface<T> {
  const YakAsyncNullarySafetyInterface();
  Future<Either<Failure, T>> safe(
      {Future<T> Function() function, void Function() onFunctionFailure});
}

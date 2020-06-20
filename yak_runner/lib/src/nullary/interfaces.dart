import 'package:dartz/dartz.dart';
import 'package:yak_runner/src/utils/failure.dart';

/// [YakNullaryRunnerInterface] is extended in [YakNullaryAsyncRunner] 
/// this class is created for abstraction and mockability

abstract class YakNullaryRunnerInterface<T> {
  Either<Failure,T> call();
}

/// [YakNullarySafetyInterface] is implemented in [YakNullarySafetyMixin]
/// this class is created for abstraction and mockability

abstract class YakNullarySafetyInterface<T> {
  Either<Failure,T> safe({T Function() function, void Function() onFailure});
}

/// [YakNullaryRunnerAsyncInterface] is extended in [YakNullaryRunnerAsync] 
/// this class is created for abstraction and mockability

abstract class YakNullaryRunnerAsyncInterface<T> {
 Future<Either<Failure,T>> call();
}

/// [YakNullarySafetyAsyncInterface] is implemented in [YakNullarySafetyAsyncMixin]
/// this class is created for abstraction and mockability

abstract class YakNullarySafetyAsyncInterface<T> {
   Future<Either<Failure,T>> safe({Future<T> Function() function, void Function() onFailure});
}


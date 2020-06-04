import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';

abstract class YakAsyncGeneratorInterface<T> {
  FutureOr<T> call();
}

class YakAsyncGenerator<T> {
  const YakAsyncGenerator({
    @required this.function,
    this.timeout,
  }) : assert(function != null);
  final FutureOr<T> Function() function;
  final Duration timeout;

  FutureOr<Either<Failure, T>> call() async {
    if (timeout != null) {
      Future.delayed(timeout, () {
        return Left(
          TimeOutFailure(),
        );
      });
    }
    T _result;
    try {
      _result = await function();
    } catch (_) {
      return Left(
        FunctionFailure(),
      );
    }
    if (_result == null) {
      return Left(
        NullFailure(),
      );
    } else {
      return Right(_result);
    }
  }
}

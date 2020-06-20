import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/timeout/interface.dart';
import 'package:yak_runner/src/utils/failure.dart';

/// [YakTimeoutMixin] heavily relies on [dart:async]'s [Future.timeout];
/// in case of timeout will trigger the [onTimeout] callback, if provided
/// and return [TimeoutFailure]

mixin YakTimeoutMixin<T> implements YakTimeoutInterface<T> {
  @protected
  @override
  Future<Either<Failure, T>> race({
    @required Duration timeout, 
    @required Future<Either<Failure, T>> future, 
    void Function() onTimeout,
  }) async => await future.timeout(
    timeout, 
    onTimeout: () {
      if(onTimeout != null) {
        onTimeout();
      }
      return Left(TimeoutFailure());
    },
  );
} 
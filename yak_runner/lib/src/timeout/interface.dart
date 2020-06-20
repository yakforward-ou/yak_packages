import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';

/// [YakTimeoutInterface] is implemented in [YakTimeoutMixin]
/// this class is created for abstraction and mockability

abstract class YakTimeoutInterface<T> {
  Future<Either<Failure, T>> race({
    @required Duration timeout, 
    @required Future<Either<Failure, T>> future, 
    void Function() onTimeout,
  });
}
import 'package:dartz/dartz.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'conditions.dart';

/// [YakValidatorInterface] is implemented in [YakValidatorMixin]
/// this class is created for abstraction and mockability

abstract class YakValidatorInterface<T> {
 Either<Failure,T> validate({Either<Failure, T> subject, List<YakCondition<T>> conditions});
}

/// [YakConditionInterface] is implemented in [YakCondition]
/// this class is created for abstraction and mockability

abstract class YakConditionInterface<T> {
  bool call(T argument);
}
import 'package:dartz/dartz.dart';
import 'package:yak_runner/src/utils/failure.dart';

/// [YakValidatorInterface] is implemented in [YakValidatorMixin]
/// this class is created for abstraction and mockability

abstract class YakValidatorInterface<T> {
  const YakValidatorInterface();
  Either<Failure, T> validate(
      {Either<Failure, T> subject,
      List<MapEntry<bool Function(T argument), Failure>> conditions});
}

/// [YakConditionInterface] is implemented in [YakCondition]
/// this class is created for abstraction and mockability

abstract class YakConditionInterface<T> {
  const YakConditionInterface();
  bool call(T argument);
}

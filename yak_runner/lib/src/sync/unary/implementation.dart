import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:yak_runner/src/validator/mixin.dart';
import 'interfaces.dart';
import 'mixin.dart';

/// [YakUnaryRunner] is [callable] class that extends [YakUnaryRunnerInterface]
/// combining [YakUnarySafetyMixin] and [YakValidatorMixin]; it returns [Either<Failure, T>]
/// and triggers [onFailure] callbacks from both [YakCondition]s and [YakUnarySafetyMixin]

class YakUnaryRunner<S, T> extends YakUnaryRunnerInterface<S, T>
    with YakUnarySafetyMixin<S, T>, YakValidatorMixin<S> {
  const YakUnaryRunner({
    this.conditions,
    this.onFunctionFailure,
    this.onValidationFailure,
    @required this.function,
  }) : assert(function != null);
  final S Function(T arg) function;
  final List<MapEntry<bool Function(S argument), Failure>> conditions;
  final void Function() onFunctionFailure;
  final void Function(String condition) onValidationFailure;

  @protected
  @override
  Either<Failure, S> call(T arg) => validate(
        onValidationFailure: onValidationFailure,
        subject: safe(
          function: function,
          arg: arg,
          onFunctionFailure: onFunctionFailure,
        ),
        conditions: conditions,
      );
}

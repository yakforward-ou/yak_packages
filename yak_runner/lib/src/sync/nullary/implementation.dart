import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:yak_runner/src/validator/mixin.dart';
import 'interfaces.dart';
import 'mixin.dart';

/// [YakNullaryRunner] is [callable] class that extends [YakNullaryRunnerInterface]
/// combining [YakNullarySafetyMixin] and [YakValidatorMixin]; it returns [Either<Failure, T>]
/// and triggers [onFailure] callbacks from both [YakCondition]s and [YakNullarySafetyMixin]

class YakNullary<T> extends YakNullaryInterface<T>
    with YakNullarySafetyMixin<T>, YakValidatorMixin<T> {
  const YakNullary({
    this.conditions,
    this.onFunctionFailure,
    this.onValidationFailure,
    @required this.function,
  }) : assert(function != null);
  final T Function() function;
  final List<MapEntry<bool Function(T argument), Failure>> conditions;
  final void Function() onFunctionFailure;
  final void Function(String condition) onValidationFailure;

  @protected
  @override
  Either<Failure, T> call() => validate(
        onValidationFailure: onValidationFailure,
        subject: safe(
          function: function,
          onFunctionFailure: onFunctionFailure,
        ),
        conditions: conditions,
      );
}

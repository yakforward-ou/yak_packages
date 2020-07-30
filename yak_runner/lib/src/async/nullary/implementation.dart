import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:yak_runner/src/validator/mixin.dart';
import 'interfaces.dart';
import 'mixin.dart';

/// [YakNullaryAsyncRunner] is [callable] class that extends [YakNullaryRunnerAsyncInterface]
/// combining [YakNullaryAsyncSafetyMixin], [YakValidatorMixin] and [YakTimeoutMixin];
/// it returns [Either<Failure, T>] and triggers [onFailure] callbacks
/// from both [YakCondition]s and [YakNullarySafetyMixin] and
/// [onTimeout] from [YakTimeoutMixin]

class YakAsyncNullary<T> extends YakAsyncNullaryInterface<T>
    with YakAsyncNullarySafetyMixin<T>, YakValidatorMixin<T> {
  const YakAsyncNullary({
    this.timeout,
    this.conditions,
    this.onFunctionFailure,
    this.onTimeout,
    this.onValidationFailure,
    @required this.function,
  }) : assert(function != null);
  final Future<T> Function() function;
  final List<MapEntry<bool Function(T argument), Failure>> conditions;
  final Duration timeout;
  final void Function() onFunctionFailure;
  final void Function() onTimeout;
  final void Function(String condition) onValidationFailure;
  @protected
  @override
  Future<Either<Failure, T>> call() async => validate(
        conditions: conditions,
        onValidationFailure: onValidationFailure,
        subject: timeout != null
            ? await safe(
                function: function,
                onFunctionFailure: onFunctionFailure,
              ).timeout(timeout, onTimeout: () {
                if (onTimeout != null) {
                  onTimeout();
                }
                return Left(
                  const TimeoutFailure(),
                );
              })
            : await safe(
                function: function,
                onFunctionFailure: onFunctionFailure,
              ),
      );
}

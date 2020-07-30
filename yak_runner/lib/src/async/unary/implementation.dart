import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:yak_runner/src/validator/mixin.dart';
import 'interfaces.dart';
import 'mixin.dart';

/// [YakUnaryAsyncRunner] is [callable] class that extends [YakUnaryRunnerAsyncInterface]
/// combining [YakUnaryAsyncSafetyMixin], [YakValidatorMixin] and [YakTimeoutMixin];
/// it returns [Either<Failure, T>] and triggers [onFailure] callbacks
/// from both [YakCondition]s and [YakUnarySafetyMixin] and
/// [onTimeout] from [YakTimeoutMixin]

class YakAsyncUnary<S, T> extends YakAsyncUnaryInterface<S, T>
    with YakAsyncUnarySafetyMixin<S, T>, YakValidatorMixin<S> {
  const YakAsyncUnary({
    this.timeout,
    this.conditions,
    this.onFunctionFailure,
    this.onTimeout,
    this.onValidationFailure,
    @required this.function,
  }) : assert(function != null);
  final Future<S> Function(FutureOr<T> arg) function;
  final List<MapEntry<bool Function(S argument), Failure>> conditions;
  final Duration timeout;
  final void Function() onFunctionFailure;
  final void Function() onTimeout;
  final void Function(String condition) onValidationFailure;
  @protected
  @override
  Future<Either<Failure, S>> call(FutureOr<T> arg) async => validate(
        conditions: conditions,
        onValidationFailure: onValidationFailure,
        subject: timeout != null
            ? await safe(
                function: function,
                arg: await arg,
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
                arg: await arg,
                onFunctionFailure: onFunctionFailure,
              ),
      );
}

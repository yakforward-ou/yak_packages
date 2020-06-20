import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/timeout/mixin.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:yak_runner/src/validator/conditions.dart';
import 'package:yak_runner/src/validator/mixin.dart';
import 'interfaces.dart';
import 'mixin.dart';

/// [YakNullaryRunner] is [callable] class that extends [YakNullaryRunnerInterface]
/// combining [YakNullarySafetyMixin] and [YakValidatorMixin]; it returns [Either<Failure, T>]
/// and triggers [onFailure] callbacks from both [YakCondition]s and [YakNullarySafetyMixin]
 
class YakNullaryRunner<T> extends YakNullaryRunnerInterface<T> 
  with YakNullarySafetyMixin<T>, YakValidatorMixin<T> {
  YakNullaryRunner({
    this.conditions,
    this.onFailure,
    @required this.function,
  }): assert(function != null);
  final T Function() function;
  final List<YakCondition<T>> conditions;
  final void Function() onFailure;
  @protected
  @override
  Either<Failure, T> call() => validate(
    subject: safe(
      function: function,
      onFailure: onFailure,
    ),
    conditions: conditions,
  );
}

/// [YakNullaryAsyncRunner] is [callable] class that extends [YakNullaryRunnerAsyncInterface]
/// combining [YakNullaryAsyncSafetyMixin], [YakValidatorMixin] and [YakTimeoutMixin];
/// it returns [Either<Failure, T>] and triggers [onFailure] callbacks 
/// from both [YakCondition]s and [YakNullarySafetyMixin] and 
/// [onTimeout] from [YakTimeoutMixin]

class YakNullaryAsyncRunner<T> extends YakNullaryRunnerAsyncInterface<T> 
  with YakNullaryAsyncSafetyMixin<T>, YakValidatorMixin<T>, YakTimeoutMixin<T> {
  YakNullaryAsyncRunner({
    this.timeout,
    this.conditions,
    this.onFailure,
    this.onTimeout,
    @required this.function,
  }): assert(function != null);
  final Future<T> Function() function;
  final List<YakCondition<T>> conditions;
  final Duration timeout;
  final void Function() onFailure;
  final void Function() onTimeout;
  @protected
  @override
  Future<Either<Failure, T>> call() async {
    Future<Either<Failure, T>> _safe() => safe(
      function: function,
       onFailure: onFailure,
    );
    return validate(
      subject: timeout != null
        ? await race(
          future: _safe(),
          timeout: timeout,
          onTimeout: onTimeout,
        )
        : await _safe() ,
      conditions: conditions,
    );
  }
}

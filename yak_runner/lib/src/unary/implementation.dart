import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:yak_runner/src/timeout/mixin.dart';
import 'package:yak_runner/src/utils/failure.dart';
import 'package:yak_runner/src/validator/conditions.dart';
import 'package:yak_runner/src/validator/mixin.dart';
import 'interfaces.dart';
import 'mixin.dart';

/// [YakUnaryRunner] is [callable] class that extends [YakUnaryRunnerInterface]
/// combining [YakUnarySafetyMixin] and [YakValidatorMixin]; it returns [Either<Failure, T>]
/// and triggers [onFailure] callbacks from both [YakCondition]s and [YakUnarySafetyMixin]
 
class YakUnaryRunner<T,S> extends YakUnaryRunnerInterface<T,S> 
  with YakUnarySafetyMixin<T,S>, YakValidatorMixin<T> {
  YakUnaryRunner({
    this.conditions,
    this.onFailure,
    @required this.function,
  }): assert(function != null);
  final T Function(S arg) function;
  final List<YakCondition<T>> conditions;
  final void Function() onFailure;
  @protected
  @override
  Either<Failure, T> call(S arg) => validate(
    subject: safe(
      function: function,
      arg: arg,
      onFailure: onFailure,
    ),
    conditions: conditions,
  );
}

/// [YakUnaryAsyncRunner] is [callable] class that extends [YakUnaryRunnerAsyncInterface]
/// combining [YakUnaryAsyncSafetyMixin], [YakValidatorMixin] and [YakTimeoutMixin];
/// it returns [Either<Failure, T>] and triggers [onFailure] callbacks 
/// from both [YakCondition]s and [YakUnarySafetyMixin] and 
/// [onTimeout] from [YakTimeoutMixin]

class YakUnaryAsyncRunner<T,S> extends YakUnaryRunnerAsyncInterface<T,S> 
  with YakUnaryAsyncSafetyMixin<T,S>, YakValidatorMixin<T>, YakTimeoutMixin<T> {
  YakUnaryAsyncRunner({
    this.timeout,
    this.conditions,
    this.onFailure,
    this.onTimeout,
    @required this.function,
  }): assert(function != null);
  final Future<T> Function(FutureOr<S> arg) function;
  final List<YakCondition<T>> conditions;
  final Duration timeout;
  final void Function() onFailure;
  final void Function() onTimeout;
  @protected
  @override
  Future<Either<Failure, T>> call(FutureOr<S> arg) async {
    Future<Either<Failure, T>> _safe() async => safe(
      function: function,
      arg: await arg,
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

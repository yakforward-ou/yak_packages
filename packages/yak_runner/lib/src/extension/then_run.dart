import 'dart:async';

import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';
import '../all.dart';

/// syntactic sugar to pass a [ValueResult] to a [ResultUnary]
extension ValueResultLetRunX<S> on ValueResult<S> {
  ValueResult<T> letRun<T>(Unary<T, S> function) =>
      isSuccess ? function.run(value) : failure.recast<T>();
}

/// syntactic sugar to pass a [FutureValueResult] to a [ResultUnaryAsync]
extension ValueResultThenRunX<S> on FutureValueResult<S> {
  FutureValueResult<T> thenRun<T>(UnaryFutureOr<T, S> function) =>
      Future.sync(() => this).then((result) => result.isSuccess
          ? function.runAsync(result.value)
          : result.failure.recast());
}

/// syntactic sugar to pass a [VoidResult] to a [ResultNullary]
extension VoidResultLetRunX on VoidResult {
  ValueResult<T> letRun<T>(Nullary<T> function) =>
      isSuccess ? function.run() : failure.recast<T>();
}

/// syntactic sugar to pass a [FutureVoidResult] to a [ResultNullaryAsync]
extension VoidResultThenRunX on FutureVoidResult {
  FutureValueResult<T> thenRun<T>(NullaryFutureOr<T> function) =>
      Future.sync(() => this).then((result) =>
          result.isSuccess ? function.runAsync() : result.failure.recast());
}

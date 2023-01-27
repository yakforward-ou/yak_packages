import 'dart:async';

import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';
import '../all.dart';

/// syntactic sugar to pass a [FutureValueResult] to a [UnaryFutureOr]
extension ThenRunUnaryX<S> on FutureValueResult<S> {
  FutureValueResult<T> thenRun<T>(UnaryFutureOr<T, S> function) =>
      Future.sync(() => this).then(
        (result) => result.isSuccess
            ? function.runAsync(result.success.value)
            : result.failure.recast(),
      );

  FutureVoidResult thenRunVoid<T>(UnaryFutureOr<T, S> function) =>
      Future.sync(() => this).then(
        (result) => result.isSuccess
            ? function.runVoidAsync(result.success.value)
            : result.failure.recast(),
      );
}

/// syntactic sugar to pass a [FutureVoidResult] to a [NullaryFutureOr]
extension ThenRunNullaryX<S> on FutureVoidResult {
  FutureValueResult<T> thenRun<T>(NullaryFutureOr<T> function) =>
      Future.sync(() => this).then(
        (result) =>
            result.isSuccess ? function.runAsync() : result.failure.recast(),
      );

  FutureVoidResult thenRunVoid<T>(NullaryFutureOr<T> function) =>
      Future.sync(() => this).then(
        (result) => result.isSuccess ? function.runVoidAsync() : result.failure,
      );
}

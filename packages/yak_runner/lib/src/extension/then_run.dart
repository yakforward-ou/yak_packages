import 'dart:async';

import 'package:yak_result/yak_result.dart';
import 'package:yak_runner/src/all.dart';
import 'package:yak_utils/yak_utils.dart';

/// syntactic sugar to pass a [FutureResult] to a [UnaryFutureOr]
extension ThenRunUnaryX<S extends Object> on FutureResult<S> {
  FutureResult<T> thenRun<T extends Object>(UnaryFutureOr<T, S> function) =>
      Future.sync(() => this).then(
        (result) => result.isSuccess
            ? function.runAsync(result.asSuccess)
            : result.asFailure.recast(),
      );
}

/// syntactic sugar to pass a [FutureResult] to a [UnaryFutureOr]
extension ThenRunUnaryVoidX<S extends Object> on FutureResult<S> {
  FutureVoidResult thenRunVoid<T>(UnaryFutureOr<T, S> function) =>
      Future.sync(() => this).then(
        (result) => result.isSuccess
            ? function.runVoidAsync(result.asSuccess)
            : result.asFailure.asVoid(),
      );
}

/// syntactic sugar to pass a [FutureVoidResult] to a [NullaryFutureOr]
extension ThenRunNullaryX<S extends Object> on FutureVoidResult {
  FutureResult<T> thenRun<T extends Object>(NullaryFutureOr<T> function) =>
      Future.sync(() => this).then(
        (result) =>
            result.isSuccess ? function.runAsync() : result.asFailure.recast(),
      );

  FutureVoidResult thenRunVoid<T>(NullaryFutureOr<T> function) =>
      Future.sync(() => this).then(
        (result) => result.isSuccess
            ? function.runVoidAsync()
            : result.asFailure.asVoid(),
      );
}

import 'dart:async';

import '../all.dart';

/// syntactic sugar to pass a [ValueResult] to a [ResultUnary]
extension OnValueResultX<S> on ValueResult<S> {
  ValueResult<T> thenRun<T>(ResultUnary<T, S> function) =>
      isSuccess ? function(value) : failure.recast<T>();
}

/// syntactic sugar to pass a [ValueResult] to a [ResultUnaryAsync]
extension OnValueResultAsyncX<S> on ValueResult<S> {
  FutureValueResult<T> thenRunAsync<T>(ResultUnaryAsync<T, S> function) =>
      isSuccess
          ? Future.sync(() => function(value))
          : Future.sync(failure.recast);
}

/// syntactic sugar to pass a [FutureValueResult] to a [ResultUnaryAsync]
extension OnFutureValueResultX<T, S> on FutureValueResult<S> {
  FutureValueResult<T> thenRun(ResultUnaryAsync<T, S> function) async {
    final result = await this;
    return await result.thenRunAsync(function);
  }
}

/// syntactic sugar to pass a [VoidResult] to a [ResultNullary]
extension OnVoidResultX on VoidResult {
  ValueResult<T> thenRun<T>(ResultNullary<T> function) =>
      isSuccess ? function() : failure.recast<T>();
}

/// syntactic sugar to pass a [VoidResult] to a [ResultNullaryAsync]
extension OnVoidResultAsyncX on VoidResult {
  FutureValueResult<T> thenRunAsync<T>(ResultNullaryAsync<T> function) =>
      isSuccess ? Future.sync(function) : Future.sync(failure.recast);
}

/// syntactic sugar to pass a [FutureVoidResult] to a [ResultNullaryAsync]
extension OnFutureVoidResultX<T> on FutureVoidResult {
  FutureValueResult<T> thenRun(ResultNullaryAsync<T> function) async {
    final result = await this;
    return await result.thenRunAsync(function);
  }
}

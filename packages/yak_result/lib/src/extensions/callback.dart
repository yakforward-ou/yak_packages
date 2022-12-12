import 'dart:async';

import '../all.dart';

/// syntactic sugar to pass a [ValueResult] to a [VoidResultUnary]
extension CallbackOnValueResultX<S> on ValueResult<S> {
  VoidResult callback(VoidResultUnary<S> function) =>
      isSuccess ? function(value) : failure.recast();
}

/// syntactic sugar to pass a [ValueResult] to a [VoidResultUnaryAsync]
extension CallbackOnValueResultAsyncX<S> on ValueResult<S> {
  FutureVoidResult callbackAsync<T>(VoidResultUnaryAsync<S> function) =>
      isSuccess
          ? Future.sync(() => function(value))
          : Future.sync(failure.recast);
}

/// syntactic sugar to pass a [ValueResult] to a [VoidResultUnaryAsync]
extension CallbackOnFutureValueResultX<S> on FutureValueResult<S> {
  FutureVoidResult callback(VoidResultUnaryAsync<S> function) async {
    final result = await this;
    return await result.callbackAsync(function);
  }
}

/// syntactic sugar to run [VoidResultNullary] after a [VoidResult]
extension CallbackResultX on VoidResult {
  VoidResult callback(VoidResultNullary function) =>
      isSuccess ? function() : failure;
}

/// syntactic sugar to run a [VoidResultNullaryAsync] on a [VoidResult]
extension CallbackResultAsyncX on VoidResult {
  FutureVoidResult callbackAsync(VoidResultNullaryAsync function) =>
      isSuccess ? Future.sync(function) : Future.sync(() => failure);
}

/// syntactic sugar to run a [VoidResultNullaryAsync] on a [FutureVoidResult]
extension FutureCallbackResultX<T> on FutureVoidResult {
  FutureVoidResult callback(VoidResultNullaryAsync function) async {
    final result = await this;
    return await result.callbackAsync(function);
  }
}

import '../all.dart';

/// syntactic sugar to link a ResultFunction to another
extension OnResultX<T, S> on Result<S> {
  /// effectively turns a ResultFunction into another ResultUnaryFunction
  Result<T> onResult(
    ResultUnaryFunction<T, S> function,
  ) =>
      this is Success ? function(success) : failure.recast<T>();
}

/// syntactic sugar to link a ResultFunction to another
extension OnResultAsyncX<T, S> on Result<S> {
  /// effectively turns a ResultFunction into another ResultUnaryFunctionAsync
  Future<Result<T>> onFutureResult(
    ResultUnaryFunctionAsync<T, S> function,
  ) async =>
      this is Success
          ? function(success)
          :
          // TODO [https://github.com/iapicca/yak_packages/issues/154]
          Future.sync(failure.recast);
}

/// syntactic sugar to link a ResultFunction to another
extension OnFutureResultAsyncX<T, S> on Future<Result<S>> {
  /// effectively turns an async ResultFunction
  /// into another ResultUnaryFunctionAsync
  Future<Result<T>> onFutureResult(
    ResultUnaryFunctionAsync<T, S> function,
  ) async {
    final result = await this;
    return result is Success
        ? function(result.success)
        // TODO [https://github.com/iapicca/yak_packages/issues/154]
        : Future.sync(result.failure.recast);
  }
}

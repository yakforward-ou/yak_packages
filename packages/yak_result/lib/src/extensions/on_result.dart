import '../all.dart';

/// syntactic sugar to link a ResultFunction to another
extension OnResultX<S> on Result<S> {
  /// effectively turns a ResultFunction into another ResultUnaryFunction
  Result<T> onResult<T>(ResultUnaryFunction<T, S> function) {
    return this is Success ? function(success) : failure.recast<T>();
  }
}

/// syntactic sugar to link a ResultFunction to another
extension OnResultAsyncX<S> on Result<S> {
  /// effectively turns a ResultFunction into another ResultUnaryFunctionAsync
  Future<Result<T>> onFutureResult<T>(
    ResultUnaryFunctionAsync<T, S> function,
  ) async {
    return this is Success ? await function(success) : failure.recast<T>();
  }
}

/// syntactic sugar to link a ResultFunction to another
extension OnFutureResultAsyncX<S> on Future<Result<S>> {
  /// effectively turns an async ResultFunction
  /// into another ResultUnaryFunctionAsync
  Future<Result<T>> onFutureResult<T>(
    ResultUnaryFunctionAsync<T, S> function,
  ) async {
    return (await this).onFutureResult(function);
  }
}

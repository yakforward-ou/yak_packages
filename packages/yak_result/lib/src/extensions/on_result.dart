import '../all.dart';

/// syntactic sugar to link a ResultFunction to another
extension OnResultX<S> on Result<S> {
  /// effectively turns a ResultFunction into another ResultUnaryFunction
  Result<T> onResult<T>(ResultUnary<T, S> function) => isPending
      ? Pending()
      : isSuccess
          ? function(success)
          : failure.recast<T>();
}

/// syntactic sugar to link a ResultFunction to another
extension OnResultAsyncX<S> on Result<S> {
  /// effectively turns a ResultFunction into another ResultUnaryFunctionAsync
  Future<Result<T>> onResultAsync<T>(ResultUnaryAsync<T, S> function) =>
      isPending
          ? Future.sync(() => Pending())
          : isSuccess
              ? Future.microtask(() => function(success))
              : Future.microtask(failure.recast);
}

/// syntactic sugar to link a ResultFunction to another
extension OnFutureResultX<T, S> on Future<Result<S>> {
  /// effectively turns an async ResultFunction
  /// into another ResultUnaryFunctionAsync
  Future<Result<T>> onResult(ResultUnaryAsync<T, S> function) =>
      then((result) => result.onResultAsync(function));
}

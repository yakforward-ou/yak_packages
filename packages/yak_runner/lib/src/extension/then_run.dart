import '../all.dart';

/// given a `Result` this extension on success runs the provided function,
/// on failure recasts it to the correct type
extension ThenRunX<S> on Result<S> {
  /// implementation of `ThenRunX` for `ResultUnary`
  Result<T> thenRun<T>(ResultUnary<T, S> runner) =>
      this is Success ? runner(success) : failure.recast<T>();

  /// implementation of `ThenRunX` for `ResultUnaryAsync`
  Future<Result<T>> thenRunAsync<T>(ResultUnaryAsync<T, S> runner) =>
      this is Success
          ? runner(success)
          : Future.sync(() => failure.recast<T>());
}

/// given a `Future` of `Result` this extension on success runs the provided function,
/// on failure recasts it to the correct type
extension ThenRunAsyncX<S> on Future<Result<S>> {
  /// implementation of `ThenRunX` for `ResultUnary`
  Future<Result<T>> thenRun<T>(ResultUnary<T, S> runner) async {
    final result = await this;
    return result is Success
        ? runner(result.success)
        : result.failure.recast<T>();
  }

  /// implementation of `ThenRunX` for `ResultUnaryAsync`
  Future<Result<T>> thenRunAsync<T>(ResultUnaryAsync<T, S> runner) async {
    final result = await this;
    return result is Success
        ? await runner(result.success)
        : result.failure.recast<T>();
  }
}

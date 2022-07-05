import 'package:yak_result/yak_result.dart';

import '../all.dart';

/// given a `Result` this extension on success runs the provided function,
/// on failure recasts it to the correct type
extension ThenRunX<S> on Result<S> {
  /// implementation of `ThenRunX` for `RunUnarySync`
  Result<T> thenRun<T>(RunUnarySync<T, S> runner) =>
      this is Success ? runner(success) : failure.recast<T>();

  /// implementation of `ThenRunX` for `RunUnaryAsync`
  Future<Result<T>> thenRunAsync<T>(RunUnaryAsync<T, S> runner) =>
      this is Success
          ? runner(success)
          : Future.sync(() => failure.recast<T>());
}

/// given a `Future` of `Result` this extension on success runs the provided function,
/// on failure recasts it to the correct type
extension ThenRunAsyncX<S> on Future<Result<S>> {
  /// implementation of `ThenRunX` for `RunUnarySync`
  Future<Result<T>> thenRun<T>(RunUnarySync<T, S> runner) async {
    final result = await this;
    return result is Success
        ? runner(result.success)
        : result.failure.recast<T>();
  }

  /// implementation of `ThenRunX` for `RunUnaryAsync`
  Future<Result<T>> thenRunAsync<T>(RunUnaryAsync<T, S> runner) async {
    final result = await this;
    return result is Success
        ? await runner(result.success)
        : result.failure.recast<T>();
  }
}

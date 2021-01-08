import '../../classes/all.dart';

extension OnFutureResult<S> on Future<Result<S>> {
  Future<Result<T>> onFutureResult<T>(
    Result<T> Function(S) runner, [
    FailureOfType<T> failureOfType,
  ]) async =>
      (await this).onResult((runner));
}

import 'package:yak_runner/yak_runner.dart';

/// a
extension RunBypassX<S extends Object> on Result<S> {
  Result<S> runBypass<T extends Object>(
    Unary<T, S> function,
  ) {
    if (isSuccess) {
      final bypass = function.runVoid(asSuccess);
      if (bypass.isFailure) {
        return bypass.asFailure.recast();
      }
    }
    return this;
  }
}

extension RunBypassAsyncX<S extends Object> on FutureResult<S> {
  FutureResult<S> runBypassAsync(
    UnaryAsync<void, S> function,
  ) async {
    final result = await this;
    if (result.isSuccess) {
      final bypass = await function.runVoidAsync(result.asSuccess);
      if (bypass.isFailure) {
        return bypass.asFailure.recast();
      }
    }
    return result;
  }
}

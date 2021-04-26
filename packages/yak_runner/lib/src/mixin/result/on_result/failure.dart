import '../../../../yak_runner.dart';

/// a `mixin` on `FailureBase`
mixin OnFailure<S> on FailureBase<S> {
  ///  `onResult` implementation in case `Result` is `Failure`
  Result<T> onResult<T>(
    Result<T> Function(S) runner, [
    FailureOfType<T>? failureOfType,
  ]) {
    failureOfType ??= (report) => Failure<T>(report);
    return failureOfType(report);
  }
}

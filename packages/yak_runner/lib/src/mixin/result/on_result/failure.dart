import '../../../classes/all.dart';
import '../../../typedef/all.dart';

/// a `mixin` on `FailureBase`
mixin OnFailure<S> on FailureBase<S> {
  ///  `onResult` implementation in case `Result` is `Failure`
  Result<T> onResult<T>(
    Result<T> Function(S) runner, [
    FailureOfType<T>? failureOfType,
  ]) {
    failureOfType ??= (e, s) => Failure<T>(e, s);
    return failureOfType(e, s);
  }
}

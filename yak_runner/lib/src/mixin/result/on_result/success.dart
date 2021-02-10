import '../../../classes/all.dart';
import '../../../typedef/all.dart';

/// a `mixin` on `SuccessBase`
mixin OnSuccess<S> on SuccessBase<S> {
  ///  `onResult` implementation in case `Result` is `Success`
  Result<T> onResult<T>(Result<T> Function(S) runner,
      [FailureOfType<T> failureOfType]) {
    if (this is Success<S>) {
      return runner((this as Success).data);
    } else {
      failureOfType ??= (e, s) => Failure<T>(e, s);
      try {
        final b = this as Failure;
        return failureOfType(b.e, b.s);
      } on Exception catch (e, s) {
        return failureOfType(e, s);
      }
    }
  }
}

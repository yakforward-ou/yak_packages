import '../../../classes/all.dart';
import '../../../typedef/all.dart';

mixin OnFailure<S> on FailureBase<S> {
  Result<T> onResult<T>(
    Result<T> Function(S) runner, [
    FailureOfType<T> failureOfType,
  ]) {
    failureOfType ??= (e, s) => Failure<T>(e, s);
    if (this is Failure<S>) {
      final b = this as Failure;
      return failureOfType(b.e, b.s);
    } else {
      try {
        return runner((this as Success).data);
      } catch (e, s) {
        return failureOfType(e, s);
      }
    }
  }
}

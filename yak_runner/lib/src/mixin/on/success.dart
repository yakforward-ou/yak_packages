import '../../classes/failure/all.dart';
import '../../classes/success/all.dart';
import '../../classes/all.dart';

mixin OnSuccess<S> on SuccessBase<S> {
  Result<T> onResult<T>(Result<T> Function(S) runner,
      [FailureOfType<T> failureOfType]) {
    if (this is Success<S>) {
      return runner((this as Success).data);
    } else {
      failureOfType ??= (e, s) => Failure<T>(e, s);
      try {
        final b = this as Failure;
        return failureOfType(b.e, b.s);
      } catch (e, s) {
        return failureOfType(e, s);
      }
    }
  }
}

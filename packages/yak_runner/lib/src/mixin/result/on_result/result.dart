import '../../../classes/all.dart';
import '../../../typedef/all.dart';

/// an `mixin` on `ResultBase`
mixin OnResult<S> on ResultBase<S> {
  ///  `onResult` for an unspecified `Result`
  /// without an implementation
  Result<T> onResult<T>(Result<T> Function(S) runner,
      [FailureOfType<T> failureOfType]);
}

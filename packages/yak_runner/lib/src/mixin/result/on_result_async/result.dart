import 'dart:async';
import '../../../classes/all.dart';

import '../../../typedef/all.dart';

/// an `mixin` on `ResultBase`
mixin OnResultAsync<S> on ResultBase<S> {
  ///  `onResultAsync` for an unspecified `Result`
  /// without an implementation
  Future<Result<T>> onResultAsync<T>(
      Future<Result<T>> Function(FutureOr<S>) runner,
      [FailureOfType<T> failureOfType]);
}

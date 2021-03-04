import 'dart:async';
import '../../../classes/all.dart';
import '../../../typedef/all.dart';

/// a `mixin` on `FailureBase`
mixin OnFailureAsync<S> on FailureBase<S> {
  ///  `onResultAsync` implementation in case `Result` is `Failure`
  Future<Result<T>> onResultAsync<T>(
      Future<Result<T>> Function(FutureOr<S>) runner,
      [FailureOfType<T>? failureOfType]) async {
    failureOfType ??= (e, s) => Failure<T>(e, s);
    return failureOfType(e, s);
  }
}

import 'dart:async';

import '../../../classes/all.dart';
import '../../../typedef/all.dart';

/// a `mixin` on `SuccessBase`
mixin OnSuccessAsync<S> on SuccessBase<S> {
  ///  `onResultAsync` implementation in case `Result` is `Success`
  Future<Result<T>> onResultAsync<T>(
      Future<Result<T>> Function(FutureOr<S>) runner,
      [FailureOfType<T> failureOfType]) async {
    if (this is Success<S>) {
      return await runner((this as Success).data);
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

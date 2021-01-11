import 'dart:async';

import '../../../classes/all.dart';

mixin OnSuccessAsync<S> on SuccessBase<S> {
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
      } catch (e, s) {
        return failureOfType(e, s);
      }
    }
  }
}

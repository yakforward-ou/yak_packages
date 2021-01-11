import 'dart:async';
import '../../../classes/all.dart';

mixin OnFailureAsync<S> on FailureBase<S> {
  Future<Result<T>> onResultAsync<T>(
      Future<Result<T>> Function(FutureOr<S>) runner,
      [FailureOfType<T> failureOfType]) async {
    failureOfType ??= (e, s) => Failure<T>(e, s);
    if (this is Failure<S>) {
      final b = this as Failure;
      return failureOfType(b.e, b.s);
    } else {
      try {
        return await runner((this as Success).data);
      } catch (e, s) {
        return failureOfType(e, s);
      }
    }
  }
}

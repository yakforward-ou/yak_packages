import 'dart:async';

import '../../typedef/all.dart';
import '../../classes/all.dart';

extension OnFutureResult<S> on FutureOr<Result<S>> {
  Future<Result<T>> onFutureResult<T>(
    Future<Result<T>> Function(FutureOr<S>) runner, [
    FailureOfType<T> failureOfType,
  ]) async =>
      (await this).onResultAsync(runner);
}

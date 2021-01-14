import 'dart:async';

import '../../../typedef/all.dart';
import '../../../classes/all.dart';

mixin OnResultAsync<S> on ResultBase<S> {
  Future<Result<T>> onResultAsync<T>(
      Future<Result<T>> Function(FutureOr<S>) runner,
      [FailureOfType<T> failureOfType]);
}

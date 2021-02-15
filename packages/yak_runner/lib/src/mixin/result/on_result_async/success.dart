import 'dart:async';

import '../../../classes/all.dart';
import '../../../typedef/all.dart';

/// a `mixin` on `SuccessBase`
mixin OnSuccessAsync<S> on SuccessBase<S> {
  ///  `onResultAsync` implementation in case `Result` is `Success`
  Future<Result<T>> onResultAsync<T>(
          Future<Result<T>> Function(FutureOr<S>) runner,
          [FailureOfType<T> failureOfType]) async =>
      await runner(data);
}

import 'dart:async';

import 'package:yak_runner/src/classes/failure/all.dart';

import '../../../classes/all.dart';

mixin OnResultAsync<S> on ResultBase<S> {
  Future<Result<T>> onResultAsync<T>(
      Future<Result<T>> Function(FutureOr<S>) runner,
      [FailureOfType<T> failureOfType]);
}

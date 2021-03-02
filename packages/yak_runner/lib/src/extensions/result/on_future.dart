import 'dart:async';
import '../../classes/all.dart';
import '../../typedef/all.dart';

/// an `extension` on `FutureOr<Result<S>>`
extension OnFutureResult<S> on FutureOr<Result<S>> {
  ///provided a `runner`
  /// or equivalent ` Future<Result<T>> Function(FutureOr<S>`
  /// await the result and calls `onResultAsync` on the extended `Result`
  Future<Result<T>> onFutureResult<T>(
    Future<Result<T>> Function(FutureOr<S>) runner, [
    FailureOfType<T>? failureOfType,
  ]) async =>
      (await this).onResultAsync(runner);
}

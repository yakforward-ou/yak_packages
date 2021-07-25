import 'dart:async';

import '../all.dart';

/// syntactic sugar to easily return a value from a Result
/// (or run anything if "T" is 'void')
extension WhenX<S> on Result<S> {
  /// runs the provided functions in case of success or failure
  T when<T>({
    required T Function(S) success,
    required T Function(Failure<S>) failure,
  }) {
    return this is Success ? success(this.success) : failure(this.failure);
  }
}

/// syntactic sugar to easily return a value from a Result
/// (or run anything if "T" is 'void')
extension WhenAsyncX<S> on Future<Result<S>> {
  /// runs the provided functions in case of success or failure
  Future<T> when<T>({
    required T Function(S) success,
    required T Function(Failure<S>) failure,
  }) async {
    return (await this).when(success: success, failure: failure);
  }
}

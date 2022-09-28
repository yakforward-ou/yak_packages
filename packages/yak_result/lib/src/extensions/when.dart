import 'dart:async' show FutureOr;

import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

typedef OnSuccess<T, S> = Unary<T, S>;
typedef OnFailure<T, S> = Unary<T, Failure<S>>;
typedef OnPending<T> = Nullary<T>;
typedef OnSuccessAsync<T, S> = UnaryAsync<T, S>;
typedef OnFailureAsync<T, S> = UnaryAsync<T, Failure<S>>;
typedef OnPendingAsync<T> = NullaryAsync<T>;

/// syntactic sugar to easily return a value from a Result
/// (or run anything if "T" is 'void')
extension WhenX<S> on Result<S> {
  /// runs the provided functions in case of [success], [failure] or [pending]
  T? when<T>({
    required OnSuccess<T, S>? onSuccess,
    required OnFailure<T, S>? onFailure,
    OnPending<T>? onPending,
  }) {
    if (isFailure && onFailure != null) {
      return onFailure(failure);
    }
    if (isSuccess && onSuccess != null) {
      return onSuccess(success);
    }
    if (isPending && onPending != null) {
      onPending();
    }
    return null;
  }
}

/// syntactic sugar to easily return a value from a Result
/// (or run anything if "T" is 'void')
extension WhenAsyncX<S> on Result<S> {
  /// runs async the provided functions
  /// in case of [success], [failure] or [pending]

  /// runs async the provided functions
  /// in case of [success], [failure] or [pending]
  Future<T?> whenAsync<T>({
    required OnSuccessAsync<T, S>? onSuccess,
    required OnFailureAsync<T, S>? onFailure,
    OnPendingAsync<T>? onPending,
  }) {
    if (isFailure && onFailure != null) {
      return onFailure(failure);
    }
    if (isSuccess && onSuccess != null) {
      return onSuccess(success);
    }
    if (isPending && onPending != null) {
      onPending();
    }
    return Future.sync(() => null);
  }
}

/// syntactic sugar to easily return a value from a Result
/// (or run anything if "T" is 'void')
extension WhenAsyncFutureX<S> on Future<Result<S>> {
  /// runs async the provided functions
  /// in case of [success], [failure] or [pending]
  Future<T?> whenAsync<T>({
    required OnSuccessAsync<T, S> onSuccess,
    required OnFailureAsync<T, S> onFailure,
    OnPendingAsync<T>? onPending,
  }) =>
      then(
        (result) => result.whenAsync(
          onSuccess: onSuccess,
          onFailure: onFailure,
          onPending: onPending,
        ),
      );
}

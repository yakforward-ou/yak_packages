import '../all.dart';

/// cast a `Failure<S>` to a `Failure<T>`
extension RecastFailureX<S> on Failure<S> {
  /// re-case the failure in the expected type
  Failure<T> recast<T>() => Failure<T>(reason: reason, stackTrace: stackTrace);
}

/// cast a `Pending<S>` to a `Pending<T>`
extension RecastPendingX<S> on Pending<S> {
  /// re-case the failure in the expected type
  Pending<T> recast<T>() => Pending<T>();
}

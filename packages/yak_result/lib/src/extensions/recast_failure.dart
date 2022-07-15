import '../all.dart';

/// cast a `Failure<S>` to a `Failure<T>`
extension RecastFailureX<S> on Failure<S> {
  /// re-case the failure in the expected type
  Failure<T> recast<T>() => Failure<T>(reason: reason, stackTrace: stackTrace);
}

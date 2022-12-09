import '../all.dart';

/// syntactic sugar to easily access the data of a failed [Result]
extension ResultAsFailureX<T> on Result<T> {
  /// the user takes responsability on the result being a Failure
  Failure<T> get failure =>
      isFailure ? this as Failure<T> : throw Exception('Result is a Success');

  /// the user takes responsability on the result being a Success
  Failure<T>? get failureOrNull => isFailure ? this as Failure<T> : null;
}

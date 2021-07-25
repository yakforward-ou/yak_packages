import '../all.dart';

/// syntactic sugar to easily access the data of a successfull
extension ResultAsFailureX<T> on Result<T> {
  /// the user takes responsability on the result being a Success
  Failure<T> get failure {
    assert(this is Failure);
    return this as Failure<T>;
  }
}

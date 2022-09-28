import '../all.dart';

/// syntactic sugar to easily access the data of a successfull
extension ResultAsSuccessX<T> on Result<T> {
  /// the user takes responsability on the result being a Success
  T get success => isSuccess
      ? (this as Success<T>).data
      : throw Exception('Result<$T> is a Failure');
}

/// syntactic sugar to easily access the data of a successfull
extension ResultAsFailureX<T> on Result<T> {
  /// the user takes responsability on the result being a Success
  Failure<T> get failure => isFailure
      ? this as Failure<T>
      : throw Exception('Result<$T> is a Success');
}

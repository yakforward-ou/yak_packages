import '../all.dart';

/// syntactic sugar to easily access the data of a successfull
extension ResultAsSuccessX<T> on Result<T> {
  /// the user takes responsability on the result being a Success
  T get success {
    assert(this is Success);
    return (this as Success<T>).data;
  }
}

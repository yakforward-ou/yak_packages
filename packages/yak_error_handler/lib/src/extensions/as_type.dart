import '../all.dart';

/// extension on `Object?`
extension AsTypeX<S extends Object?> on S {
  /// tries to case `S` as `T` and throws an `AsTypeError` if fails
  T as<T>() {
    if (this is T) {
      return this as T;
    }
    throw AsTypeError<T, S>();
  }
}

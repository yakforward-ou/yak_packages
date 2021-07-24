import '../all.dart';

/// an extension on `HandleError`
extension HandleErrorX<T extends Error> on HandleError<T> {
  /// takes an Error `S` and returns `T?`
  /// calling `HandleError` if `Error` is of the correct Type
  T? handle<S extends Error>(S error) {
    if (error is T) {
      this(error);
      return error;
    }
  }
}

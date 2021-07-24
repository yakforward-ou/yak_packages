import '../all.dart';

/// wrap the `HandleError` function in a callable class
/// to use the covariant argument
class ErrorHandler<T extends Error> {
  /// holds an HandleError
  final HandleError<T> _call;

  /// notifies if the error must be notified
  final bool report;

  /// notifies if the error must be rethrown
  final bool shouldRethrow;

  /// a simple constructor
  const ErrorHandler(
    this._call, {
    this.report = false,
    this.shouldRethrow = false,
  });

  /// allows a `covariant` therefore
  /// any Error can be passed as argument
  T? call(covariant T error) {
    if (error is T) {
      _call(error);
      return error;
    }
  }
}

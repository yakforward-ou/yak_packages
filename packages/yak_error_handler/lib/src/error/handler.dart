import '../../yak_error_handler.dart';

/// an `interfact`that implements `ErrorOfType`
/// and delegates the implementation of `HandleErrorDelegate`
/// to the factory constructors
class ErrorHandler<T, S extends Error> implements HandleErrorDelegate<T> {
  final HandleExactError<S> handleError;
  const ErrorHandler(this.handleError);

  @override
  T? call(Error e) {
    if (e is S) {
      handleError(e);
    }
  }
}

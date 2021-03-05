import '../../yak_error_handler.dart';

/// an `interfact`that implements `ErrorOfType`
/// and delegates the implementation of `HandleErrorDelegate`
/// to the factory constructors
class ErrorHandler<T extends Error> implements HandleErrorDelegate {
  final HandleExactError<T> handleError;
  const ErrorHandler(this.handleError);

  @override
  void call(Error e) {
    if (e is T) {
      handleError(e);
    }
  }
}

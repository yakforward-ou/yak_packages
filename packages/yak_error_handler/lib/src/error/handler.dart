import 'package:yak_error_handler/src/custom/all.dart';

import '../../yak_error_handler.dart';

/// an `interfact`that implements `ErrorOfType`
/// and delegates the implementation of `HandleErrorDelegate`
/// to the factory constructors
class ErrorHandler<T extends Error> implements HandleErrorDelegate {
  final HandleExactError handleError;
  final Type type;
  ErrorHandler(this.handleError) : type = T;

  @override
  void call(Error e) =>
      e.runtimeType != type ? throw WrongErrorHandler<T>(e) : handleError(e);
}

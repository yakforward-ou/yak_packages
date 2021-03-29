import 'package:yak_error_handler/yak_error_handler.dart';

/// an interface for `yak_runner` class
abstract class RunnerBase<T> {
  /// a function of typedef `HandleException`
  final HandleExceptionDelegate? exceptionHandler;

  /// a list of specific to handle in a predetermined way
  final Set<ErrorHandler> errorHandlers;

  /// the constructor takes an optional parameter `errorHandler`
  const RunnerBase({
    this.exceptionHandler,
    required this.errorHandlers,
  });
}

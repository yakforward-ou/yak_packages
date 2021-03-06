import 'package:yak_error_handler/yak_error_handler.dart';
import 'package:yak_runner/yak_runner.dart';

/// an interface for `yak_runner` class
abstract class YakRunnerBase<T> {
  /// a function of typedef `HandleException`
  final ExceptionHandler exceptionHandler;

  /// a list of specific to handle in a predetermined way
  final Set<ErrorHandler<Failure<T>, dynamic>> errorHandlers;

  /// the constructor takes an optional parameter `errorHandler`
  const YakRunnerBase({
    required this.exceptionHandler,
    required this.errorHandlers,
  });
}

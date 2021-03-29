import 'package:yak_error_handler/yak_error_handler.dart';

import '../../all.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catching_errors

/// a class that takes `T Function()`
/// and returns `Result<T> Function()`
/// on `Exception` invokes `errorHandler` if not null
class Runner<T> extends RunnerBase
    with RunnerTestMixin<T>
    implements NullaryDelegate<Result<T>> {
  /// takes as argument `fun` and `errorHandler`
  const Runner(
    this.fun, {
    HandleExceptionDelegate? exceptionHandler,
    Set<ErrorHandler> errorHandlers = const {},
  }) :
        // coverage:ignore-line
        super(
          exceptionHandler: exceptionHandler,
          errorHandlers: errorHandlers,
        );

  /// `fun` is `T Function()`
  final T Function() fun;

  /// `call` is a `Result<T> Function()`
  Result<T> call() {
    try {
      return Result.success(fun());
    } on Error catch (e) {
      for (final h in errorHandlers) {
        if (e.runtimeType == h.type) {
          h.handleError(e);
          return Result.failure(e, e.stackTrace);
        }
      }
      rethrow;
    } on Exception catch (e, s) {
      exceptionHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}

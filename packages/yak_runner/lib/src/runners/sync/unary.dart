import 'package:yak_error_handler/yak_error_handler.dart';

import '../../all.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catching_errors

/// a class that takes `T Function(S)`
/// and returns `Result<T> Function(S)`
/// on `Exception` invokes `errorHandler` if not null
class UnaryRunner<T, S> extends RunnerBase
    with UnaryRunnerTestMixin<T, S>
    implements UnaryDelegate<Result<T>, S> {
  /// takes as argument `fun` and `errorHandler`
  /// unlike
  UnaryRunner(
    this.fun, {
    HandleExceptionDelegate? exceptionHandler,
    Set<ErrorHandler> errorHandlers = const {},
  })  : assert(S != typeVoid, '`S` must not be of type `void`'),
        // coverage:ignore-line
        super(
          exceptionHandler: exceptionHandler,
          errorHandlers: errorHandlers,
        );

  /// `fun` is ` T Function(S)`
  final T Function(S) fun;

  /// `call` is a  `Result<T> Function(S)`
  Result<T> call(S arg) {
    try {
      return Result.success(fun(arg));
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

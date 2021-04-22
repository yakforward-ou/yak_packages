import 'package:yak_error_handler/yak_error_handler.dart';

import '../../all.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catching_errors

/// a class that takes `Future<T> Function()`
/// and returns `Future<Result<T>> Function()`
/// on `Exception` invokes `errorHandler` if not null
class RunnerAsync<T> extends RunnerBase<T>
    with RunnerTestMixin<T>
    implements NullaryDelegate<Future<Result<T>>> {
  /// takes as argument `fun` and `errorHandler`
  const RunnerAsync(
    this.fun, {
    HandleExceptionDelegate? exceptionHandler,
    Set<ErrorHandler> errorHandlers = const {},
    List<OnSuccessCallback<T>> onSuccess = const [],
  }) :
        // coverage:ignore-line
        super(
          exceptionHandler: exceptionHandler,
          errorHandlers: errorHandlers,
          onSuccess: onSuccess,
        );

  /// `fun` is `Future<T> Function()`
  final Future<T> Function() fun;

  /// `call` is a `Future<Result<T>> Function()`
  Future<Result<T>> call() async {
    try {
      final data = await fun();
      for (final callback in onSuccess) {
        await callback(data);
      }
      return Result.success(data);
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

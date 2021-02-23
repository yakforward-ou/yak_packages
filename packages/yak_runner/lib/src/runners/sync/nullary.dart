import '../../all.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catching_errors

/// a class that takes `T Function()`
/// and returns `Result<T> Function()`
/// on `Exception` invokes `errorHandler` if not null
class YakRunner<T> extends YakRunnerBase
    with YakRunnerTestMixin<T>
    implements Delegate<Result<T>> {
  /// takes as argument `fun` and `errorHandler`
  const YakRunner(
    this.fun, [
    HandleException handleException,
    Set<HandleErrorBase> errorsWhitelist = const {},
  ])  : assert(fun != null, ' a non null function must be provided'),
        // coverage:ignore-line
        super(
          handleException,
          errorsWhitelist,
        );

  /// `fun` is `T Function()`
  final T Function() fun;

  /// `call` is a `Result<T> Function()`
  Result<T> call() {
    try {
      return Result.success(fun());
    } on Error catch (e) {
      for (final err in errorsWhitelist) {
        if (err.type != e.runtimeType) {
          err(e);
          return Result.failure(e, e.stackTrace);
        }
      }
      rethrow;
    } on Exception catch (e, s) {
      handleException?.call(e, s);
      return Result.failure(e, s);
    }
  }
}

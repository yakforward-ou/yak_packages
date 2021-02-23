import '../../all.dart';

/// following line added because [https://stackoverflow.com/questions/66315301/what-is-the-correct-way-to-catch-both-error-and-exception-following-effective-d]
//  ignore_for_file: avoid_catching_errors

/// a class that takes `Future<T> Function()`
/// and returns `Future<Result<T>> Function()`
/// on `Exception` invokes `errorHandler` if not null
class YakRunnerAsync<T> extends YakRunnerBase
    with YakRunnerTestMixin<T>
    implements Delegate<Future<Result<T>>> {
  /// takes as argument `fun` and `errorHandler`
  const YakRunnerAsync(
    this.fun, [
    CatchException errorHandler,
  ])  : assert(fun != null, ' a non null function must be provided'),
        // coverage:ignore-line
        super(errorHandler);

  /// `fun` is `Future<T> Function()`
  final Future<T> Function() fun;

  /// `call` is a `Future<Result<T>> Function()`
  Future<Result<T>> call() async {
    try {
      return Result.success(await fun());
    } on Error catch (e) {
      errorHandler?.call(Exception('$e'), e.stackTrace);
      rethrow;
    } on Exception catch (e, s) {
      errorHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}

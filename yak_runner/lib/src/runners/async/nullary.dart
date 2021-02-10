import '../../classes/all.dart';
import '../../delegates/all.dart';
import '../../mixin/all.dart';
import '../../typedef/all.dart';

/// a class that takes `Future<T> Function()`
/// and returns `Future<Result<T>> Function()`
/// on `Exception` invokes `errorHandler` if not null
class YakRunnerAsync<T>
    with YakRunnerTestMixin<T>
    implements Delegate<Future<Result<T>>> {
  /// takes as argument `fun` and `errorHandler`
  const YakRunnerAsync(
    this.fun, [
    this.errorHandler,
  ]) : assert(fun != null, ' a non null function must be provided');

  /// `fun` is `Future<T> Function()`
  final Future<T> Function() fun;

  /// `errorHandler` is `Catch` typedef
  final Catch errorHandler;

  /// `call` is a `Future<Result<T>> Function()`
  Future<Result<T>> call() async {
    try {
      return Result.success(await fun());
    } on Exception catch (e, s) {
      errorHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}

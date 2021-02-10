import '../../classes/all.dart';
import '../../delegates/all.dart';
import '../../mixin/all.dart';
import '../../typedef/all.dart';

/// a class that takes `T Function()`
/// and returns `Result<T> Function()`
/// on `Exception` invokes `errorHandler` if not null
class YakRunner<T> with YakRunnerTestMixin<T> implements Delegate<Result<T>> {
  /// takes as argument `fun` and `errorHandler`
  const YakRunner(this.fun, [this.errorHandler])
      : assert(fun != null, ' a non null function must be provided');

  /// `fun` is `T Function()`
  final T Function() fun;

  /// `errorHandler` is `Catch` typedef
  final Catch errorHandler;

  /// `call` is a `Result<T> Function()`
  Result<T> call() {
    try {
      return Result.success(fun());
    } on Exception catch (e, s) {
      errorHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}

import '../../classes/all.dart';
import '../../mixin/all.dart';
import '../../delegates/all.dart';

class YakRunner<T> with YakRunnerTestMixin implements Delegate<Result<T>> {
  const YakRunner(this.fun, [this.errorHandler]);
  final T Function() fun;
  final ErrorHandler errorHandler;

  Result<T> call() {
    try {
      return Result.success(fun());
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}

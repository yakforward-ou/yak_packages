import '../../mixin/all.dart';
import '../../freezed/all.dart';
import '../../delegates/all.dart';

class YakRunner<T> with YakRunnerTestMixin implements Delegate<Try<T>> {
  const YakRunner(this.fun, [this.errorHandler]);
  final T Function() fun;
  final ErrorHandler errorHandler;

  Try<T> call() {
    try {
      return Try.success(fun());
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Try.failure(e, s);
    }
  }
}

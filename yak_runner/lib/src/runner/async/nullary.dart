import '../../mixin/all.dart';
import '../../freezed/all.dart';
import '../../delegates/all.dart';

class YakRunnerAsync<T>
    with YakRunnerTestMixin
    implements Delegate<Future<Try<T>>> {
  const YakRunnerAsync(this.fun, [this.errorHandler]);
  final Future<T> Function() fun;
  final ErrorHandler errorHandler;

  Future<Try<T>> call() async {
    try {
      return Try.success(await fun());
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Try.failure(e, s);
    }
  }
}

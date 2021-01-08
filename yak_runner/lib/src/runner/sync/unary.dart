import '../../classes/all.dart';
import '../../mixin/all.dart';
import '../../delegates/all.dart';

class YakRunnerArg<T, S>
    with YakRunnerArgTestMixin
    implements UnaryDelegate<Result<T>, S> {
  const YakRunnerArg(this.fun, [this.errorHandler]);
  final T Function(S) fun;
  final ErrorHandler errorHandler;

  Result<T> call(S arg) {
    try {
      return Result.success(fun(arg));
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}

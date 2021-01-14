import '../../shared/all.dart';
import '../../typedef/all.dart';
import '../../classes/all.dart';
import '../../mixin/all.dart';
import '../../delegates/all.dart';

class YakRunnerArg<T, S>
    with YakRunnerArgTestMixin<T, S>
    implements UnaryDelegate<Result<T>, S> {
  YakRunnerArg(this.fun, [this.errorHandler])
      : assert(fun != null, ' a non null function must be provided'),
        assert(S != typeVoid, '`S` must not be of type `void`');
  final T Function(S) fun;
  final Catch errorHandler;

  Result<T> call(S arg) {
    assert(arg != null, ' a non null `arg` must be provided');
    try {
      return Result.success(fun(arg));
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}

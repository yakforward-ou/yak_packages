import 'package:yak_runner/src/delegates/all.dart';
import 'package:yak_runner/src/freezed/all.dart';
import 'package:yak_runner/src/mixin/all.dart';

class YakRunnerArg<T, S>
    with YakRunnerArgTestMixin
    implements UnaryDelegate<Try<T>, S> {
  const YakRunnerArg(this.fun, [this.errorHandler]);
  final T Function(S) fun;
  final ErrorHandler errorHandler;

  Try<T> call(S arg) {
    try {
      return Try.success(fun(arg));
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Try.failure(e, s);
    }
  }
}

import '../../../../yak_runner.dart';
import '../../base/arg_delegate.dart';

/// `TryAnyRunArg` takes a `T Function(S)` as a parameter
/// and effectively turns it into a `TryAny Function(S)`

class TryAnyRunArg<T, S> implements ArgDelegate<TryAny<T>, S> {
  const TryAnyRunArg(this.fun);
  final T Function(S) fun;
  @override
  TryAny<T> call(S arg) {
    try {
      return TryAny<T>.result(fun(arg));
    } catch (e, s) {
      return TryAny<T>.failure(e, s);
    }
  }
}

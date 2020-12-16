import '../../../freezed/any/sync.dart';
import '../../base/delegate.dart';

/// `TryRunArg` takes a `T Function(S)` and a `TryAnyRun` (or equivalent)
/// as a parameter and effectively turns it into a `TryRun`

///  it is not meant to be used directly in frontend
/// prefer using a `state_notifier` and `TryAsync` for that

class TryAnyRunArg<T, S> implements Delegate<TryAny<T>> {
  const TryAnyRunArg(this.fun, this.arg);
  final T Function(S) fun;

  /// you can pass a `TryAnyRun` as `arg`
  final TryAny<S> Function() arg;
  @override
  TryAny<T> call() {
    TryAny<T> res;
    arg().when(result: (S s) {
      try {
        res = TryAny<T>.result(fun(s));
      } catch (e, s) {
        res = TryAny<T>.failure(e, s);
      }
    }, failure: (e, s) {
      res = TryAny<T>.failure(e, s);
    });
    return res;
  }
}

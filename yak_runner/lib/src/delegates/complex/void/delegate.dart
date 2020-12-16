import '../../../freezed/void/sync.dart';
import '../../../freezed/any/sync.dart';
import '../../base/delegate.dart';

/// `TryRunArg` takes a `void Function(T)` and a `TryAnyRun` (or equivalent)
/// as a parameter and effectively turns it into a `TryRun`

///  it is not meant to be used directly in frontend
/// prefer using a `state_notifier` and `TryAsync` for that

class TryRunArg<T> implements Delegate<Try> {
  const TryRunArg(this.fun, this.arg);
  final void Function(T) fun;

  /// you can pass a `TryAnyRun` as `arg`
  final TryAny<T> Function() arg;
  @override
  Try call() {
    Try res;
    arg().when(result: (T t) {
      try {
        fun(t);
        res = Try.success();
      } catch (e, s) {
        res = Try.failure(e, s);
      }
    }, failure: (e, s) {
      res = Try.failure(e, s);
    });
    return res;
  }
}

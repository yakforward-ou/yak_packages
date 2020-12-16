import '../../../freezed/any/sync.dart';
import '../../base/delegate.dart';

/// `TryRun` takes a `void Function()` as a parameter
/// and effectively turns it into a `Try Function()`

class TryAnyRun<T> implements Delegate<TryAny<T>> {
  const TryAnyRun(this.fun);
  final T Function() fun;
  @override
  TryAny<T> call() {
    try {
      return TryAny<T>.result(fun());
    } catch (e, s) {
      return TryAny<T>.failure(e, s);
    }
  }
}

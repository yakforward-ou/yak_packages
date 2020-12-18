import '../../../freezed/any/sync.dart';
import '../../base/delegate.dart';

/// `TryAnyRun` takes a `T Function()` as a parameter
/// and effectively turns it into a `TryAny Function()`

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

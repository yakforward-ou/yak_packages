import '../../../freezed/any/sync.dart';
import '../../base/delegate.dart';

/// `TryRunAny` takes a `Future<T> Function()` as a parameter
/// and effectively turns it into a `Future<TryAny<T>> Function()`

/// [ATTENTION] it returns `TryAny` ***NOT*** `TryAnyAsync`

class TryAnyRunAsync<T> implements Delegate<Future<TryAny<T>>> {
  const TryAnyRunAsync(this.fun);
  final Future<T> Function() fun;
  @override
  Future<TryAny<T>> call() async {
    try {
      return TryAny<T>.result(await fun());
    } catch (e, s) {
      return TryAny<T>.failure(e, s);
    }
  }
}

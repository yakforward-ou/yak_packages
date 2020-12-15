import '../../../freezed/void/sync.dart';
import '../../base/delegate.dart';

/// `TryRun` takes a `void Function()` as a parameter
/// and effectively turns it into a `Try Function()`

class TryRun implements Delegate<Try> {
  const TryRun(this.fun);
  final void Function() fun;
  @override
  Try call() {
    try {
      fun();
      return Try.success();
    } catch (e, s) {
      return Try.failure(e, s);
    }
  }
}

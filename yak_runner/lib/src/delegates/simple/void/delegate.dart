import '../../../freezed/void/sync.dart';
import '../../base/delegate.dart';
import '../../base/error_handler.dart';

/// `TryRun` takes a `void Function()` as a parameter
/// and effectively turns it into a `Try Function()`

/// use cases: [io, general `unsafe` callback]

class TryRun implements Delegate<Try> {
  const TryRun(this.fun, [this.errorHandler]);
  final void Function() fun;
  final ErrorHandler errorHandler;
  @override
  Try call() {
    try {
      fun();
      return Try.success();
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Try.failure(e, s);
    }
  }
}

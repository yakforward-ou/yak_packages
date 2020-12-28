import '../../results/success.dart';
import '../../freezed/void/sync.dart';
import '../base/delegate.dart';
import '../base/error_handler.dart';
import '../simple/void/delegate.dart';

/// `TryRunTry` takes a `void Function()` and a `TryRun` (or equivalent)
/// as a parameter and effectively turns it into a `TryRun`

/// this is recommended when is needed to safely run a `void Function()`
/// only if the `delegate` succede

class TryRunTry implements Delegate<Try> {
  const TryRunTry(this.fun, this.delegate, [this.errorHandler]);
  final void Function() fun;
  final ErrorHandler errorHandler;

  /// you can pass a `TryRun` as `arg`
  final Try Function() delegate;

  @override
  Try call() {
    final _maybe = delegate();
    if (_maybe is Success) {
      final _runDelegate = TryRun(fun, errorHandler);
      return _runDelegate();
    } else {
      return _maybe;
    }
  }
}

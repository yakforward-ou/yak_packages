import 'dart:async';
import '../../mixin/test_factory/void.dart';
import '../../results/success.dart';
import '../../freezed/void/sync.dart';
import '../base/error_handler.dart';
import '../simple/void/async_delegate.dart';
import '../base/future_delegate.dart';

/// `TryRunTryAsync` takes a `FutureOr<void> Function()` and a `TryRunAsyncc`
/// as a parameter and effectively turns it into a `TryRunAsync`

/// this is recommended when is needed to safely run a `FutureOr<void> Function()`
/// only if the `delegate` succede

class TryRunTryAsync with VoidTestFactoryMixin implements FutureDelegate<Try> {
  const TryRunTryAsync(this.fun, this.delegate, [this.errorHandler]);
  final FutureOr<void> Function() fun;
  final ErrorHandler errorHandler;

  /// you can pass a `TryRunAsync` ot `TryRun` as `delegate`
  final FutureOr<Try> Function() delegate;
  @override
  Future<Try> call() async {
    final _maybe = await delegate();
    if (_maybe is Success) {
      final _runDelegate = TryRunAsync(fun, errorHandler);
      return await _runDelegate();
    } else {
      return _maybe;
    }
  }
}

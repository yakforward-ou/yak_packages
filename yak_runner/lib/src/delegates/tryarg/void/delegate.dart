import '../../../freezed/void/sync.dart';
import '../../../freezed/any/sync.dart';
import '../../base/delegate.dart';
import '../../base/error_handler.dart';
import '../../../mixin/test_factory/arg_test_factory_delegate.dart';

/// `TryRunTryArg` takes a `void Function(T)` and a `TryAnyRun` (or equivalent)
/// as a parameter and effectively turns it into a `TryRun`

///  it is not meant to be used directly in frontend
/// prefer using a `state_notifier` and `TryAsync` for that

/// this is recommended in the need of handling a non safe argument
/// and is needed to wrap it into a `TryAny`,
/// ***if the argument is safe use `TryAnyRunArg` instead ***

class TryRunTryArg<S> with ArgTestFactoryMixin<S> implements Delegate<Try> {
  const TryRunTryArg(this.fun, this.arg, [this.errorHandler]);
  final void Function(S) fun;
  final ErrorHandler errorHandler;

  /// you can pass a `TryAnyRun` as `arg`
  final TryAny<S> Function() arg;

  @override
  Try call() {
    Try res;
    arg().when(result: (S t) {
      try {
        fun(t);
        res = Try.success();
      } catch (e, s) {
        errorHandler?.call(e, s);
        res = Try.failure(e, s);
      }
    }, failure: (e, s) {
      /// the error should be handled by `TryAny` returned by the `arg` function
      res = Try.failure(e, s);
    });
    return res;
  }
}

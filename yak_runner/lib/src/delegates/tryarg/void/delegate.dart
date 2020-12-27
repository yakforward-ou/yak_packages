import '../../../freezed/void/sync.dart';
import '../../../freezed/any/sync.dart';
import '../../base/delegate.dart';
import '../../base/error_handler.dart';
import '../../mixin/arg_type_mixin.dart';

/// `TryRunTryArg` takes a `void Function(T)` and a `TryAnyRun` (or equivalent)
/// as a parameter and effectively turns it into a `TryRun`

///  it is not meant to be used directly in frontend
/// prefer using a `state_notifier` and `TryAsync` for that

/// this is recommended in the need of handling a non safe argument
/// and is needed to wrap it into a `TryAny`,
/// ***if the argument is safe use `TryAnyRunArg` instead ***

class TryRunTryArg<T> with ArgypeMixin<T> implements Delegate<Try> {
  const TryRunTryArg(this.fun, this.arg, [this.errorHandler]);
  final void Function(T) fun;
  final ErrorHandler errorHandler;

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

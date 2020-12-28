import '../../../freezed/any/sync.dart';
import '../../base/delegate.dart';
import '../../base/error_handler.dart';
import '../../../mixin/test_factory/arg_result_test_factory_delegate.dart';

/// `TryAnyRunTryArg` takes a `T Function(S)` and a `TryAnyRun` (or equivalent)
/// as a parameter and effectively turns it into a `TryRun`

///  it is not meant to be used directly in frontend
/// prefer using a `state_notifier` and `TryAsync` for that

/// this is recommended in the need of handling a non safe argument
/// and is needed to wrap it into a `TryAny`,
/// ***if the argument is safe use `TryAnyRunArg` instead ***

class TryAnyRunTryArg<T, S>
    with ArgResultTestFactoryMixin<T, S>
    implements Delegate<TryAny<T>> {
  const TryAnyRunTryArg(this.fun, this.arg, [this.errorHandler]);
  final T Function(S) fun;
  final ErrorHandler errorHandler;

  /// you can pass a `TryAnyRun` as `arg`
  final TryAny<S> Function() arg;
  @override
  TryAny<T> call() {
    TryAny<T> res;
    arg().when(result: (S s) {
      try {
        res = TryAny<T>.result(fun(s));
      } catch (e, s) {
        errorHandler?.call(e, s);
        res = TryAny<T>.failure(e, s);
      }
    }, failure: (e, s) {
      /// the error should be handled by `TryAny` returned by the `arg` function
      res = TryAny<T>.failure(e, s);
    });
    return res;
  }
}

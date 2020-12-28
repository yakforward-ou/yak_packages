import 'dart:async';
import '../../../mixin/test_factory/arg_test_factory_delegate.dart';
import '../../../delegates/base/future_delegate.dart';
import '../../../freezed/void/sync.dart';
import '../../../freezed/any/sync.dart';
import '../../base/error_handler.dart';

/// `TryRunAsyncTryArg` takes a `void Function(T) || Future<void> Function(T)`
/// and a `TryAnyRunAsync` (or equivalent)
/// as a parameter and effectively turns it into a `TryRunAsync`

///  it is not meant to be used directly in frontend
/// prefer using a `state_notifier` and `TryAsync` for that

class TryRunTryArgAsync<S>
    with ArgTestFactoryMixin<S>
    implements FutureDelegate<Try> {
  const TryRunTryArgAsync(this.fun, this.arg, [this.errorHandler]);
  final FutureOr<void> Function(S) fun;
  final ErrorHandler errorHandler;

  /// you can pass a `TryAnyRunAsync` ot `TryAnyRun` as `arg`
  final FutureOr<TryAny<S>> Function() arg;
  @override
  Future<Try> call() async {
    Try res;
    final TryAny<S> _arg = await arg();
    await _arg.when(result: (S t) async {
      try {
        await fun(t);
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

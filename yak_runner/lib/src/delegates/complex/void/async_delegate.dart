import 'dart:async';

import '../../../delegates/base/future_delegate.dart';
import '../../../freezed/void/sync.dart';
import '../../../freezed/any/sync.dart';

/// `TryRunAsyncArg` takes a `void Function(T) || Future<void> Function(T)`
/// and a `TryAnyRunAsync` (or equivalent)
/// as a parameter and effectively turns it into a `TryRunAsync`

///  it is not meant to be used directly in frontend
/// prefer using a `state_notifier` and `TryAsync` for that

class TryRunAsyncArg<T> implements FutureDelegate<Try> {
  const TryRunAsyncArg(this.fun, this.arg);
  final FutureOr<void> Function(T) fun;

  /// you can pass a `TryAnyRunAsync` ot `TryAnyRun` as `arg`
  final FutureOr<TryAny<T>> Function() arg;
  @override
  Future<Try> call() async {
    Try res;
    final TryAny<T> _arg = await arg();
    _arg.when(result: (T t) {
      try {
        () async {
          await fun(t);
          res = Try.success();
        }();
      } catch (e, s) {
        res = Try.failure(e, s);
      }
    }, failure: (e, s) {
      res = Try.failure(e, s);
    });
    return res;
  }
}

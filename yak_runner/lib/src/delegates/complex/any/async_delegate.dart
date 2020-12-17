import 'dart:async';

import '../../../delegates/base/future_delegate.dart';

import '../../../freezed/any/sync.dart';

/// `TryRunAsyncArg` takes a `T Function(S) || Future<T> Function(S)`
/// and a `TryAnyRunAsync` (or equivalent)
/// as a parameter and effectively turns it into a `TryAnyRunAsync`
///
/// this allows to concate `Delegate<Future<TryAny<s>>` to a `Delegate<Future<TryAny<T>>`

class TryAnyRunAsyncArg<T, S> implements FutureDelegate<TryAny<T>> {
  const TryAnyRunAsyncArg(this.fun, this.arg);
  final FutureOr<T> Function(S) fun;

  /// you can pass a `TryAnyRunAsync` ot `TryAnyRun` as `arg`
  final FutureOr<TryAny<S>> Function() arg;
  @override
  Future<TryAny<T>> call() async {
    TryAny<T> res;
    final _arg = await arg();
    _arg.when(result: (S s) async {
      try {
        res = TryAny<T>.result(await fun(s));
      } catch (e, s) {
        res = TryAny<T>.failure(e, s);
      }
    }, failure: (e, s) {
      res = TryAny<T>.failure(e, s);
    });
    return res;
  }
}

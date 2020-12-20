import 'dart:async';

import '../../../delegates/base/future_delegate.dart';
import '../../../freezed/any/sync.dart';
import '../../base/error_handler.dart';

/// `TryAnyRunTryArgAsync` takes a `T Function(S) || Future<T> Function(S)`
/// and a `TryAnyRunAsync` (or equivalent)
/// as a parameter and effectively turns it into a `TryAnyRunAsync`
///
/// this allows to concate `Delegate<Future<TryAny<s>>` to a `Delegate<Future<TryAny<T>>`

/// this is recommended in the need of handling a non safe argument
/// and is needed to wrap it into a `TryAny`,
/// ***if the argument is safe use `TryAnyRunArg` instead ***

class TryAnyRunTryArgAsync<T, S> implements FutureDelegate<TryAny<T>> {
  const TryAnyRunTryArgAsync(this.fun, this.arg, [this.errorHandler]);
  final FutureOr<T> Function(S) fun;
  final ErrorHandler errorHandler;

  /// you can pass a `TryAnyRunAsync` ot `TryAnyRun` as `arg`
  final FutureOr<TryAny<S>> Function() arg;
  @override
  Future<TryAny<T>> call() async {
    TryAny<T> res;
    final _arg = await arg();
    await _arg.when(result: (S s) async {
      try {
        res = TryAny<T>.result(await fun(s));
      } catch (e, s) {
        errorHandler?.call(e, s);
        res = TryAny<T>.failure(e, s);
      }
    }, failure: (e, s) {
      /// the error should be handled by `TryAny` returned by the `arg` function
      res = TryAny.failure(e, s);
    });
    return res;
  }
}

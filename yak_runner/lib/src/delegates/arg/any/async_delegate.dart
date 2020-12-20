import 'dart:async';

import '../../base/future_arg_delegate.dart';
import '../../../freezed/any/sync.dart';
import '../../../../yak_runner.dart';
import '../../base/error_handler.dart';

/// `TryAnyRunArgAsync` takes a `Future<T> Function(FutureOr<S>)` as a parameter
/// and effectively turns it into a `TryAny Function(FutureOr<S>)`

/// use cases: [api, function triggered by user's input]

/// [ATTENTION] it returns `TryAny` ***NOT*** `TryAnyAsync`
/// [ATTENTION] it ***DOES NOT*** catch error in the argument!

class TryAnyRunArgAsync<T, S> implements FutureArgDelegate<TryAny<T>, S> {
  const TryAnyRunArgAsync(this.fun, [this.errorHandler]);
  final FutureOr<T> Function(FutureOr<S> arg) fun;
  final ErrorHandler errorHandler;

  @override
  Future<TryAny<T>> call(FutureOr<S> arg) async {
    try {
      return TryAny<T>.result(await fun(await arg));
    } catch (e, s) {
      errorHandler?.call(e, s);
      return TryAny<T>.failure(e, s);
    }
  }
}

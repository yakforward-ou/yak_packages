import 'dart:async';

import '../../base/future_arg_delegate.dart';
import '../../../freezed/any/sync.dart';
import '../../../../yak_runner.dart';

/// `TryAnyRunArgAsync` takes a `Future<T> Function(FutureOr<S>)` as a parameter
/// and effectively turns it into a `TryAny Function(FutureOr<S>)`

/// [ATTENTION] it returns `TryAny` ***NOT*** `TryAnyAsync`
/// [ATTENTION] it ***DOES NOT*** catch error in the argument!

class TryAnyRunArgAsync<T, S> implements FutureArgDelegate<TryAny<T>, S> {
  const TryAnyRunArgAsync(this.fun);
  final FutureOr<T> Function(FutureOr<S> arg) fun;
  @override
  Future<TryAny<T>> call(FutureOr<S> arg) async {
    try {
      return TryAny<T>.result(await fun(await arg));
    } catch (e, s) {
      return TryAny<T>.failure(e, s);
    }
  }
}

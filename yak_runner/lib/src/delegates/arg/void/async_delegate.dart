import 'dart:async';

import '../../base/future_arg_delegate.dart';
import '../../../freezed/void/sync.dart';

/// `TryRunArgAsync` takes a `Future<void> Function(FutureOr<T>)` as a parameter
/// and effectively turns it into a `Future<Try> Function(FutureOr<T>)`

/// [ATTENTION] it returns `Try` ***NOT*** `TryAsync`
/// [ATTENTION] it ***DOES NOT*** catch error in the argument!

class TryRunArgAsync<T> implements FutureArgDelegate<Try, T> {
  const TryRunArgAsync(this.fun);
  final FutureOr<void> Function(FutureOr<T> arg) fun;
  @override
  Future<Try> call(FutureOr<T> arg) async {
    try {
      await fun(await arg);
      return Try.success();
    } catch (e, s) {
      return Try.failure(e, s);
    }
  }
}

import 'dart:async';

import '../../../freezed/void/sync.dart';
import '../../base/future_delegate.dart';

/// `TryRunAsync` takes a `Future<void> Function()` as a parameter
/// and effectively turns it into a `Future<Try> Function()`

/// [ATTENTION] it returns `Try` ***NOT*** `TryAsync`

class TryRunAsync implements FutureDelegate<Try> {
  const TryRunAsync(this.fun);
  final FutureOr<void> Function() fun;
  @override
  Future<Try> call() async {
    try {
      await fun();
      return Try.success();
    } catch (e, s) {
      return Try.failure(e, s);
    }
  }
}

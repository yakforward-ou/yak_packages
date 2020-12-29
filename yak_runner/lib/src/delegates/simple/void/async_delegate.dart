import 'dart:async';
import '../../../mixin/test_factory/void.dart';
import '../../base/error_handler.dart';
import '../../../freezed/void/sync.dart';
import '../../base/future_delegate.dart';

/// `TryRunAsync` takes a `Future<void> Function()` as a parameter
/// and effectively turns it into a `Future<Try> Function()`

/// use cases: [io, general `unsafe` callback]

/// [ATTENTION] it returns `Try` ***NOT*** `TryAsync`

class TryRunAsync with VoidTestFactoryMixin implements FutureDelegate<Try> {
  const TryRunAsync(this.fun, [this.errorHandler]);
  final FutureOr<void> Function() fun;
  final ErrorHandler errorHandler;

  @override
  Future<Try> call() async {
    try {
      await fun();
      return Try.success();
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Try.failure(e, s);
    }
  }
}

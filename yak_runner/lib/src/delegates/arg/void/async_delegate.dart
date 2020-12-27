import 'dart:async';
import '../../mixin/arg_type_mixin.dart';
import '../../base/future_arg_delegate.dart';
import '../../../freezed/void/sync.dart';
import '../../base/error_handler.dart';

/// `TryRunArgAsync` takes a `Future<void> Function(FutureOr<T>)` as a parameter
/// and effectively turns it into a `Future<Try> Function(FutureOr<T>)`

/// use cases: [api, function triggered by user's input]

/// [ATTENTION] it returns `Try` ***NOT*** `TryAsync`
/// [ATTENTION] it ***DOES NOT*** catch error in the argument!

class TryRunArgAsync<T>
    with ArgypeMixin<T>
    implements FutureArgDelegate<Try, T> {
  const TryRunArgAsync(this.fun, [this.errorHandler]);
  final FutureOr<void> Function(FutureOr<T> arg) fun;
  final ErrorHandler errorHandler;

  @override
  Future<Try> call(FutureOr<T> arg) async {
    try {
      await fun(await arg);
      return Try.success();
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Try.failure(e, s);
    }
  }
}

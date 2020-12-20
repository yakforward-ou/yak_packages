import '../../../freezed/void/sync.dart';
import '../../base/arg_delegate.dart';
import '../../base/error_handler.dart';

/// `TryRunArg` takes a `void Function(T)` as a parameter
/// and effectively turns it into a `Try Function()`

/// use cases: [api, function triggered by user's input]

/// [ATTENTION] it ***DOES NOT*** catch error in the argument!

class TryRunArg<T> implements ArgDelegate<Try, T> {
  const TryRunArg(this.fun, [this.errorHandler]);
  final void Function(T) fun;
  final ErrorHandler errorHandler;

  @override
  Try call(T arg) {
    try {
      fun(arg);
      return Try.success();
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Try.failure(e, s);
    }
  }
}

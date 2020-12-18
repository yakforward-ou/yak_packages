import '../../../freezed/void/sync.dart';
import '../../base/arg_delegate.dart';

/// `TryRunArg` takes a `void Function(T)` as a parameter
/// and effectively turns it into a `Try Function()`

class TryRunArg<T> implements ArgDelegate<Try, T> {
  const TryRunArg(this.fun);
  final void Function(T) fun;
  @override
  Try call(T arg) {
    try {
      fun(arg);
      return Try.success();
    } catch (e, s) {
      return Try.failure(e, s);
    }
  }
}

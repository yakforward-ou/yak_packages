import '../../../freezed/void/sync.dart';
import '../../base/arg_delegate.dart';
import '../../base/error_handler.dart';
import '../../../mixin/test_factory/arg_test_factory_delegate.dart';

/// `TryRunArg` takes a `void Function(T)` as a parameter
/// and effectively turns it into a `Try Function()`

/// use cases: [api, function triggered by user's input]

/// [ATTENTION] it ***DOES NOT*** catch error in the argument!

class TryRunArg<S> with ArgTestFactoryMixin<S> implements ArgDelegate<Try, S> {
  const TryRunArg(this.fun, [this.errorHandler]);
  final void Function(S) fun;
  final ErrorHandler errorHandler;

  @override
  Try call(S arg) {
    try {
      fun(arg);
      return Try.success();
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Try.failure(e, s);
    }
  }
}

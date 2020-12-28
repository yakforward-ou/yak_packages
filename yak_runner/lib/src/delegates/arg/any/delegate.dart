import '../../../../yak_runner.dart';
import '../../base/arg_delegate.dart';
import '../../base/error_handler.dart';
import '../../../mixin/test_factory/arg_result_test_factory_delegate.dart';

/// `TryAnyRunArg` takes a `T Function(S)` as a parameter
/// and effectively turns it into a `TryAny Function(S)`

/// use cases: [api, function triggered by user's input]

/// [ATTENTION] it ***DOES NOT*** catch error in the argument!

class TryAnyRunArg<T, S>
    with ArgResultTestFactoryMixin<T, S>
    implements ArgDelegate<TryAny<T>, S> {
  const TryAnyRunArg(this.fun, [this.errorHandler]);
  final T Function(S) fun;
  final ErrorHandler errorHandler;

  @override
  TryAny<T> call(S arg) {
    try {
      return TryAny<T>.result(fun(arg));
    } catch (e, s) {
      errorHandler?.call(e, s);
      return TryAny<T>.failure(e, s);
    }
  }
}

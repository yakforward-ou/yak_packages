import '../../base/error_handler.dart';
import '../../../mixin/test_factory/result.dart';
import '../../../freezed/any/sync.dart';
import '../../base/delegate.dart';

/// `TryAnyRun` takes a `T Function()` as a parameter
/// and effectively turns it into a `TryAny Function()`

/// use cases: [io]

class TryAnyRun<T>
    with ResultTestFactoryMixin<T>
    implements Delegate<TryAny<T>> {
  const TryAnyRun(this.fun, [this.errorHandler]);
  final T Function() fun;
  final ErrorHandler errorHandler;

  @override
  TryAny<T> call() {
    try {
      return TryAny<T>.result(fun());
    } catch (e, s) {
      errorHandler?.call(e, s);
      return TryAny<T>.failure(e, s);
    }
  }
}

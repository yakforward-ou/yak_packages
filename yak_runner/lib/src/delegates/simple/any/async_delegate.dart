import 'dart:async';
import '../../../mixin/test_factory/result_test_factory_delegate.dart';
import '../../base/error_handler.dart';
import '../../base/future_delegate.dart';
import '../../../freezed/any/sync.dart';

/// `TryAnyRunAsync` takes a `Future<T> Function()` as a parameter
/// and effectively turns it into a `Future<TryAny<T>> Function()`

/// use cases: [io]

/// [ATTENTION] it returns `TryAny` ***NOT*** `TryAnyAsync`

class TryAnyRunAsync<T>
    with ResultTestFactoryMixin<T>
    implements FutureDelegate<TryAny<T>> {
  const TryAnyRunAsync(this.fun, [this.errorHandler]);
  final FutureOr<T> Function() fun;
  final ErrorHandler errorHandler;

  @override
  Future<TryAny<T>> call() async {
    try {
      return TryAny<T>.result(await fun());
    } catch (e, s) {
      errorHandler?.call(e, s);
      return TryAny<T>.failure(e, s);
    }
  }
}

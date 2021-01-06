import 'dart:async';

import '../../mixin/all.dart';
import '../../freezed/all.dart';
import '../../delegates/all.dart';

class YakRunnerArgAsync<T, S>
    with YakRunnerArgTestMixin
    implements UnaryDelegate<Future<Try<T>>, FutureOr<S>> {
  const YakRunnerArgAsync(this.fun, [this.errorHandler]);
  final Future<T> Function(FutureOr<S>) fun;
  final ErrorHandler errorHandler;

  Future<Try<T>> call(FutureOr<S> arg) async {
    try {
      return Try.success(await fun(await arg));
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Try.failure(e, s);
    }
  }
}

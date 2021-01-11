import 'dart:async';

import '../../classes/all.dart';
import '../../mixin/all.dart';
import '../../delegates/all.dart';

class YakRunnerArgAsync<T, S>
    with YakRunnerArgTestMixin
    implements UnaryDelegate<Future<Result<T>>, FutureOr<S>> {
  const YakRunnerArgAsync(this.fun, [this.errorHandler]);
  final Future<T> Function(FutureOr<S>) fun;
  final ErrorHandler errorHandler;

  Future<Result<T>> call(FutureOr<S> arg) async {
    try {
      return Result.success(await fun(await arg));
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}

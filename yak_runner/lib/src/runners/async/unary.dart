import 'dart:async';

import '../../shared/all.dart';
import '../../typedef/all.dart';
import '../../classes/all.dart';
import '../../mixin/all.dart';
import '../../delegates/all.dart';

class YakRunnerArgAsync<T, S>
    with YakRunnerArgTestMixin<T, S>
    implements UnaryDelegate<Future<Result<T>>, FutureOr<S>> {
  YakRunnerArgAsync(this.fun, [this.errorHandler])
      : assert(fun != null, ' a non null function must be provided'),
        assert(S != typeVoid, '`S` must not be of type `void`');
  final Future<T> Function(FutureOr<S>) fun;
  final Catch errorHandler;

  Future<Result<T>> call(FutureOr<S> arg) async {
    assert(arg != null, ' a non null `arg` must be provided');

    try {
      return Result.success(await fun(await arg));
    } catch (e, s) {
      errorHandler?.call(e, s);
      return Result.failure(e, s);
    }
  }
}

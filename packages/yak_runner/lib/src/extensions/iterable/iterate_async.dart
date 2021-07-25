import 'package:yak_result/yak_result.dart';

import '../../all.dart';

/// an extension to handle runners with `Iterable`s
extension IterableRunnerAsyncX<T, S> on UnaryRunnerAsync<T, S> {
  /// a `sync` implementation
  Future<Result<Iterable<T>>> iterate(Iterable<S> iterable) async {
    final data = <T>[];
    for (final s in iterable) {
      final r = await call(s);
      if (r is Failure) {
        return r.failure.recast<Iterable<T>>();
      }
      data.add(r.success);
    }
    return Success<Iterable<T>>(data);
  }
}

import 'package:yak_result/yak_result.dart';

import '../../all.dart';

/// an extension to handle runners with `Iterable`s
extension IterableRunnerX<T, S> on UnaryRunner<T, S> {
  /// a `sync` implementation
  Result<Iterable<T>> iterate(Iterable<S> iterable) {
    final data = <T>[];
    for (final s in iterable) {
      final r = call(s);
      if (r is Failure) {
        return r.failure.recast<Iterable<T>>();
      }
      data.add(r.success);
    }
    return Success<Iterable<T>>(data);
  }
}

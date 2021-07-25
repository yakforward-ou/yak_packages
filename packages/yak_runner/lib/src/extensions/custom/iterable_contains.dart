import 'package:yak_result/yak_result.dart';

import '../../all.dart';

/// an extension on `Iterable` to easily access the result
extension RunnerIterableContainsExtension<T> on Iterable<T> {
  /// returns a `RunnerArg` from an Iterable
  Result<T> containsResult(T element) {
    final runner = IterableContains(this);
    return runner(element);
  }
}

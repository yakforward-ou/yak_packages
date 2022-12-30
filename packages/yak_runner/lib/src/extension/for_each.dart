import 'package:yak_utils/yak_utils.dart' show Unary, UnaryFutureOr;
import 'package:yak_result/yak_result.dart' show ValueResult;

import '../all.dart';

/// `ForEachRunX` runs a the values of an `Iterable` through a `runner`
extension ForEachRunX<S> on Iterable<S> {
  Iterable<ValueResult<T>> forEachRun<T>(Unary<T, S> function) sync* {
    for (final s in this) {
      yield runUnary<T, S>(function)(s);
    }
  }

  Stream<ValueResult<T>> forEachRunAsync<T>(
    UnaryFutureOr<T, S> function,
  ) async* {
    for (final s in this) {
      yield await runUnaryAsync<T, S>(function)(s);
    }
  }
}

/// `ForEachRunStreamX` runs a the values of a `Stream` through a `runner`
extension ForEachRunStreamX<S> on Stream<S> {
  Stream<ValueResult<T>> forEachRun<T>(UnaryFutureOr<T, S> function) async* {
    await for (final s in this) {
      yield await runUnaryAsync<T, S>(function)(s);
    }
  }
}

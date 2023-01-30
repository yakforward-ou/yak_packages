import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

extension IterableNullaryToResultNullaryAsyncX<T> on Iterable<NullaryAsync<T>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Nullary<T>>
  Iterable<ResultNullaryAsync<T>> runAsync() sync* {
    for (final function in this) {
      yield function.runAsync;
    }
  }

  /// returns Iterable<VoidResultNullary> from Iterable<Nullary<T>>
  Iterable<VoidResultNullaryAsync> runVoidAsync() sync* {
    for (final function in this) {
      yield function.runVoidAsync;
    }
  }
}

extension IterableUnaryToResultUnaryX<T, S> on Iterable<UnaryAsync<T, S>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Unary<T, S>>
  Iterable<ResultUnaryAsync<T, S>> runAsync() sync* {
    for (final function in this) {
      yield function.runAsync;
    }
  }

  /// returns  Iterable<VoidResultUnary<S>> from Iterable<Unary<T, S>>
  Iterable<VoidResultUnaryAsync<S>> runVoidAsync() sync* {
    for (final function in this) {
      yield function.runVoidAsync;
    }
  }
}

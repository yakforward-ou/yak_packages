import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';

import '../all.dart';

extension IterableNullaryToResultNullaryX<T> on Iterable<Nullary<T>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Nullary<T>>
  Iterable<ResultNullary<T>> get run sync* {
    for (final function in this) {
      yield function.run;
    }
  }

  /// returns Iterable<VoidResultNullary> from Iterable<Nullary<T>>
  Iterable<VoidResultNullary> get runVoid sync* {
    for (final function in this) {
      yield function.runVoid;
    }
  }
}

extension IterableUnaryToResultUnaryX<T, S> on Iterable<Unary<T, S>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Unary<T, S>>
  Iterable<ResultUnary<T, S>> get run sync* {
    for (final function in this) {
      yield function.run;
    }
  }

  /// returns  Iterable<VoidResultUnary<S>> from Iterable<Unary<T, S>>
  Iterable<VoidResultUnary<S>> get runVoid sync* {
    for (final function in this) {
      yield function.runVoid;
    }
  }
}

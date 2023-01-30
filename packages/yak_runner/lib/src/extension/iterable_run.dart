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

extension IterableNullaryToResultNullaryAsyncX<T>
    on Iterable<NullaryFutureOr<T>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Nullary<T>>
  Iterable<ResultNullaryAsync<T>> get runAsync sync* {
    for (final function in this) {
      yield function.runAsync;
    }
  }

  /// returns Iterable<VoidResultNullary> from Iterable<Nullary<T>>
  Iterable<VoidResultNullaryAsync> get runVoidAsync sync* {
    for (final function in this) {
      yield function.runVoidAsync;
    }
  }
}

extension IterableUnaryToResultUnaryAsyncX<T, S>
    on Iterable<UnaryFutureOr<T, S>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Unary<T, S>>
  Iterable<ResultUnaryAsync<T, S>> get runAsync sync* {
    for (final function in this) {
      yield function.runAsync;
    }
  }

  /// returns  Iterable<VoidResultUnary<S>> from Iterable<Unary<T, S>>
  Iterable<VoidResultUnaryAsync<S>> get runVoidAsync sync* {
    for (final function in this) {
      yield function.runVoidAsync;
    }
  }
}

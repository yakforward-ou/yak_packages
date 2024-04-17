import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';

import 'run.dart';

extension IterableNullaryToResultNullaryX<T extends Object>
    on Iterable<Nullary<T>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Nullary<T>>
  /// TODO REWORK ITERATOR https://github.com/yakforward-ou/yak_packages/issues/238
  Iterable<ResultNullary<T>> get run sync* {
    for (final function in this) {
      yield function.run;
    }
  }

  /// returns Iterable<VoidResultNullary> from Iterable<Nullary<T>>
  /// TODO REWORK ITERATOR https://github.com/yakforward-ou/yak_packages/issues/238
  Iterable<VoidResultNullary> get runVoid sync* {
    for (final function in this) {
      yield function.runVoid;
    }
  }
}

extension IterableUnaryToResultUnaryX<T extends Object, S>
    on Iterable<Unary<T, S>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Unary<T, S>>
  /// TODO REWORK ITERATOR https://github.com/yakforward-ou/yak_packages/issues/238
  Iterable<ResultUnary<T, S>> get run sync* {
    for (final function in this) {
      yield function.run;
    }
  }
}

extension IterableUnaryToResultUnaryVoidX<T, S> on Iterable<Unary<T, S>> {
  /// returns  Iterable<VoidResultUnary<S>> from Iterable<Unary<T, S>>
  /// TODO REWORK ITERATOR https://github.com/yakforward-ou/yak_packages/issues/238
  Iterable<VoidResultUnary<S>> get runVoid sync* {
    for (final function in this) {
      yield function.runVoid;
    }
  }
}

extension IterableNullaryToResultNullaryAsyncX<T extends Object>
    on Iterable<NullaryFutureOr<T>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Nullary<T>>
  /// TODO REWORK ITERATOR https://github.com/yakforward-ou/yak_packages/issues/238
  Iterable<ResultNullaryAsync<T>> get runAsync sync* {
    for (final function in this) {
      yield function.runAsync;
    }
  }

  /// returns Iterable<VoidResultNullary> from Iterable<Nullary<T>>
  /// TODO REWORK ITERATOR https://github.com/yakforward-ou/yak_packages/issues/238

  Iterable<VoidResultNullaryAsync> get runVoidAsync sync* {
    for (final function in this) {
      yield function.runVoidAsync;
    }
  }
}

extension IterableUnaryToResultUnaryAsyncX<T extends Object, S>
    on Iterable<UnaryFutureOr<T, S>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Unary<T, S>>
  /// TODO REWORK ITERATOR https://github.com/yakforward-ou/yak_packages/issues/238
  Iterable<ResultUnaryAsync<T, S>> get runAsync sync* {
    for (final function in this) {
      yield function.runAsync;
    }
  }

  /// returns  Iterable<VoidResultUnary<S>> from Iterable<Unary<T, S>>
  /// TODO REWORK ITERATOR https://github.com/yakforward-ou/yak_packages/issues/238
  Iterable<VoidResultUnaryAsync<S>> get runVoidAsync sync* {
    for (final function in this) {
      yield function.runVoidAsync;
    }
  }
}

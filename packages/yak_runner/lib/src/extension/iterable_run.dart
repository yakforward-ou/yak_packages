import 'package:yak_result/yak_result.dart';
import 'package:yak_utils/yak_utils.dart';
import 'run.dart';

extension IterableNullaryToResultNullaryX<T extends Object>
    on Iterable<Nullary<T>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Nullary<T>>
  Iterable<ResultNullary<T>> get run =>
      [for (final function in this) function.run];

  /// returns Iterable<VoidResultNullary> from Iterable<Nullary<T>>
  Iterable<VoidResultNullary> get runVoid =>
      [for (final function in this) function.runVoid];
}

extension IterableUnaryToResultUnaryX<T extends Object, S extends Object>
    on Iterable<Unary<T, S>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Unary<T, S>>
  Iterable<ResultUnary<T, S>> get run =>
      [for (final function in this) function.run];
}

extension IterableUnaryToResultUnaryVoidX<T, S> on Iterable<Unary<T, S>> {
  /// returns  Iterable<VoidResultUnary<S>> from Iterable<Unary<T, S>>
  Iterable<VoidResultUnary<S>> get runVoid =>
      [for (final function in this) function.runVoid];
}

extension IterableNullaryToResultNullaryAsyncX<T extends Object>
    on Iterable<NullaryFutureOr<T>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Nullary<T>>
  Iterable<ResultNullaryAsync<T>> get runAsync =>
      [for (final function in this) function.runAsync];

  /// returns Iterable<VoidResultNullary> from Iterable<Nullary<T>>
  Iterable<VoidResultNullaryAsync> get runVoidAsync =>
      [for (final function in this) function.runVoidAsync];
}

extension IterableUnaryToResultUnaryAsyncX<T extends Object, S extends Object>
    on Iterable<UnaryFutureOr<T, S>> {
  /// returns  Iterable<ResultNullary<T>> from Iterable<Unary<T, S>>
  Iterable<ResultUnaryAsync<T, S>> get runAsync =>
      [for (final function in this) function.runAsync];

  /// returns  Iterable<VoidResultUnary<S>> from Iterable<Unary<T, S>>
  Iterable<VoidResultUnaryAsync<S>> get runVoidAsync =>
      [for (final function in this) function.runVoidAsync];
}

import 'package:yak_utils/yak_utils.dart' show Unary, UnaryAsync;
import 'package:yak_result/yak_result.dart' show ValueResult;

import '../all.dart';

/// `IterableRunX` runs a the values of an `Iterable` through a `runner`
extension IterableRunX<S> on Iterable<S> {
  /// runs the values of an iterable through a `ResultUnary`
  /// returns an `Iterable` of `Result`s
  Iterable<ValueResult<T>> run<T>(Unary<T, S> function) sync* {
    for (final s in this) {
      yield runUnary(function)(s);
    }
  }

  /// runs the values of an iterable through a `ResultUnaryAsync`
  /// returns an `Stream`of `Result`s
  /// note: if you need a Future<List> just append `.toList()`
  Stream<ValueResult<T>> runAsync<T>(
    UnaryAsync<T, S> function,
  ) async* {
    for (final s in this) {
      yield await runUnaryAsync(function)(s);
    }
  }
}

/// `StreamRunX` runs a the values of a `Stream` through a `runner`
extension StreamRunX<S> on Stream<S> {
  /// runs the values of a stream through a `ResultUnary`
  /// returns an `Stream`of `Result`s
  /// note: if you need a Future<List> just append `.toList()`
  Stream<ValueResult<T>> run<T>(Unary<T, S> function) async* {
    await for (final s in this) {
      yield runUnary(function)(s);
    }
  }

  /// runs the values of a stream through a `ResultUnaryAsync`
  /// returns an `Stream`of `Result`s
  /// note: if you need a Future<List> just append `.toList()`
  Stream<ValueResult<T>> runAsync<T>(UnaryAsync<T, S> function) async* {
    await for (final s in this) {
      yield await runUnaryAsync(function)(s);
    }
  }
}

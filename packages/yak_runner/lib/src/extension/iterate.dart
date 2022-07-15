import 'dart:async';

import '../all.dart';

/// `IterableRunX` runs a the values of an `Iterable` through a `runner`
extension IterableRunX<S> on Iterable<S> {
  /// runs the values of an iterable through a `ResultUnary`
  /// returns an `Iterable` of `Result`s
  Iterable<Result<T>> iterateRun<T>(ResultUnary<T, S> runner) sync* {
    for (final s in this) {
      yield runner(s);
    }
  }

  /// runs the values of an iterable through a `ResultUnaryAsync`
  /// returns an `Stream`of `Result`s
  /// note: if you need a Future<List> just append `.toList()`
  Stream<Result<T>> iterateRunAsync<T>(ResultUnaryAsync<T, S> runner) async* {
    for (final s in this) {
      yield await runner(s);
    }
  }
}

/// `StreamRunX` runs a the values of a `Stream` through a `runner`
extension StreamRunX<S> on Stream<S> {
  /// runs the values of a stream through a `ResultUnary`
  /// returns an `Stream`of `Result`s
  /// note: if you need a Future<List> just append `.toList()`
  Stream<Result<T>> transformRun<T>(ResultUnary<T, S> runner) async* {
    await for (final s in this) {
      yield runner(s);
    }
  }

  /// runs the values of a stream through a `ResultUnaryAsync`
  /// returns an `Stream`of `Result`s
  /// note: if you need a Future<List> just append `.toList()`
  Stream<Result<T>> transformRunAsync<T>(ResultUnaryAsync<T, S> runner) async* {
    await for (final s in this) {
      yield await runner(s);
    }
  }
}

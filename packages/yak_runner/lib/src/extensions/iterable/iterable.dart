import 'dart:async';

import '../../../yak_runner.dart';

/// an extension to handle runners with `Iterable`s
extension IterableRunnerX<S> on Iterable<S> {
  /// a `sync` implementatio
  /// a `UnaryRunner` can be taken as argument
  Result<Iterable<T>> iterate<T>(Unary<Result<T>, S> runner) {
    final successes = <Success<T>>[];
    for (final s in this) {
      final r = runner(s);
      if (r is Failure) {
        final f = r as Failure<T>;
        return f.ofType<Iterable<T>>();
      }
      successes.add(r as Success<T>);
    }
    return Result.success([for (final s in successes) s.data]);
  }

  /// an `async` implementation
  Future<Result<Iterable<T>>> iterateAsync<T>(
    /// a `UnaryRunnerAsync` can be taken as argument
    Unary<Future<Result<T>>, FutureOr<S>> runner,
  ) async {
    final successes = <Success<T>>[];
    for (final s in this) {
      final r = await runner(s);
      if (r is Failure) {
        final f = r as Failure<T>;
        return f.ofType<Iterable<T>>();
      }
      successes.add(r as Success<T>);
    }
    return Result.success([for (final s in successes) s.data]);
  }
}

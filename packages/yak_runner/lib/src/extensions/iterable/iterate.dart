import '../../../yak_runner.dart';

/// an extension to handle runners with `Iterable`s
extension IterableRunnerX<T, S> on UnaryRunner<T, S> {
  /// a `sync` implementation
  Result<Iterable<T>> iterate(Iterable<S> iterable) {
    final data = <T>[];
    for (final s in iterable) {
      final r = this(s);
      if (r is Failure) {
        return (r as Failure<T>).ofType<Iterable<T>>();
      }
      data.add((r as Success<T>).data);
    }
    return Success<Iterable<T>>(data);
  }
}

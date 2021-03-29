import '../../../yak_runner.dart';

/// an extension to handle runners with `Iterable`s
extension IterableRunnerAsyncX<T, S> on UnaryRunnerAsync<T, S> {
  /// a `sync` implementation
  Future<Result<Iterable<T>>> iterate(Iterable<S> iterable) async {
    final data = <T>[];
    for (final s in iterable) {
      final r = await this(s);
      if (r is Failure) {
        return (r as Failure<T>).ofType<Iterable<T>>();
      }
      data.add((r as Success<T>).data);
    }
    return Success<Iterable<T>>(data);
  }
}

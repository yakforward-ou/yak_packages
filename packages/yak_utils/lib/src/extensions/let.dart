import 'dart:async';

import '../types/all.dart';

/// an extension on an object that uses it in a given unary
extension LetX<T, S> on T {
  S let(Unary<S, T> function) => function(this);
}

/// an extension on an object that uses it in a given unary
extension LetAsyncX<T, S> on FutureOr<T> {
  Future<S> letAsync(UnaryAsync<S, T> function) async =>
      await function(await this);
}

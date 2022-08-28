import '../types/all.dart';

/// an extension that allow to concatenate functions
///
/// ```dart
/// final result = begin.let(foo).let(bar).let(baz);
/// ```
extension ThenSyncX<T, S> on S {
  T then<R extends Unary<T, S>>(R function) => function(this);
}

// /// an extension that allow to concatenate async functions
// ///
// /// ```dart
// /// final result = await begin.let(foo).let(bar).let(baz);
// /// ```
// extension LetAsyncX<T, S> on FutureOr<S> {
//   Future<T> letAsync<R extends UnaryAsync<T, S>>(R function) async =>
//       await function(await this);
// }
